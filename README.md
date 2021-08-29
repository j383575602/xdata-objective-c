
# Homepage:
 
 XData is a simple serialize framework based on binary data, it is swift, small, safe and stable. Enable you to transfer data among java, javascript, ios and flutter.
 You can edit your contract classes and learn more on the page: [http://www.xcore.top](http://www.xcore.top), and all api calls of this website are using XData as the sample.
 So, if you are using ,or considering using JSON ,XML, or ProtocolBuffer, We recommend you have a try on XData as an alternative.

# xdata-objective-c
This is the xdata repo for Objective-C platform. If you want to download all platforms,there they are:

-  xdata-all: a repo managed all platforms by google repo tool.

    git@github.com:j383575602/xdata-all.git

-  xdata-java : java platform

    git@github.com:j383575602/xdata-java.git

-  xdata-objective-c : objective-c platform

    git@github.com:j383575602/xdata-objective-c.git

- xdata-javascript : javascript platform

    git@github.com:j383575602/xdata-javascript.git

-  xdata-dart : dart platform

    git@github.com:j383575602/xdata-dart.git


# Demo
    Assume there are two classes defined with XData protocol.  User, Car

    XCarWrapper *car1 = new XCarWrapper();
    car1.brand = "Audi";

    XCarWrapper *car2 = new XCarWrapper();
    car2.brand = "Porsche";

    NSMuttableArray<XCarWrapper*> *cars = new NSMuttableArray<>();
    cars.add(car1);
    carr.add(car2);


    XUserWrapper *user = new XUserWrapper();
    user.name = "John Smith";
    user.age = 35;
    user.cars = cars;


    //start to serialize
    XDataWriter *writer = new XDataWriter();
    NSData *bytes = writer.writeData(user);


    //start to deserialize
    XDataParser *parser = new XDataParser();

    XData *data = parser.parse(bytes);

    XUserWrapper *user2 = new XUserWrapper(data);
    
    //start to check 
    assert(user2.name.equals("John Smith"));
    assert(user2.age == 35);
    assert(user2.cars.size() == 2);
    assert(user2.cars.get(0).brand.equals("Audi"));
    assert(user2.cars.get(1).brand.equals("Porsche"));


# Supprted Types


 |order|datatype |  single |List      | Set   | StringMap|IntMap | LongMap | FloatMap |DoubleMap |
  |-----|-----|---------| ---------|--------|----------|-------|---------|----------|----------|
  |1|**int8**|NSNumber|NSArray<NSNumber*>| NSSet\<NSNumber*> |NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |2|**int16**|NSNumber|NSArray\<NSNumber*>| NSSet\<NSNumber*> |NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>| NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |3|**int32**|NSNumber|NSArray\<NSNumber*>|NSSet\<NSNumber*>|NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>| NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |4|**int64**|NSNumber|NSArray\<NSNumber*>|NSSet\<NSNumber*>|NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>| NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |5|**float32**|NSNumber|NSArray\<NSNumber*>|NSSet\<NSNumber*>|NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>| NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |6|**float64**|NSNumber|NSArray\<NSNumber*>|NSSet\<NSNumber*>|NSDictionary<NSString*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>| NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|NSDictionary<NSNumber*,NSNumber*>|
  |7|**bool**|bool|NSArray\<bool*>|NSSet\<bool*>|NSDictionary<NSString*,bool*>|NSDictionary<NSNumber*,bool>| NSDictionary<NSNumber*,bool>|NSDictionary<NSNumber*,bool*>|NSDictionary<NSNumber*,bool*>
  |8|**NSString**|NSString*|NSArray\<NSString*>|NSSet\<NSString*>|NSDictionary<NSString*,NSString*>|NSDictionary<NSNumber*,NSString*>| NSDictionary<NSNumber*,NSString*>|NSDictionary<NSNumber*,NSString*>|NSDictionary<NSNumber*,NSString*>|
  |9|**NSDate***|NSDate*|NSArray\<NSDate*>|NSSet\<NSDate*>|NSDictionary<NSString*,NSDate*>|NSDictionary<NSNumber*,NSDate*>| NSDictionary<NSNumber*,NSDate*>|NSDictionary<NSNumber*,NSDate*>|NSDictionary<NSNumber*,NSDate*>|
  |10|**NSData**|NSData*|NSArray\<NSData*>|NSSet\<NSData*>|NSDictionary<NSString*,NSData*>|NSDictionary<NSNumber*,NSData*>| NSDictionary<NSNumber*,NSData*>|NSDictionary<NSNumber*,NSData*>|NSDictionary<NSNumber*,NSData*>|
  |11|**XData**|XData|NSArray\<XData*>|NSSet\<XData*>|NSDictionary<NSString*,XData*>|NSDictionary<NSNumber*,XData*>| NSDictionary<NSNumber*,XData*>|NSDictionary<NSNumber*,XData*>|NSDictionary<NSNumber*,XData*>|
  
