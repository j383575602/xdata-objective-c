//
//  XObjectRef.m
//  xdata_core
//
//  Created by zhaoweilin on 2021/2/5.
//  Copyright © 2021 zhangxiuyin. All rights reserved.
//

#import "XObjectRefWrapper.h"
#import "XData.h"
#import "XObjectRef.h"

@interface XObjectRefWrapper()
@end

@implementation XObjectRefWrapper

-(instancetype) init {
    self = [super initWithType: XObjectRef_TYPE_INDEX];
    return self;
}

-(NSInteger) OWNER_ID {
    return [super getInteger:XObjectRef_OWNER_ID];
}
-(void) setOWNER_ID:(NSInteger)OWNER_ID {
    [super setValue:@(OWNER_ID) forIndex:XObjectRef_OWNER_ID];
}
-(NSInteger)OWNER_TYPE {
    return [super getInteger:XObjectRef_OWNER_TYPE];
}
-(void) setOWNER_TYPE:(NSInteger)OWNER_TYPE {
    [super setValue:@(OWNER_TYPE) forIndex:XObjectRef_OWNER_TYPE];
}

-(NSInteger)OWNER_PROP {
    return [super getInteger:XObjectRef_OWNER_PROP];
}
-(void) setOWNER_PROP:(NSInteger)OWNER_PROP {
    [super setValue:@(OWNER_PROP) forIndex:XObjectRef_OWNER_PROP];
}

-(NSInteger)REF_TYPE {
    return [super getInteger:XObjectRef_REF_TYPE];
}
-(void) setREF_TYPE:(NSInteger)REF_TYPE {
    [super setValue:@(REF_TYPE) forIndex:XObjectRef_REF_TYPE];
}

-(NSInteger)REF_ID {
    return [super getInteger:XObjectRef_REF_ID];
}
-(void) setREF_ID:(NSInteger)REF_ID {
    [super setValue:@(REF_ID) forIndex:XObjectRef_REF_ID];
}

@end
