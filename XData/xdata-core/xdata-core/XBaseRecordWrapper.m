//
//  XBaseRecordWrapper.m
//  xdata_core
//
//  Created by zhaoweilin on 2021/2/5.
//  Copyright © 2021 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBaseRecordWrapper.h"

@interface XBaseRecordWrapper()
@end

@implementation XBaseRecordWrapper

-(instancetype) init {
    self = [super initWithType: XBaseRecord_TYPE_INDEX];
    return self;
}
-(void) set_ID:(NSInteger)_ID{
    [super setValue:@(_ID) forIndex:XBaseRecord_ID];
}

-(NSInteger) _ID {
    return [super getInteger:XBaseRecord_ID];
}

-(void) setSTATUS:(SInt8)STATUS{
    [super setValue:@(STATUS) forIndex:XBaseRecord_STATUS];
}

-(SInt8) STATUS {
    return [super getByte:XBaseRecord_STATUS];
}

-(void) setADD_VERSION:(SInt16)ADD_VERSION {
    [super setValue:@(ADD_VERSION) forIndex:XBaseRecord_ADD_VERSION];
}
-(SInt16) ADD_VERSION {
    return [super getShort:XBaseRecord_ADD_VERSION];
}
-(void) setVERSION:(SInt16)VERSION {
    [super setValue:@(VERSION) forIndex:XBaseRecord_VERSION];
}
-(SInt16) VERSION {
    return [super getShort:XBaseRecord_VERSION];
}

@end
