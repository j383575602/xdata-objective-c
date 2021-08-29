#import <xdata_core/XData.h>
#import <xdata_core/XDataWrapper.h>
/**a model */
@interface TTAModleWrapper : XDataWrapper  
-(instancetype) init ;
/**
 *<br>说明：Strings
 *<br>索引：30721
 *<br>类型：Map<Double,String>
 *@since (1)
 */
@property NSDictionary<NSNumber*,NSString*> * names;

@property NSArray<NSString*> * stringList;

@property NSSet<NSString*> * stringSet;

@property NSDictionary<NSNumber*,NSString*> * stringIntMap;

@property NSDictionary<NSNumber*,NSString*> * stringLongMap;

/**
 *<br>说明：float-string map
 *<br>索引：26630
 *<br>类型：Map<Float,String>
 *@since (1)
 */
@property NSDictionary<NSNumber*,NSString*> * stringFloatMap;

/**
 *<br>说明：double-string map
 *<br>索引：30727
 *<br>类型：Map<Double,String>
 *@since (1)
 */
@property NSDictionary<NSNumber*,NSString*> * stringDoubleMap;

/**
 *<br>说明：single string value
 *<br>索引：2056
 *<br>类型：String
 *@since (1)
 */
@property NSString* singleString;
@end