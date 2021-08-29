//
//  XDataParser.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/2/5.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XData.h"

NS_ASSUME_NONNULL_BEGIN

@interface XDataParser : NSObject

-(instancetype) init;
-(XData*) parse:(NSData*) data;
@end

NS_ASSUME_NONNULL_END
