#import "TTAModleWrapper.h" 
#import <xdata_core/XDataWrapper.h> 
#import <xdata_core/XData.h> 
/**a model*/
@implementation TTAModleWrapper 
 
-(instancetype) init {
    self = [super initWithType: 9928704];
    return self;
}
@synthesize names = _names;
@synthesize stringList = _stringList;
@synthesize stringSet = _stringSet;
@synthesize stringIntMap = _stringIntMap;
@synthesize stringLongMap = _stringLongMap;
@synthesize stringFloatMap = _stringFloatMap;
@synthesize stringDoubleMap = _stringDoubleMap;
/**
 *<br>说明：Strings
 *<br>索引：30721
 *<br>类型：String
 *@since (1)
 */
-(void)setNames:(NSDictionary<NSNumber*,NSString*> *) names {
    _names = names;
    [super setValue:names forIndex:30721];
}

-(NSDictionary<NSNumber*,NSString*> *) names {
    if (_names != nil) {
        return _names;
    }
    NSDictionary* array = [super getDataMap:30721];
    _names = array;
    return _names;
}
-(void)setStringList:(NSArray<NSString*> *) stringList {
    _stringList = stringList;
    [super setValue:stringList forIndex:6146];
}

-(NSArray<NSString*> *) stringList {
    if (_stringList != nil) {
        return _stringList;
    }
    NSArray* array = [super getDataList:6146];
    _stringList = array;
    return _stringList;
}
-(void)setStringSet:(NSSet<NSString*> *) stringSet {
    _stringSet = stringSet;
    [super setValue:stringSet forIndex:10243];
}

-(NSSet<NSString*> *) stringSet {
    if (_stringSet != nil) {
        return _stringSet;
    }
    NSSet* set = [super getDataSet:10243];
    _stringSet = set;
    return _stringSet;
}
-(void)setStringIntMap:(NSDictionary<NSNumber*,NSString*> *) stringIntMap {
    _stringIntMap = stringIntMap;
    [super setValue:stringIntMap forIndex:14340];
}

-(NSDictionary<NSNumber*,NSString*> *) stringIntMap {
    if (_stringIntMap != nil) {
        return _stringIntMap;
    }
    NSDictionary* array = [super getDataMap:14340];
    _stringIntMap = array;
    return _stringIntMap;
}
-(void)setStringLongMap:(NSDictionary<NSNumber*,NSString*> *) stringLongMap {
    _stringLongMap = stringLongMap;
    [super setValue:stringLongMap forIndex:22533];
}

-(NSDictionary<NSNumber*,NSString*> *) stringLongMap {
    if (_stringLongMap != nil) {
        return _stringLongMap;
    }
    NSDictionary* array = [super getDataMap:22533];
    _stringLongMap = array;
    return _stringLongMap;
}
/**
 *<br>说明：float-string map
 *<br>索引：26630
 *<br>类型：String
 *@since (1)
 */
-(void)setStringFloatMap:(NSDictionary<NSNumber*,NSString*> *) stringFloatMap {
    _stringFloatMap = stringFloatMap;
    [super setValue:stringFloatMap forIndex:26630];
}

-(NSDictionary<NSNumber*,NSString*> *) stringFloatMap {
    if (_stringFloatMap != nil) {
        return _stringFloatMap;
    }
    NSDictionary* array = [super getDataMap:26630];
    _stringFloatMap = array;
    return _stringFloatMap;
}
/**
 *<br>说明：double-string map
 *<br>索引：30727
 *<br>类型：String
 *@since (1)
 */
-(void)setStringDoubleMap:(NSDictionary<NSNumber*,NSString*> *) stringDoubleMap {
    _stringDoubleMap = stringDoubleMap;
    [super setValue:stringDoubleMap forIndex:30727];
}

-(NSDictionary<NSNumber*,NSString*> *) stringDoubleMap {
    if (_stringDoubleMap != nil) {
        return _stringDoubleMap;
    }
    NSDictionary* array = [super getDataMap:30727];
    _stringDoubleMap = array;
    return _stringDoubleMap;
}
/**
 *<br>说明：single string value
 *<br>索引：2056
 *<br>类型：String
 *@since (1)
 */
-(void) setSingleString:(NSString*) singleString {
    [super setValue:singleString forIndex:2056];
}

-(NSString*) singleString {
    return [super getString: 2056];
}
@end