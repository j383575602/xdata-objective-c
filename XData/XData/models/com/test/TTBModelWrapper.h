#import <xdata_core/XData.h>
#import <xdata_core/XDataWrapper.h>
#import "TTAModleWrapper.h"
/**BModel */
@interface TTBModelWrapper : XDataWrapper  
-(instancetype) init ;
/**
 *<br>说明：single model field
 *<br>索引：9928705
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
@property TTAModleWrapper* singleField;
/**
 *<br>说明：list model field
 *<br>索引：9932802
 *<br>类型：List of TTAModleWrapper
 *@since (1)
 */
@property NSArray<TTAModleWrapper*> * listField;

/**
 *<br>说明：set model field
 *<br>索引：9936899
 *<br>类型：Set of TTAModleWrapper
 *@since (1)
 */
@property NSSet<TTAModleWrapper*> * setField;

/**
 *<br>说明：string map field
 *<br>索引：9945092
 *<br>类型：Map<String,TTAModleWrapper>
 *@since (1)
 */
@property NSDictionary<NSString*,TTAModleWrapper*> * stringMapField;

/**
 *<br>说明：int map
 *<br>索引：9940997
 *<br>类型：Map<Integer,TTAModleWrapper>
 *@since (1)
 */
@property NSDictionary<NSNumber*,TTAModleWrapper*> * intMapField;

/**
 *<br>说明：long map
 *<br>索引：9949190
 *<br>类型：Map<Long,TTAModleWrapper>
 *@since (1)
 */
@property NSDictionary<NSNumber*,TTAModleWrapper*> * longMapField;

/**
 *<br>说明：float map
 *<br>索引：9953287
 *<br>类型：Map<Float,TTAModleWrapper>
 *@since (1)
 */
@property NSDictionary<NSNumber*,TTAModleWrapper*> * floatMapField;

/**
 *<br>说明：double map
 *<br>索引：9957384
 *<br>类型：Map<Double,TTAModleWrapper>
 *@since (1)
 */
@property NSDictionary<NSNumber*,TTAModleWrapper*> * doubleMapField;

@end