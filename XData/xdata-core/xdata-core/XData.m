//
//  XData.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "XData.h"
@interface XData()
@property NSMutableDictionary<NSNumber*,NSObject*>* fields;
@property NSInteger type;
@end

@implementation XData

-(id) initWithType:(NSInteger) type {
    self = [super init];
    self.type = type;
    self.fields = [[NSMutableDictionary alloc] init];
    return self;
}
-(NSDictionary<NSNumber*,NSObject*>*) getFields {
    return self.fields;
}

-(NSInteger) getType {
    return self.type;
}

-(XData*) setValue:(NSObject *)value forIndex:(NSInteger)index {
    NSInteger basicType = index & XDATA_MASK_TYPE & ~XDATA_MASK_TYPE_COLLECTION;
    NSInteger collectionFlag = (index & XDATA_MASK_TYPE_COLLECTION);
    if (collectionFlag != 0) {
        if(value == nil) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        }
        if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_LIST) {
            if ([value isKindOfClass:NSArray.class]) {
                NSArray* list = (NSArray*) value;
                if (list.count == 0) {
                    [self.fields removeObjectForKey:@(index)];
                } else {
                    [self.fields setObject:value forKey:@(index)];
                }
            } else {
                [NSException raise:@"WrongDataType" format:@"wrong value %p, for list at index:%ld",value,index];
            }
        } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_SET) {
            if ([value isKindOfClass:NSSet.class]) {
                NSSet* list = (NSSet*) value;
                if (list.count == 0) {
                    [self.fields removeObjectForKey:@(index)];
                } else {
                    [self.fields setObject:value forKey:@(index)];
                }
            } else {
                [NSException raise:@"WrongDataType" format:@"wrong value %p, for set at index:%ld",value,index];
            }
        } else if (collectionFlag == XDATA_MASK_TYPE_COLLECTION_STRING_MAP
                   || collectionFlag == XDATA_MASK_TYPE_COLLECTION_INT_MAP
                   || collectionFlag == XDATA_MASK_TYPE_COLLECTION_LONG_MAP
                   || collectionFlag == XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP
                   || collectionFlag == XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP
                   ) {
            if ([value isKindOfClass:NSDictionary.class]) {
                NSDictionary* list = (NSDictionary*) value;
                if (list.count == 0) {
                    [self.fields removeObjectForKey:@(index)];
                } else {
                    [self.fields setObject:value forKey:@(index)];
                }
            } else {
                [NSException raise:@"WrongDataType" format:@"wrong value %p, for set at index:%ld",value,index];
            }
        }
    } else if (basicType == XDATA_TYPE_BOOLEAN) {
        if (value == nil) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        }
        BOOL v = ((NSNumber*) value).boolValue;
        if (v == NO) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_i_1) {
        if (!([value isKindOfClass:NSNumber.class])) {
           [NSException raise:@"WrongDataType" format:@"wrong value %p, for byte at index:%ld",value,index];
        }
        SInt8 bvalue = ((NSNumber*)value).intValue;
        if (bvalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_i_2) {
        if (!([value isKindOfClass:NSNumber.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for short at index:%ld",value,index];
        }
        SInt16 svalue = ((NSNumber*)value).shortValue;
        if (svalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_i_4) {
        if (!([value isKindOfClass:NSNumber.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for int at index:%ld",value,index];
        }
        NSInteger ivalue = ((NSNumber*)value).integerValue;
        if (ivalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_i_8) {
        if (!([value isKindOfClass:NSNumber.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for long at index:%ld",value,index];
        }
        SInt64 lvalue = ((NSNumber*) value).longLongValue;
        if (lvalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_f_4) {
        if (!([value isKindOfClass:NSNumber.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for float at index:%ld",value,index];
        }
        float fvalue = ((NSNumber*)value).floatValue;
        if (fvalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_BYTE_f_8) {
        if (!([value isKindOfClass:NSNumber.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for double at index:%ld",value,index];
        }
        double dvalue = ((NSNumber*)value).doubleValue;
        if (dvalue == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_STRING) {
        if (value == nil || [@"" isEqualToString:value]) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        }
        if (!([value isKindOfClass:NSString.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for String at index:%ld",value,index];
        }
        [self.fields setObject:value forKey:@(index)];
    } else if (basicType == XDATA_TYPE_BLOB) {
        if (value == nil) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        }
        if (!([value isKindOfClass:NSData.class])) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for NSData at index:%ld",value,index];
        }
        NSData* b = (NSData*) value;
        if (b.length == 0) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            [self.fields setObject:value forKey:@(index)];
        }
    } else if (basicType == XDATA_TYPE_DATE) {
        if (value == nil) {
            [self.fields removeObjectForKey:@(index)];
            return self;
        }
        if (![value isKindOfClass:NSDate.class]) {
            [NSException raise:@"WrongDataType" format:@"wrong value %p, for NSDate at index:%ld",value,index];
        }
        [self.fields setObject:value forKey:@(index)];
    } else if ((basicType > XDATA_TYPE_OBJECT_START)) {
        if (value == nil) {
            [self.fields removeObjectForKey:@(index)];
        } else {
            if ([value isKindOfClass:XData.class]) {
                [self.fields setObject:value forKey:@(index)];
            } else {
                [NSException raise:@"WrongDataType" format:@"wrong value %p, for XData at index:%ld",value,index];
            }
        }
    }
    return self;
}

-(SInt8) getByte:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).integerValue;
}
-(SInt16) getShort:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).shortValue;
}
-(NSInteger) getInteger:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).integerValue;
}
-(SInt64)getLong:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).longLongValue;
}
-(Float32) getFloat:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).floatValue;
}
-(Float64) getDouble:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? 0 : ((NSNumber*)value).doubleValue;
}
-(BOOL) getBool:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? NO : ((NSNumber*)value).integerValue ==1;
}
-(NSData*) getBlob:(NSInteger) key {
    NSObject * value = [self.fields objectForKey:@(key)];
    return value == nil ? nil : (NSData*)value;
}
-(NSString*) getString:(NSInteger) key {
    return (NSString*)[self.fields objectForKey:@(key)];
}
-(XData*) getData:(NSInteger) key {
    return (XData*)[self.fields objectForKey:@(key)];
}
-(NSArray*) getDataList:(NSInteger) key {
    return (NSArray*)[self.fields objectForKey:@(key)];
}
-(NSDate*) getDate:(NSInteger) key {
    return (NSDate*)[self.fields objectForKey:@(key)];
}
-(NSSet*) getDataSet:(NSInteger)key {
    return (NSSet*)[self.fields objectForKey:@(key)];
}
-(NSDictionary*) getDataMap:(NSInteger)key {
    return (NSDictionary*)[self.fields objectForKey:@(key)];
}

@end
