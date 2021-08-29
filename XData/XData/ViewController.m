//
//  ViewController.m
//  XData
//
//  Created by zhangxiuyin on 2019/11/24.
//  Copyright © 2019 zhangxiuyin. All rights reserved.
//

#import "ViewController.h"
#import <xdata_core/xdata_core.h>
#import "RBHotel.h"
#import "XDUser.h"
#import "XDShop.h"
#import "XDUserWrapper.h"
#import "XDShopWrapper.h"
#import "TTAModleWrapper.h"
#import "TTBModelWrapper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"nohao %@",@"viewDidLoad");
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 500, 50)];
    UIFont * font = [UIFont systemFontOfSize:40];
    [label setText:@"hah"];
    [label setFont:font];
    [label setTextColor:[UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:1]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.5 green:0.6 blue:0.8 alpha:1]];

                
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
    
    XData * data = [[XData alloc] initWithType: 10];
    XDataWriter * writer = [[XDataWriter alloc] init];
    NSData *nsdata = [writer writeData:data];
    NSLog(@"nohao %ld",nsdata.length);
    //[[WKWebView alloc] init];
    
    LinkedBuffer * buffer = [[LinkedBuffer alloc] initWithSize:16];
    //[buffer writeByte:(Byte)70];
    NSString * origin = @"我是中国人1abc哦股不忽悠";
    NSData* b = [origin dataUsingEncoding:NSUTF8StringEncoding];

    [buffer writeBytes:b.bytes length:b.length];
    NSData* nd = [buffer toData];
    NSString * str = [[NSString alloc] initWithData:nd encoding:NSUTF8StringEncoding];
    NSLog(@" data data: %@!",str);
    [self testBaseClass];
    
    long long l = 109;
    Byte* ld = (Byte*) &l;
    for(int i=7;i>=0;i--) {
        NSLog(@"b[%ld]:%d",7-i,(SignedByte)(ld[i]));
    }
//    XData *xdata = [self createTestXData];
//    [self createTestXData2];
//    [self createTestXData3];
//    XDataWriter *dwriter = [[XDataWriter alloc] init];
//    NSData *ddata = [dwriter writeData:xdata];
//    NSURL * url = [[NSURL alloc] initWithString:@"http://192.168.5.60/test"];
//    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:ddata];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData* data,NSURLResponse* response,NSError* error) {
//
//    }];
//    [task resume];
    [self testCollectionClass];
                    
}

-(void) printData:(Byte*) data length:(NSInteger) length {

    NSString* str = [[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding];
    NSLog(@"data: %@!",str);
}

-(XData*) createTestXData {
    XData* data = [[XData alloc] initWithType:XDShop_TYPE_INDEX];
    [data setValue:@(100000L) forIndex:XDShop_id];
    NSMutableArray* users = [[NSMutableArray alloc] init];
    XData* user = [[XData alloc] initWithType:XDUser_TYPE_INDEX];
    [user setValue:@"招待费" forIndex:XDUser_name];
    [user setValue:@(35) forIndex:XDUser_age];
    [user setValue:@(-8989344243L) forIndex:XDUser_seconds];
    [user setValue:@(-1234) forIndex:XDUser_money];
    [user setValue:@(-26561) forIndex:XDUser_friendsCount];
    [user setValue:@(127.5092F) forIndex:XDUser_weight];
    NSDate * birday = [[NSDate alloc] init];
    [user setValue:birday forIndex:XDUser_birthday];
    Byte by[10] = {0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89};
    NSData * icon = [[NSData alloc] initWithBytes:by length:10];
    [user setValue:icon forIndex:XDUser_icon];
    [user setValue:@(3453.0152)forIndex:XDUser_salary];
    [user setValue:@(YES) forIndex:XDUser_isManager];
    [users addObject:user];
    [data setValue:users forIndex:XDShop_users];
    XDataWriter* writer = [[XDataWriter alloc] init];
    NSData * bytes = [writer writeData:data];
    NSLog(@"write size>>:%ld",bytes.length);

    XDataParser * parser = [[XDataParser alloc] init];
    XData * paresed = [parser parse:bytes];
    NSLog(@"write size>>:%lld",[paresed getLong:XDShop_id]);
    NSArray *parsedusers = [paresed getDataList:XDShop_users];
    NSLog(@"write size>>:%ld",parsedusers.count);
    XData * parseduser = [parsedusers objectAtIndex:0];
    NSLog(@"write size>>:%lld",[parseduser getLong:XDUser_seconds]);
    NSLog(@"write size>>:%ld",[parseduser getInteger:XDUser_money]);
    NSLog(@"write size>>:%d",[parseduser getShort:XDUser_friendsCount]);
    NSLog(@"write size>>:%f",[parseduser getFloat:XDUser_weight]);
    NSLog(@"write size>>:%lf",[parseduser getDouble:XDUser_salary]);
    NSLog(@"write size>>:%@",[parseduser getDate:XDUser_birthday]);
    NSLog(@"write size>>:%@",[parseduser getBool:XDUser_isManager]?@"YES":@"NO");
    NSLog(@"write size>>:%@",[parseduser getString:XDUser_name]);
    return data;
}

-(XData*) createTestXData2 {
    NSLog(@"createTestXData2>>");
    XDataWrapper* data = [[XDataWrapper alloc] initWithType:XDShop_TYPE_INDEX];
    [data setValue:@(100000L) forIndex:XDShop_id];
    NSMutableArray* users = [[NSMutableArray alloc] init];
    XData* user = [[XData alloc] initWithType:XDUser_TYPE_INDEX];
    [user setValue:@"招待费" forIndex:XDUser_name];
    [user setValue:@(35) forIndex:XDUser_age];
    [user setValue:@(-8989344243L) forIndex:XDUser_seconds];
    [user setValue:@(-1234) forIndex:XDUser_money];
    [user setValue:@(-26561) forIndex:XDUser_friendsCount];
    [user setValue:@(127.5092F) forIndex:XDUser_weight];
    NSDate * birday = [[NSDate alloc] init];
    [user setValue:birday forIndex:XDUser_birthday];
    Byte by[10] = {0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89};
    NSData * icon = [[NSData alloc] initWithBytes:by length:10];
    [user setValue:icon forIndex:XDUser_icon];
    [user setValue:@(3453.0152)forIndex:XDUser_salary];
    [user setValue:@(YES) forIndex:XDUser_isManager];
    [users addObject:user];
    [data setValue:users forIndex:XDShop_users];
    XDataWriter* writer = [[XDataWriter alloc] init];
    NSData * bytes = [writer writeData:data];
    NSLog(@"write size>>:%ld",bytes.length);

    XDataParser * parser = [[XDataParser alloc] init];
    XData * paresed = [parser parse:bytes];
    NSLog(@"write size>>:%lld",[paresed getLong:XDShop_id]);
    NSArray *parsedusers = [paresed getDataList:XDShop_users];
    NSLog(@"write size>>:%ld",parsedusers.count);
    XData * parseduser = [parsedusers objectAtIndex:0];
    NSLog(@"write size>>:%lld",[parseduser getLong:XDUser_seconds]);
    NSLog(@"write size>>:%ld",[parseduser getInteger:XDUser_money]);
    NSLog(@"write size>>:%d",[parseduser getShort:XDUser_friendsCount]);
    NSLog(@"write size>>:%f",[parseduser getFloat:XDUser_weight]);
    NSLog(@"write size>>:%lf",[parseduser getDouble:XDUser_salary]);
    NSLog(@"write size>>:%@",[parseduser getDate:XDUser_birthday]);
    NSLog(@"write size>>:%@",[parseduser getBool:XDUser_isManager]?@"YES":@"NO");
    NSLog(@"write size>>:%@",[parseduser getString:XDUser_name]);
    return data;
}

-(XData*) createTestXData3 {
    NSLog(@"createTestXData3>>");
    XDShopWrapper *data = [[XDShopWrapper alloc] init];
    XDUserWrapper* user = [[XDUserWrapper alloc] init];
    user.name = @"招待费";
    user.age = 35;
    user.seconds = -8989344243L;
    user.money = -1234;
    user.friendsCount = -26561;
    user.weight = 127.5092F;
    user.birthday = [[NSDate alloc] init];
    Byte by[10] = {0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89,0x89};
    NSData * icon = [[NSData alloc] initWithBytes:by length:10];
    user.icon = icon;
    user.salary = 3453.0152;
    user.isManager = YES;
    NSMutableArray* users = [[NSMutableArray alloc] initWithCapacity:1];
    [users addObject:user];
    data.users = users;
    data.ID = 100000L;
    
    

    XDataWriter* writer = [[XDataWriter alloc] init];
    NSData * bytes = [writer writeData:data];
    NSLog(@"write size>>:%ld",bytes.length);

    XDataParser * parser = [[XDataParser alloc] init];
    XData * pshop = [parser parse:bytes];
    XDShopWrapper * parsedshop = [[XDShopWrapper alloc] initWithXData:pshop];
    
//    NSLog(@"write size>>:%lld",[paresed getLong:XDShop_id]);
//    NSArray *parsedusers = [paresed getDataList:XDShop_users];
//    NSLog(@"write size>>:%ld",parsedusers.count);
//    XData * parseduser = [parsedusers objectAtIndex:0];
    NSLog(@"write size>>:%lld",parsedshop.ID);
    NSArray<XDUserWrapper*> *parsedusers = parsedshop.users;
    XDUserWrapper*parseduser = [parsedusers objectAtIndex:0];
    NSLog(@"write size>>:%lld",parseduser.seconds);
    NSLog(@"write size>>:%ld",parseduser.money);
    NSLog(@"write size>>:%d",parseduser.friendsCount);
    NSLog(@"write size>>:%f",parseduser.weight);
    NSLog(@"write size>>:%lf",parseduser.salary);
    NSLog(@"write size>>:%@",parseduser.birthday);
    NSLog(@"write size>>:%@",parseduser.isManager?@"YES":@"NO");
    NSLog(@"write size>>:%@",parseduser.name);
    return data;
}


-(void) testBaseClass {
    XBaseRecordWrapper* baseRecord = [[XBaseRecordWrapper alloc] init];
    baseRecord._ID = 123;
    baseRecord.STATUS = 1;
    baseRecord.VERSION = 1;
    baseRecord.ADD_VERSION = 1;
    
    XDataWriter * writer = [[XDataWriter alloc] init];
    NSData *data = [writer writeData:baseRecord];
    
    XDataParser *parser = [[XDataParser alloc] init];
    XData* xdata = [parser parse:data];
    XBaseRecordWrapper *wrapper2 = [[XBaseRecordWrapper alloc] initWithXData:xdata];
    NSLog(@"id>>:%ld",wrapper2._ID);
    NSLog(@"status>>:%d",wrapper2.STATUS);
    NSLog(@"add version>>:%d",wrapper2.ADD_VERSION);
    NSLog(@"version>>:%d",wrapper2.VERSION);
    
    
}

-(void) testCollectionClass {
    for(int i=0;i<5;i++) {
        TTBModelWrapper * wrapper = [self createBModel];
        UInt64 t0 = [[NSDate date] timeIntervalSince1970]*1000;
        
        [self testBModel:wrapper];
        UInt64 t1 = [[NSDate date] timeIntervalSince1970]*1000;
        NSLog(@"use time:%lld",(t1-t0));
    }
}

-(void) testAModel {
    TTAModleWrapper * wrapper = [self createAModel];
    [self printAModel:wrapper withTip:@"created"];
    
    XDataWriter *writer = [[XDataWriter alloc] init];
    NSData *bytes = [writer writeData:wrapper];
    XDataParser *parser = [[XDataParser alloc] init];
    XData * xdata = [parser parse:bytes];
    TTAModleWrapper *outWrapper = [[TTAModleWrapper alloc] initWithXData:xdata];
    
    [self printAModel:outWrapper withTip:@"deserialized"];
}

-(void) testBModel:(TTBModelWrapper*) wrapper {
    //[self printBModel:wrapper withTip:@"B created"];
    
    XDataWriter *writer = [[XDataWriter alloc] init];
    NSData *bytes = [writer writeData:wrapper];
    XDataParser *parser = [[XDataParser alloc] init];
    XData * xdata = [parser parse:bytes];
    TTBModelWrapper *outWrapper = [[TTBModelWrapper alloc] initWithXData:xdata];
    
    //[self printBModel:outWrapper withTip:@"B deserialized"];
}
-(TTAModleWrapper*) createAModel {
    TTAModleWrapper *amodel = [[TTAModleWrapper alloc] init];
    amodel.singleString = @"This is single string";
    NSMutableDictionary<NSNumber*,NSString*> *names = [[NSMutableDictionary alloc] init];
    [names setObject:@"name_1_value" forKeyedSubscript:@(1)];
    [names setObject:@"name_2_value" forKeyedSubscript:@(2)];
    amodel.names = names;
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [list addObject:@"list item 1"];
    [list addObject:@"list item 2"];
    amodel.stringList = list;
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    [set addObject:@"set item 1"];
    [set addObject:@"set item 2"];
    amodel.stringSet = set;
    
    NSMutableDictionary<NSNumber*,NSString*> *intMaps = [[NSMutableDictionary alloc] init];
    [intMaps setObject:@"int map item 1" forKeyedSubscript:@(1)];
    [intMaps setObject:@"int map item 2" forKeyedSubscript:@(10980)];
    amodel.stringIntMap = intMaps;
    
    NSMutableDictionary<NSNumber*,NSString*> *longMaps = [[NSMutableDictionary alloc] init];
    [longMaps setObject:@"long map item 1" forKeyedSubscript:@(189888988776)];
    [longMaps setObject:@"long map item 2" forKeyedSubscript:@(109807878767)];
    amodel.stringLongMap = intMaps;
    
    NSMutableDictionary<NSNumber*,NSString*> *floatMaps = [[NSMutableDictionary alloc] init];
    [floatMaps setObject:@"float map item 1" forKeyedSubscript:@(1888.988776f)];
    [floatMaps setObject:@"float map item 2" forKeyedSubscript:@(1807878.767f)];
    amodel.stringFloatMap = floatMaps;
    
    NSMutableDictionary<NSNumber*,NSString*> *doubleMaps = [[NSMutableDictionary alloc] init];
    [doubleMaps setObject:@"double map item 1" forKeyedSubscript:@(1888.98877689)];
    [doubleMaps setObject:@"double map item 2" forKeyedSubscript:@(1807878.767877)];
    amodel.stringDoubleMap = doubleMaps;
    
    return amodel;
}

-(TTBModelWrapper*) createBModel {
    TTBModelWrapper *bmodel = [[TTBModelWrapper alloc] init];
    bmodel.singleField = [self createAModel];
    
    int count = 10000;
    
   
    NSMutableArray<TTAModleWrapper*> *list = [[NSMutableArray alloc] init];
    for(int i=0;i<count;i++) {
        [list addObject:[self createAModel]];
        [list addObject:[self createAModel]];
    }
    bmodel.listField = list;
    
    NSMutableSet<TTAModleWrapper*> *set = [[NSMutableSet alloc] init];
    for(int i=0;i<count;i++) {
        [set addObject:[self createAModel]];
        [set addObject:[self createAModel]];
    }
    bmodel.setField = set;
    
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> *intMap = [[NSMutableDictionary alloc] init];
    for(int i=0;i<count;i++) {
        [intMap setObject:[self createAModel] forKeyedSubscript:@(1+i)];
        [intMap setObject:[self createAModel] forKeyedSubscript:@(2000000+i)];
    }
    bmodel.intMapField = intMap;
    
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> *floatMap = [[NSMutableDictionary alloc] init];
    for(int i=0;i<count;i++) {
        [floatMap setObject:[self createAModel] forKeyedSubscript:@(0.0987 + i)];
        [floatMap setObject:[self createAModel] forKeyedSubscript:@(20000000.06767+i)];
    }
    bmodel.floatMapField = floatMap;
    
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> *longMap = [[NSMutableDictionary alloc] init];
    for(int i=0;i<count;i++) {
        [longMap setObject:[self createAModel] forKeyedSubscript: @(8765567898+i)];
        [longMap setObject:[self createAModel] forKeyedSubscript: @(898656334545+i)];
    }
    bmodel.longMapField = longMap;
    
    NSMutableDictionary<NSNumber*,TTAModleWrapper*> *doubleMap = [[NSMutableDictionary alloc] init];
    for(int i=0;i<count;i++) {
        [doubleMap setObject:[self createAModel] forKeyedSubscript:@(8454656.0985443+i)];
        [doubleMap setObject:[self createAModel] forKeyedSubscript:@(23454656.07834443+i)];
    }
    bmodel.doubleMapField = doubleMap;
    
    NSMutableDictionary<NSString*,TTAModleWrapper*> *stringMap = [[NSMutableDictionary alloc] init];
    for(int i=0;i<count;i++) {
        [stringMap setObject:[self createAModel] forKeyedSubscript:[NSString stringWithFormat:@"key10000000 %d",i]];
        [stringMap setObject:[self createAModel] forKeyedSubscript:[NSString stringWithFormat:@"key1",i]];
    }
    
    bmodel.stringMapField = stringMap;
    
    return bmodel;
}


-(void) printAModel:(TTAModleWrapper*) amodel withTip: (NSString*) tip{
    NSLog(@"============================%@================",tip);
    
    NSLog(@"amodel.single string :  %@",amodel.singleString);
    [amodel.names enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.names : %@  => %@",key,obj);
    }];
    
    [amodel.stringIntMap enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.stringIntMap : %@  => %@",key,obj);
    }];
    
    [amodel.stringLongMap enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.stringLongMap : %@  => %@",key,obj);
    }];
    
    [amodel.stringFloatMap enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.stringFloatMap : %@  => %@",key,obj);
    }];
    
    [amodel.stringDoubleMap enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.stringDoubleMap : %@  => %@",key,obj);
    }];
    
    [amodel.stringList enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"amodel.stringList : %ld => %@",idx,obj);
    }];
    
    [amodel.stringSet enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"amodel.string set : %@",obj);
    }];
}


-(void) printBModel:(TTBModelWrapper*) bmodel withTip: (NSString*) tip{
    NSLog(@"============================%@================",tip);
    [self printAModel:bmodel.singleField withTip:@"b.singleField"];
    [bmodel.listField enumerateObjectsUsingBlock:^(TTAModleWrapper * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:@"list field item"];
    }];
    [bmodel.setField enumerateObjectsUsingBlock:^(TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:@"set field item"];
    }];
    [bmodel.stringMapField enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:[NSString stringWithFormat:@"string key %@",key]];
    }];
    [bmodel.intMapField enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:[NSString stringWithFormat:@"int key %@",key]];
    }];
    [bmodel.longMapField enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:[NSString stringWithFormat:@"long key %@",key]];
    }];
    [bmodel.floatMapField enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:[NSString stringWithFormat:@"float key %@",key]];
    }];
    [bmodel.doubleMapField enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, TTAModleWrapper * _Nonnull obj, BOOL * _Nonnull stop) {
        [self printAModel:obj withTip:[NSString stringWithFormat:@"double key %@",key]];
    }];
}

@end
