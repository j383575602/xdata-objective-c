//
//  IntArrayMap.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "IntArrayMap.h"
#import "xtype.h"

@interface IntArrayMap()

@property NSMutableDictionary* map;

@end



@implementation IntArrayMap
-(instancetype) init {
    self.map = [[NSMutableDictionary alloc] init];
    return self;
}
-(id)getValueForKey:(NSInteger)key {
    NSString *sKey = [NSString stringWithFormat:@"%ld",key];
    return [self.map valueForKey:sKey];
}
-(void)setValue:(id)value forKey:(NSInteger)key {
    NSString *sKey = [NSString stringWithFormat:@"%ld",key];
    return [self.map setValue:value forKey:sKey];
}
@end
