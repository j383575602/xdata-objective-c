//
//  XDataWriter.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "XDataWriter.h"
#import "XData.h"
#import "LinkedBuffer.h"
#import "XDataWrapper.h"

@interface XDataWriter()
@property LinkedBuffer* buffer;
@property NSInteger infoSize;
@end

@implementation XDataWriter

-(instancetype) init {
    self.buffer = [[LinkedBuffer alloc] initWithSize:8192];
    return self;
}

-(NSData*)writeData:(XData*) data {
    [self doWriteData:data];
    return [self.buffer toData];
}

-(void) doWriteData:(XData*) data {
    XData* _data = data;
    if ([data isKindOfClass:XDataWrapper.class]) {
        XDataWrapper* wrapper = (XDataWrapper*)data;
        if (wrapper.data != nil) {
            _data = wrapper.data;
        }
    }
    [self writeType:_data];
    [self writeFieldCount:_data];
    [self writeFieldValue:_data];
}

-(void) doWriteDataWithoutType:(XData*) data {
    XData* _data = data;
    if ([data isKindOfClass:XDataWrapper.class]) {
        XDataWrapper* wrapper = (XDataWrapper*)data;
        if (wrapper.data != nil) {
            _data = wrapper.data;
        }
    }
    [self writeFieldCount:_data];
    [self writeFieldValue:_data];
}

-(void) writeType:(XData*) data {
    [self writeByte4I:[data getType]];
    self.infoSize += 4;
}
-(void) writeFieldCount:(XData*) data {
    NSDictionary<NSNumber*,NSObject*> *fields = [data getFields];
    NSInteger count = fields.count;
    [self writeByte:count];
    self.infoSize++;
}
-(void) writeFieldValue:(XData*) data {
    NSDictionary<NSNumber*,NSObject*> *fields = [data getFields];
    [fields enumerateKeysAndObjectsUsingBlock:^(NSNumber* key,NSObject* value,BOOL *stop){
        NSInteger index  = key.integerValue;
        [self writeByte4I:index];
        self.infoSize += 4;
        NSInteger collectionFlag = index & XDATA_MASK_TYPE_COLLECTION;
        NSInteger rawType = index & XDATA_MASK_TYPE & (~XDATA_MASK_TYPE_COLLECTION);
        if (collectionFlag != 0) {
            [self writeCollection:collectionFlag rawType:rawType value:value];
        } else {
            [self writeSingleObject:value rawType:rawType];
        }
    }];
}

-(void) writeCollection:(NSInteger) collectionFlag rawType:(NSInteger) rawType value:(NSObject*) obj {
    if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_LIST) {
        NSArray* list = (NSArray*)obj;
        [self writeList:list rawType:rawType];
    } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_SET) {
        NSSet* set = (NSSet*) obj;
        [self writeSet:set rawType:rawType];
    } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_STRING_MAP
               || collectionFlag == XDATA_MASK_TYPE_COLLECTION_INT_MAP
               || collectionFlag == XDATA_MASK_TYPE_COLLECTION_LONG_MAP
               || collectionFlag == XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP
               || collectionFlag == XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP
               ) {
        NSDictionary* dictionary = (NSDictionary*)obj;
        [self writeMap:dictionary mapFlag:collectionFlag rawType:rawType];
    }
}

-(void) writeBlob:(NSData*) array {
    NSInteger len =  array.length;
    [self writeByte4I:len];
    self.infoSize += 4;
    [self.buffer writeBytes:array.bytes length:len];
}

- (void) writeBoolean:(BOOL) value {
    Byte b = value ? (Byte)1 : (Byte)0;
    [self writeByte:b];
}

- (void) writeList:(NSArray*) values rawType:(NSInteger) rawType {
    NSInteger len = values.count;
    [self writeByte4I:(len)];
    self.infoSize += 2;
    for(NSObject* rawValue in values) {
        [self writeSingleObject:rawValue rawType:rawType];
    }
}

- (void) writeSet:(NSSet*) values rawType:(NSInteger) rawType {
    NSInteger len = values.count;
    [self writeByte4I:(len)];
    self.infoSize += 2;
    for(NSObject* rawValue in values) {
        [self writeSingleObject:rawValue rawType:rawType];
    }
}

- (void) writeMap:(NSDictionary*) values mapFlag:(NSInteger) mapFlag rawType:(NSInteger) rawType {
    NSInteger len = values.count;
    [self writeByte4I:(len)];
    self.infoSize += 2;
    [values enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (mapFlag == XDATA_MASK_TYPE_COLLECTION_STRING_MAP) {
            NSString * str = (NSString*)key;
            [self writeStringField:str];
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_INT_MAP) {
            NSNumber* number = (NSNumber*)key;
            NSInteger intKey = number.intValue;
            [self writeByte4I:intKey];
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_LONG_MAP) {
            NSNumber* number = (NSNumber*) key;
            SInt64 longKey = number.longLongValue;
            [self writeByte8F:longKey];
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP) {
            NSNumber* number = (NSNumber*) key;
            float floatKey = number.floatValue;
            [self writeByte4F:floatKey];
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP) {
            NSNumber* number = (NSNumber*) key;
            double doubleKey = number.doubleValue;
            [self writeByte8F:doubleKey];
        }
        [self writeSingleObject:obj rawType:rawType];
    }];
}

-(void) writeSingleObject:(NSObject*) rawValue rawType:(NSInteger) rawType {
    if (rawType == XDATA_TYPE_BYTE_i_1) {
        SInt8 value = ((NSNumber*) rawValue).integerValue;
        [self writeByte:(value)];
    } else if (rawType == XDATA_TYPE_BYTE_i_2) {
        SInt16 value = ((NSNumber*) rawValue).shortValue;
       [self writeByte2:(value)];
    } else if (rawType == XDATA_TYPE_BYTE_i_4) {
        NSInteger value = ((NSNumber*) rawValue).intValue;
        [self writeByte4I:value];
    } else if (rawType == XDATA_TYPE_BYTE_i_8) {
        SInt64 value = ((NSNumber*) rawValue).longLongValue;
        [self writeByte8F:(value)];
    } else if (rawType == XDATA_TYPE_BYTE_f_4) {
        float value = ((NSNumber*) rawValue).floatValue;
        [self writeByte4F:(value)];
    } else if (rawType == XDATA_TYPE_BYTE_f_8) {
        double value = ((NSNumber*) rawValue).doubleValue;
        [self writeByte8F:(value)];
    } else if (rawType == XDATA_TYPE_BLOB) {
        NSData* value = (NSData*)rawValue;
        [self writeBlob:value];
    } else if (rawType == XDATA_TYPE_DATE) {
        NSDate *d = (NSDate*) rawValue;
        long long time = d.timeIntervalSince1970 * 1000;
        [self writeByte8F:(time)];
    } else if (rawType == XDATA_TYPE_BOOLEAN) {
        BOOL b = (BOOL) rawValue;
        [self writeBoolean:(b) ];
    } else if (rawType == XDATA_TYPE_STRING) {
        NSString* str = (NSString*) rawValue;
        [self writeStringField:str];
    } else if (rawType > XDATA_TYPE_OBJECT_START) {
        XData* data = (XData*) rawValue;
        [self doWriteDataWithoutType:data];
    } else {
        NSLog(@"Note support type :%ld",rawType);
    }
}

-(void) writeByte:(Byte) b {
    [self.buffer writeByte:(b) ];
}

-(void) writeByte2:(short) s {
    [self.buffer writeByte:((Byte) ((s >> 8) & 0xFF))];
    [self. buffer writeByte:((Byte) (s & 0xFF))];
}

-(void) writeByte4I:(NSInteger) i{
    for (NSInteger index = 3; index >= 0; index--) {
        [self.buffer writeByte: ((Byte) ((i >> index * 8) & 0xFF))];
    }
}

- (void) writeByte8I:(long long) i {
    for (int index = 7; index >= 0; index--) {
        [self.buffer writeByte:((Byte) ((i >> index * 8) & 0xFF))];
    }
}

- (void) writeByte4F:(float) i {
    Byte* bytes = (Byte*)&i;
    for(int i=3;i>=0;i--) {
         [self.buffer writeByte:bytes[i]];
    }
}

- (void) writeByte8F:(double) i {
    Byte* bytes = (Byte*)&i;
    for(int i=7;i>=0;i--) {
        [self.buffer writeByte:bytes[i]];
    }
}

-(void)  writeStringField:(NSString*) rawValue {
    NSData * data = [rawValue dataUsingEncoding:NSUTF8StringEncoding];
    [self writeByte4I:data.length];
    [self.buffer writeBytes:data.bytes length:data.length];
}
@end
