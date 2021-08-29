#import "XDShopWrapper.h" 
#import <xdata_core/XDataWrapper.h> 
#import "XDUserWrapper.h" 
#import <xdata_core/XData.h> 
/**shop model*/
@implementation XDShopWrapper 
 
-(instancetype) init {
    self = [super initWithType: 2482176];
    return self;
}
@synthesize users = _users;
@synthesize manager = _manager;
/**
 *<br>说明：id
 *<br>索引：1281
 *<br>类型：int64
 *@since (1)
 */
-(void) setID:(SInt64) ID {
    [super setValue:@(ID) forIndex:1281];
}

-(SInt64) ID {
    return [super getLong: 1281];
}
/**
 *<br>说明：all users
 *<br>索引：2478082
 *<br>类型：XDUser
 *@since (1)
 */
-(void)setUsers:(NSArray<XDUserWrapper*> *) users {
    _users = users;
    [super setValue:users forIndex:2478082];
}

-(NSArray<XDUserWrapper*> *) users {
    if (_users != nil) {
        return _users;
    }
    NSArray* array = [super getDataList:2478082];
    NSMutableArray * wrappers = [NSMutableArray arrayWithCapacity:array.count];
    for(XData* data in array) {
        XDUserWrapper* wrapper = [[XDUserWrapper alloc] initWithXData:data];
        [wrappers addObject:wrapper];
    }
    _users = wrappers;
    return _users;
}
/**
 *<br>说明：manger
 *<br>索引：2473987
 *<br>类型：XDUser
 *@since (1)
 */
-(void) setManager:(XDUserWrapper*) manager {
    _manager = manager;
    [super setValue:manager forIndex:2473987];
}
-(XDUserWrapper*) manager {
    if (_manager != nil) {
        return _manager;
    }
    XData* data = [super getData: 2473987];;
    XDUserWrapper* wrapper = [[XDUserWrapper alloc] initWithXData:data];
    _manager = wrapper;
    return _manager;
}
@end
