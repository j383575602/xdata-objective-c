#import <xdata_core/XData.h>
#import <xdata_core/XDataWrapper.h>
#import "XDUserWrapper.h"
/**shop model */
@interface XDShopWrapper : XDataWrapper  
-(instancetype) init ;
/**
 *<br>说明：id
 *<br>索引：1281
 *<br>类型：int64
 *@since (1)
 */
@property SInt64 ID;
/**
 *<br>说明：all users
 *<br>索引：2478082
 *<br>类型：XDUser
 *@since (1)
 */
@property NSArray<XDUserWrapper*> * users;

/**
 *<br>说明：manger
 *<br>索引：2473987
 *<br>类型：XDUser
 *@since (1)
 */
@property XDUserWrapper* manager;
@end