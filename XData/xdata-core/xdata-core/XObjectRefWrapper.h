//
//  XObjectRef.h
//  xdata_core
//
//  Created by zhaoweilin on 2021/2/5.
//  Copyright © 2021 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XDataWrapper.h"
#import "XData.h"

NS_ASSUME_NONNULL_BEGIN

@interface XObjectRefWrapper : XDataWrapper
-(instancetype) init;
/**
 * 引用关系的所有者
 */
@property NSInteger OWNER_ID;
/**
 * 所有者的类型，在查询有个所有者持有其他类的引用时的查询条件
 */
@property NSInteger OWNER_TYPE;
/**
 * 所有者的哪一个属性上的引用
 */
@property NSInteger OWNER_PROP;
/**
 * 被应用对象的类型
 */
@property NSInteger REF_TYPE;
/**
 * 被引用对象的ID
 */
@property NSInteger REF_ID;
    

@end

NS_ASSUME_NONNULL_END
