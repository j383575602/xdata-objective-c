//
//  XDataWriter.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XData.h"

NS_ASSUME_NONNULL_BEGIN

@interface XDataWriter : NSObject
-(instancetype)init;
-(NSData*) writeData:(XData*) data;
@end

NS_ASSUME_NONNULL_END
