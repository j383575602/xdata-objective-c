//
//  AppDelegate.h
//  XData
//
//  Created by zhangxiuyin on 2019/11/24.
//  Copyright © 2019 zhangxiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

