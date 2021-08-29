//
//  XDataWrapper.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/2/6.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XData.h"

NS_ASSUME_NONNULL_BEGIN

@interface XDataWrapper : XData
@property XData* data;
-(instancetype) initWithType:(NSInteger)type;
-(instancetype)initWithXData:(XData*)xdata;
@end

NS_ASSUME_NONNULL_END
