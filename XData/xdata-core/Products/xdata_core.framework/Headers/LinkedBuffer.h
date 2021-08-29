//
//  LinkedBuffer.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkedBuffer : NSObject
-(instancetype) initWithSize:(NSInteger)size;
-(void) writeByte:(Byte) byte;
-(void) writeBytes:(Byte*) bytes length:(NSInteger) count;
-(NSInteger) getPosition;
-(NSInteger) getTotalSize;
-(Byte*) toBytes;
-(NSData*) toData;
-(void) seek:(NSInteger) position;
-(void) jump:(NSInteger) count;
@end



NS_ASSUME_NONNULL_END
