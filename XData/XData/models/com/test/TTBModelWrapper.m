#import "TTBModelWrapper.h" 
#import "TTAModleWrapper.h" 
#import <xdata_core/XDataWrapper.h> 
#import <xdata_core/XData.h> 
/**BModel*/
@implementation TTBModelWrapper 
 
-(instancetype) init {
    self = [super initWithType: 9961472];
    return self;
}
@synthesize singleField = _singleField;
@synthesize listField = _listField;
@synthesize setField = _setField;
@synthesize stringMapField = _stringMapField;
@synthesize intMapField = _intMapField;
@synthesize longMapField = _longMapField;
@synthesize floatMapField = _floatMapField;
@synthesize doubleMapField = _doubleMapField;
/**
 *<br>说明：single model field
 *<br>索引：9928705
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void) setSingleField:(TTAModleWrapper*) singleField {
    _singleField = singleField;
    [super setValue:singleField forIndex:9928705];
}
-(TTAModleWrapper*) singleField {
    if (_singleField != nil) {
        return _singleField;
    }
    XData* data = [super getData: 9928705];
    if (data == nil) {
        return nil;
    }
    TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:data];
    _singleField = wrapper;
    return _singleField;
}
/**
 *<br>说明：list model field
 *<br>索引：9932802
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setListField:(NSArray<TTAModleWrapper*> *) listField {
    _listField = listField;
    [super setValue:listField forIndex:9932802];
}

-(NSArray<TTAModleWrapper*> *) listField {
    if (_listField != nil) {
        return _listField;
    }
    NSArray* array = [super getDataList:9932802];
    if (array == nil) {
        return [NSMutableArray arrayWithCapacity:0];
    }
    NSMutableArray * wrappers = [NSMutableArray arrayWithCapacity:array.count];
    for(XData* data in array) {
        if ([data isKindOfClass:XDataWrapper.class]) {
            [wrappers addObject:data];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:data];
            [wrappers addObject:wrapper];
        }
    }
    _listField = wrappers;
    return _listField;
}
/**
 *<br>说明：set model field
 *<br>索引：9936899
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setSetField:(NSSet<TTAModleWrapper*> *) setField {
    _setField = setField;
    [super setValue:setField forIndex:9936899];
}

-(NSSet<TTAModleWrapper*> *) setField {
    if (_setField != nil) {
        return _setField;
    }
    NSSet* array = [super getDataSet:9936899];
    if (array == nil) {
        return [[NSMutableSet alloc] initWithCapacity:0];
    }
    NSMutableSet * wrappers = [[NSMutableSet alloc] initWithCapacity:array.count];
    for(XData* data in array) {
        if ([data isKindOfClass:XDataWrapper.class]) {
            [wrappers addObject:data];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:data];
            [wrappers addObject:wrapper];
        }
    }
    _setField = wrappers;
    return _setField;
}
/**
 *<br>说明：string map field
 *<br>索引：9945092
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setStringMapField:(NSDictionary<NSString*,TTAModleWrapper*> *) stringMapField {
    _stringMapField = stringMapField;
    [super setValue:stringMapField forIndex:9945092];
}

-(NSDictionary<NSString*,TTAModleWrapper*> *) stringMapField {
    if (_stringMapField != nil) {
        return _stringMapField;
    }
    NSDictionary* dictionary = [super getDataMap:9945092];
    if (dictionary == nil) {
        return [[NSMutableDictionary<NSString*, TTAModleWrapper*> alloc] initWithCapacity:0];
    }
    NSMutableDictionary<NSString*,TTAModleWrapper*> * wrappers = [[NSMutableDictionary<NSString*,TTAModleWrapper*> alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:XDataWrapper.class]) {
            [wrappers setObject:obj forKeyedSubscript:key];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:(XData*)obj];
            [wrappers setObject:wrapper forKeyedSubscript:key];
        }
    }];
    _stringMapField = wrappers;
    return _stringMapField;
}
/**
 *<br>说明：int map
 *<br>索引：9940997
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setIntMapField:(NSDictionary<NSNumber*,TTAModleWrapper*> *) intMapField {
    _intMapField = intMapField;
    [super setValue:intMapField forIndex:9940997];
}

-(NSDictionary<NSNumber*,TTAModleWrapper*> *) intMapField {
    if (_intMapField != nil) {
        return _intMapField;
    }
    NSDictionary* dictionary = [super getDataMap:9940997];
    if (dictionary == nil) {
        return [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:0];
    }
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> * wrappers = [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:XDataWrapper.class]) {
            [wrappers setObject:obj forKey:key];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:(XData*)obj];
            [wrappers setObject:wrapper forKey:key];
        }
    }];
    _intMapField = wrappers;
    return _intMapField;
}
/**
 *<br>说明：long map
 *<br>索引：9949190
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setLongMapField:(NSDictionary<NSNumber*,TTAModleWrapper*> *) longMapField {
    _longMapField = longMapField;
    [super setValue:longMapField forIndex:9949190];
}

-(NSDictionary<NSNumber*,TTAModleWrapper*> *) longMapField {
    if (_longMapField != nil) {
        return _longMapField;
    }
    NSDictionary* dictionary = [super getDataMap:9949190];
    if (dictionary == nil) {
        return [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:0];
    }
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> * wrappers = [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:XDataWrapper.class]) {
            [wrappers setObject:obj forKey:key];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:(XData*)obj];
            [wrappers setObject:wrapper forKey:key];
        }
    }];
    _longMapField = wrappers;
    return _longMapField;
}
/**
 *<br>说明：float map
 *<br>索引：9953287
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setFloatMapField:(NSDictionary<NSNumber*,TTAModleWrapper*> *) floatMapField {
    _floatMapField = floatMapField;
    [super setValue:floatMapField forIndex:9953287];
}

-(NSDictionary<NSNumber*,TTAModleWrapper*> *) floatMapField {
    if (_floatMapField != nil) {
        return _floatMapField;
    }
    NSDictionary* dictionary = [super getDataMap:9953287];
    if (dictionary == nil) {
        return [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:0];
    }
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> * wrappers = [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:XDataWrapper.class]) {
            [wrappers setObject:obj forKey:key];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:(XData*)obj];
            [wrappers setObject:wrapper forKey:key];
        }
    }];
    _floatMapField = wrappers;
    return _floatMapField;
}
/**
 *<br>说明：double map
 *<br>索引：9957384
 *<br>类型：TTAModleWrapper
 *@since (1)
 */
-(void)setDoubleMapField:(NSDictionary<NSNumber*,TTAModleWrapper*> *) doubleMapField {
    _doubleMapField = doubleMapField;
    [super setValue:doubleMapField forIndex:9957384];
}

-(NSDictionary<NSNumber*,TTAModleWrapper*> *) doubleMapField {
    if (_doubleMapField != nil) {
        return _doubleMapField;
    }
    NSDictionary* dictionary = [super getDataMap:9957384];
    if (dictionary == nil) {
        return [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:0];
    }
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> * wrappers = [[NSMutableDictionary<NSNumber*,TTAModleWrapper*> alloc] initWithCapacity:dictionary.count];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:XDataWrapper.class]) {
            [wrappers setObject:obj forKey:key];
        } else {
            TTAModleWrapper* wrapper = [[TTAModleWrapper alloc] initWithXData:(XData*)obj];
            [wrappers setObject:wrapper forKey:key];
        }
    }];
    _doubleMapField = wrappers;
    return _doubleMapField;
}
@end