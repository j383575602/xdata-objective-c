#import <xdata_core/XData.h>
#import <xdata_core/XDataWrapper.h>
/**User model */
@interface XDUserWrapper : XDataWrapper  
-(instancetype) init ;
/**
 *<br>说明：user name
 *<br>索引：2049
 *<br>类型：String
 *@since (1)
 */
@property NSString* name;
/**
 *<br>说明：user age
 *<br>索引：514
 *<br>类型：int8
 *@since (1)
 */
@property SInt8 age;
/**
 *<br>说明：how many seconds exists in system
 *<br>索引：1283
 *<br>类型：int64
 *@since (1)
 */
@property SInt64 seconds;
/**
 *<br>说明：how many money the user has
 *<br>索引：1028
 *<br>类型：int32
 *@since (1)
 */
@property NSInteger money;
/**
 *<br>说明：count of friends 
 *<br>索引：773
 *<br>类型：int16
 *@since (1)
 */
@property SInt16 friendsCount;
/**
 *<br>说明：weight
 *<br>索引：1542
 *<br>类型：float32
 *@since (1)
 */
@property Float32 weight;
/**
 *<br>说明：birthday
 *<br>索引：2567
 *<br>类型：2560
 *@since (1)
 */
@property NSDate* birthday;
/**
 *<br>说明：icon
 *<br>索引：2312
 *<br>类型：2304
 *@since (1)
 */
@property NSData* icon;
/**
 *<br>说明：salary
 *<br>索引：1801
 *<br>类型：float64
 *@since (1)
 */
@property Float64 salary;
/**
 *<br>说明：is manager
 *<br>索引：266
 *<br>类型：256
 *@since (1)
 */
@property BOOL isManager;
@end