//
//  xdata.h
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#ifndef xdata_h
#define xdata_h


#endif /* xdata_h */

   static const int XDATA_OBJECT_INDEX_OFFSET              = 15;
/**类掩码*/
   static const int XDATA_MASK_TYPE                  = 0xFFFFFF00;
   /**索引掩码*/
   static const int XDATA_MASK_INDEX                 = 0x000000FF;
   /**列表掩码*/
   static const int XDATA_MASK_TYPE_COLLECTION             = 0x00007000;
   static const int XDATA_MASK_TYPE_COLLECTION_LIST        = 0x00001000;
   static const int XDATA_MASK_TYPE_COLLECTION_SET         = 0x00002000;
   static const int XDATA_MASK_TYPE_COLLECTION_INT_MAP     = 0x00003000;
   static const int XDATA_MASK_TYPE_COLLECTION_STRING_MAP  = 0x00004000;
   static const int XDATA_MASK_TYPE_COLLECTION_LONG_MAP    = 0x00005000;
   static const int XDATA_MASK_TYPE_COLLECTION_FLOAT_MAP   = 0x00006000;
   static const int XDATA_MASK_TYPE_COLLECTION_DOUBLE_MAP  = 0x00007000;
   /**1bit 整形，对应java boolean*/
   static const int XDATA_TYPE_BOOLEAN         = 0x00000100 ;
   /**8bit 整形，对应java byte*/
   static const int XDATA_TYPE_BYTE_i_1        = 0x00000200 ;
   /**16bit 整形，对应java short*/
   static const int XDATA_TYPE_BYTE_i_2        = 0x00000300;
   /**32bit 整形，对应java integer*/
   static const int XDATA_TYPE_BYTE_i_4        = 0x00000400;
   /**64bit 整形，对应java long*/
   static const int XDATA_TYPE_BYTE_i_8        = 0x00000500;
   /**32bit 浮点，对应java float*/
   static const int XDATA_TYPE_BYTE_f_4        = 0x00000600;
   /**64bit 浮点，对应java double*/
   static const int XDATA_TYPE_BYTE_f_8        = 0x00000700;
   /**字符串，对应java String*/
   static const int XDATA_TYPE_STRING          = 0x00000800;
   /**二进制数据，对应java byte[]*/
   static const int XDATA_TYPE_BLOB            = 0x00000900;
   /**日期*/
   static const int XDATA_TYPE_DATE            = 0x00000A00;
   /**预留*/
   static const int XDATA_TYPE_UNKNOWN_1       = 0x00000B00;
   /**预留*/
   static const int XDATA_TYPE_UNKNOWN_2       = 0x00000C00;
   /**预留*/
   static const int XDATA_TYPE_UNKNOWN_3       = 0x00000D00;
   /**预留*/
   static const int XDATA_TYPE_UNKNOWN_4       = 0x00000E00;
   /**预留*/
   static const int XDATA_TYPE_UNKNOWN_5       = 0x00000F00;
   /**复杂类型起始*/
   static const int XDATA_TYPE_OBJECT_START    = 0x00008FFF;
   /**系统基础对象*/
   static const int XDATA_TYPE_BASS_RECORD     = ((XDATA_TYPE_OBJECT_START >> XDATA_OBJECT_INDEX_OFFSET) + 1) << XDATA_OBJECT_INDEX_OFFSET;
   static const int XDATA_TYPE_OBJECT_REF      = ((XDATA_TYPE_OBJECT_START >> XDATA_OBJECT_INDEX_OFFSET) + 2) << XDATA_OBJECT_INDEX_OFFSET;
   /**应用自定义类型的基础值，预留200给系统定义*/
   //static const int XDATA_TYPE_CUSTOMER_START  = ((XDATA_TYPE_OBJECT_START >> 13) + 200) << 13;
   /**应用自定义类型的基础值，预留100给系统应用手动处理*/
   //static const int XDATA_TYPE_PROJECT_START  = ((XDATA_TYPE_OBJECT_START >> 13) + 300) << 13;
