//
//  IntArrayMap.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntArrayMap : NSObject
-(void)setValue:(id)value forKey:(NSInteger) key;
-(id) getValueForKey:(NSInteger) key;
@end

NS_ASSUME_NONNULL_END
