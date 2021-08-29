//
//  XBaseRecordWrapper.h
//  xdata_core
//
//  Created by zhaoweilin on 2021/2/5.
//  Copyright © 2021 zhangxiuyin. All rights reserved.
//

#ifndef XBaseRecordWrapper_h
#define XBaseRecordWrapper_h
#import "XBaseRecord.h"
#import "XDataWrapper.h"

#endif /* XBaseRecordWrapper_h */

/**User model */
@interface XBaseRecordWrapper : XDataWrapper
-(instancetype) init ;
@property NSInteger _ID;
@property SInt8 STATUS;
@property SInt16 ADD_VERSION;
@property SInt16 VERSION;
@end


