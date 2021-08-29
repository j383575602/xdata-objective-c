//
//  XDataWrapper.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/2/6.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "XDataWrapper.h"

@implementation XDataWrapper
-(instancetype) initWithType:(NSInteger)type {
    self = [super initWithType:type];
    return self;
}
-(instancetype) initWithXData:(XData *)xdata {
    self = [super initWithType:[xdata getType]];
    [self wrapData:xdata];
    return self;
}

-(void) wrapData:(XData *)data {
    if ([data isKindOfClass:XDataWrapper.class]) {
        [NSException raise:@"XDataWrapException" format:@"could not wrap a xdatawrapper"];
    }
    self.data = data;
}

-(XDataWrapper*) setValue:(NSObject*) value forIndex:(NSInteger) index {
    if (self.data != nil) {
        [self.data setValue:value forIndex:index];
    } else {
        [super setValue:value forIndex:index];
    }
    return self;
}

-(SInt8) getByte:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getByte:key];
    }
    return [super getByte:key];
}
-(SInt16) getShort:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getShort:key];
    }
    return [super getShort:key];
}
-(NSInteger) getInteger:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getInteger:key];
    }
    return [super getInteger:key];
}
-(SInt64)getLong:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getLong:key];
    }
    return [super getLong:key];
}
-(Float32) getFloat:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getFloat:key];
    }
    return [super getFloat:key];
}
-(Float64) getDouble:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getDouble:key];
    }
    return [super getDouble:key];
}
-(BOOL) getBool:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getBool:key];
    }
    return [super getBool:key];
}
-(NSData*) getBlob:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getBlob:key];
    }
    return [super getBlob: key];
}
-(NSString*) getString:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getString:key];
    }
    return [super getString: key];
}
-(XData*) getData:(NSInteger) key {
    if (self.data !=nil) {
        return [self.data getData:key];
    }
    return [super getData:key];
}
-(NSArray*) getDataList:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getDataList:key];
    }
    return [super getDataList:key];
}
-(NSDate*) getDate:(NSInteger) key {
    if (self.data != nil) {
        return [self.data getDate:key];
    }
    return [super getDate:key];
}

-(NSSet*) getDataSet:(NSInteger)key {
    if (self.data != nil) {
        return [self.data getDataSet:key];
    }
    return [super getDataSet:key];
}

-(NSDictionary*) getDataMap:(NSInteger)key {
    if (self.data != nil) {
        return [self.data getDataMap:key];
    }
    return [super getDataMap:key];
}
@end
