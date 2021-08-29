//
//  XObjectRef.h
//  xdata_core
//
//  Created by zhaoweilin on 2021/2/5.
//  Copyright © 2021 zhangxiuyin. All rights reserved.
//
#import "xtype.h"

#ifndef XObjectRef_h
#define XObjectRef_h
#endif /* XObjectRef_h */

static const int XObjectRef_TYPE_INDEX     = XDATA_TYPE_OBJECT_REF;
static const int XObjectRef_OWNER_ID             = 1 | XDATA_TYPE_BYTE_i_4;
static const int XObjectRef_OWNER_TYPE         = 2 | XDATA_TYPE_BYTE_i_4;
static const int XObjectRef_OWNER_PROP    = 3 | XDATA_TYPE_BYTE_i_4;
static const int XObjectRef_REF_TYPE        = 4 | XDATA_TYPE_BYTE_i_4;
static const int XObjectRef_REF_ID        = 5 | XDATA_TYPE_BYTE_i_4;


