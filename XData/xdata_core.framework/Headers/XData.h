//
//  XData.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "xtype.h"

NS_ASSUME_NONNULL_BEGIN

@interface XData : NSObject
-(id)initWithType:(NSInteger) type;
-(NSInteger)getType;
-(XData*) setValue:(NSObject*) value forIndex:(NSInteger) index;
-(SInt8) getByte:(NSInteger) key;
-(SInt16) getShort:(NSInteger) key;
-(NSInteger) getInteger:(NSInteger) key;
-(SInt64)getLong:(NSInteger) key;
-(Float32) getFloat:(NSInteger) key;
-(Float64) getDouble:(NSInteger) key;
-(BOOL) getBool:(NSInteger) key;
-(NSData*) getBlob:(NSInteger) key;
-(NSString*) getString:(NSInteger) key;
-(XData*) getData:(NSInteger) key;
-(NSArray*) getDataList:(NSInteger) key;
-(NSDate*) getDate:(NSInteger) key;
-(NSDictionary<NSNumber*,NSObject*>*) getFields;
@end

NS_ASSUME_NONNULL_END
