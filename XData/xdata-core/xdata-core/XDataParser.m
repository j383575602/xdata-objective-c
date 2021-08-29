//
//  XDataParser.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/2/5.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "XDataParser.h"
@interface XDataParser()
@property NSData * data;
@property NSInteger position;
@end

@implementation XDataParser


-(instancetype) init {
    self = [super init];
    return self;
}

-(XData*) parse:(NSData *)data {
    self.data = data;
    self.position = 0;
    XData * result = [self readData];
    return result;
}

-(XData*) readDataWithType:(NSInteger) type {
    XData * result = [[XData alloc] initWithType:type];
    Byte fieldCount = [self readByte];
    for(int i=0;i<fieldCount;i++) {
        NSInteger index = [self readInt];
        NSInteger collectionFlag = index & XDATA_MASK_TYPE_COLLECTION;
        NSInteger rawType = (index & XDATA_MASK_TYPE) & ~XDATA_MASK_TYPE_COLLECTION;
        if (collectionFlag !=0) {
            if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_LIST) {
                [result setValue:[self readList: rawType] forIndex:index];
            } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_SET) {
                [result setValue:[self readSet: rawType] forIndex:index];
            } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_STRING_MAP
                       ||collectionFlag == XDATA_MASK_TYPE_COLLECTION_INT_MAP
                       ||collectionFlag == XDATA_MASK_TYPE_COLLECTION_LONG_MAP
                       ||collectionFlag == XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP
                       ||collectionFlag == XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP
                       ) {
                [result setValue:[self readMap:rawType mapFlag:(collectionFlag)] forIndex:index];
            }
        } else {
            NSObject* val =[self readSingleField: rawType];
            [result setValue:val forIndex:index];
        }
    }
    return result;
}

-(XData*) readData {
    NSInteger type = [self readInt];
    return [self readDataWithType:type];
}

-(NSObject*) readSingleField:(NSInteger) rawType {
    if (rawType == XDATA_TYPE_BYTE_i_1) {
        NSObject* result =  @([self readByte]);
        return  result;
    } else if (rawType == XDATA_TYPE_BYTE_i_2) {
        return @([self readShort]);
    } else if (rawType == XDATA_TYPE_BYTE_i_4) {
        return @([self readInt]);
    } else if (rawType == XDATA_TYPE_BYTE_i_8) {
        SInt64 l = (SInt64)[self readDouble];//TODO :check
        return  @(l);
    } else if (rawType == XDATA_TYPE_BYTE_f_4) {
        return @([self readFloat]);
    } else if (rawType == XDATA_TYPE_BYTE_f_8) {
        Float64 l = [self readDouble];
        return @(l);
    } else if (rawType == XDATA_TYPE_STRING) {
        return [self readStringField];
    } else if (rawType == XDATA_TYPE_BOOLEAN) {
        Byte value = [self readByte];
        return @(value == 1);
    } else if (rawType == XDATA_TYPE_BLOB) {
        NSInteger len = [self readInt];
        return [self readBytes:(len)];
    } else if (rawType == XDATA_TYPE_DATE) {
        SInt64 l = (SInt64)[self readDouble];
        return [[NSDate alloc] initWithTimeIntervalSince1970:l/1000];
    } else if(rawType > XDATA_TYPE_OBJECT_START) {
        XData* xData2 = [self readDataWithType:rawType];
        return xData2;
    }
    return nil;
}

-(NSString*) readStringField {
    NSInteger len = [self readInt];
    return [self readString:(len) ];
}

-(NSData*) readBytes:(NSInteger) len {
    NSData * sub = [self.data subdataWithRange:NSMakeRange(self.position, len)];
    self.position += len;
    return sub;
}

-(NSArray*) readList:(NSInteger) rawType {
    NSInteger count = [self readInt];
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:count];
    for (int j = 0; j < count; j++) {
        NSObject* value = [self readSingleField:rawType];
        [result addObject:value];
    }
    return result;
}

-(NSSet*) readSet:(NSInteger) rawType {
    NSInteger count = [self readInt];
    NSMutableSet* result = [[NSMutableSet alloc] initWithCapacity:count];
    for (int j = 0; j < count; j++) {
        NSObject* value = [self readSingleField:rawType];
        [result addObject:value];
    }
    return result;
}

-(NSDictionary*) readMap:(NSInteger) rawType mapFlag:(NSInteger) mapFlag{
    NSInteger count = [self readInt];
    if (mapFlag == XDATA_MASK_TYPE_COLLECTION_STRING_MAP) {
        NSMutableDictionary<NSString*,NSObject*>* result = [[NSMutableDictionary<NSString*,NSObject*> alloc] initWithCapacity:count];
        for (int j = 0; j < count; j++) {
            NSString * key = [self readStringField];
            NSObject* value = [self readSingleField:rawType];
            [result setObject:value forKeyedSubscript:key];
        }
        return result;
    }
    NSMutableDictionary<NSNumber*,NSObject*>* result = [[NSMutableDictionary<NSNumber*,NSObject*> alloc] initWithCapacity:count];
    for (int j = 0; j < count; j++) {
        NSNumber * key = nil;
        if (mapFlag == XDATA_MASK_TYPE_COLLECTION_INT_MAP) {
            key = @([self readInt]);
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_LONG_MAP) {
            key = @([self readLong]);
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP) {
            key = @([self readFloat]);
        } else if (mapFlag == XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP) {
            key = @([self readDouble]);
        } else {
            [NSException raise:@"WrongDataType" format:@"wrong collection flag %ld",mapFlag];
        }
        NSObject* value = [self readSingleField:rawType];
        [result setObject:value forKeyedSubscript:key];
    }
    return result;
}

-(NSInteger) readInt {
    return ((([self readByte] & 0xFF) << 24)
            | (([self readByte] & 0xFF) << 16)
            | (([self readByte]& 0xFF) << 8)
            | ([self readByte] & 0xFF));
}
-(short) readShort {
       return (short) ((([self readByte]& 0xFF) << 8)
                       | ([self readByte] & 0xFF));
   }

-(SInt64) readLong {
       return ((((SInt64) [self readByte] & 0xFF)) << 56) |
               (((SInt64) [self readByte] & 0xFF) << 48) |
               (((SInt64) [self readByte] & 0xFF) << 40) |
               (((SInt64) [self readByte] & 0xFF) << 32) |
               (((SInt64) [self readByte] & 0xFF) << 24) |
               (((SInt64) [self readByte] & 0xFF) << 16) |
               (((SInt64) [self readByte] & 0xFF) << 8) |
               (((SInt64) [self readByte] & 0xFF));
   }
-(Byte) readByte {
    Byte* bytes = [self.data bytes];
    Byte b = bytes[self.position];
    self.position++;
    return b;
}
-(Float32) readFloat {
    Byte byte4[4] ;
    byte4[3] = [self readByte];
    byte4[2] = [self readByte];
    byte4[1] = [self readByte];
    byte4[0] = [self readByte];
    Float32 result;
    memcpy(&result, byte4, 4);
    return result;
}

-(Float64) readDouble {
    Byte byte8[8] ;
    byte8[7] = [self readByte];
    byte8[6] = [self readByte];
    byte8[5] = [self readByte];
    byte8[4] = [self readByte];
    byte8[3] = [self readByte];
    byte8[2] = [self readByte];
    byte8[1] = [self readByte];
    byte8[0] = [self readByte];
    Float64 result;
    memcpy(&result, byte8, 8);
    return result;
}

-(NSString*) readString:(NSInteger) len {
    NSData * sub = [self readBytes:len];
    NSString* string =  [[NSString alloc] initWithData:sub encoding:NSUTF8StringEncoding];
    return string;
}

@end
