#import <xdata_core/XDataWrapper.h> 
#import "XDUserWrapper.h" 
#import <xdata_core/XData.h>
#import "RBRoom.h"
/**User model*/
@implementation XDUserWrapper 
 
-(instancetype) init {
    self = [super initWithType: 2473984];
    return self;
}
/**
 *<br>说明：user name
 *<br>索引：2049
 *<br>类型：String
 *@since (1)
 */
-(void) setName:(NSString*) name {
    [super setValue:name forIndex:2049];
}

-(NSString*) name {
    return [super getString: 2049];
}
/**
 *<br>说明：user age
 *<br>索引：514
 *<br>类型：int8
 *@since (1)
 */
-(void) setAge:(SInt8) age {
    [super setValue:@(age) forIndex:514];
}

-(SInt8) age {
    return [super getByte: 514];
}
/**
 *<br>说明：how many seconds exists in system
 *<br>索引：1283
 *<br>类型：int64
 *@since (1)
 */
-(void) setSeconds:(SInt64) seconds {
    [super setValue:@(seconds) forIndex:1283];
}

-(SInt64) seconds {
    return [super getLong: 1283];
}
/**
 *<br>说明：how many money the user has
 *<br>索引：1028
 *<br>类型：int32
 *@since (1)
 */
-(void) setMoney:(NSInteger) money {
    [super setValue:@(money) forIndex:1028];
}

-(NSInteger) money {
    return [super getInteger: 1028];
}
/**
 *<br>说明：count of friends 
 *<br>索引：773
 *<br>类型：int16
 *@since (1)
 */
-(void) setFriendsCount:(SInt16) friendsCount {
    [super setValue:@(friendsCount) forIndex:773];
}

-(SInt16) friendsCount {
    return [super getShort: 773];
}
/**
 *<br>说明：weight
 *<br>索引：1542
 *<br>类型：float32
 *@since (1)
 */
-(void) setWeight:(Float32) weight {
    [super setValue:@(weight) forIndex:1542];
}

-(Float32) weight {
    return [super getFloat: 1542];
}
/**
 *<br>说明：birthday
 *<br>索引：2567
 *<br>类型：2560
 *@since (1)
 */
-(void) setBirthday:(NSDate*) birthday {
    [super setValue:birthday forIndex:2567];
}

-(NSDate*) birthday {
    return [super getDate: 2567];
}
/**
 *<br>说明：icon
 *<br>索引：2312
 *<br>类型：2304
 *@since (1)
 */
-(void) setIcon:(NSData*) icon {
    [super setValue:icon forIndex:2312];
}

-(NSData*) icon {
    return [super getBlob: 2312];
}
/**
 *<br>说明：salary
 *<br>索引：1801
 *<br>类型：float64
 *@since (1)
 */
-(void) setSalary:(Float64) salary {
    [super setValue:@(salary) forIndex:1801];
}

-(Float64) salary {
    return [super getDouble: 1801];
}
/**
 *<br>说明：is manager
 *<br>索引：266
 *<br>类型：256
 *@since (1)
 */
-(void) setIsManager:(BOOL) isManager {
    [super setValue:@(isManager) forIndex:266];
}

-(BOOL) isManager {
    return [super getBool: 266];
}
@end
