//
//  AppDelegate.m
//  ArrayIterationAlgorithm
//
//  Created by 曾昭英 on 2016/12/20.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

#import "AppDelegate.h"

#import "NSArray+Iteration.h"
#import "ArrayIteration.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     问题
     
     给你一个嵌套的 NSArray 数据，实现一个迭代器类，该类提供一个 next() 方法，可以依次的取出这个 NSArray 中的数据。
     
     比如 NSArray 如果是 [1,[4,3],6,[5,[1,0]]]， 则最终应该输出：1, 4, 3, 6, 5, 1, 0 。
     
     另外，实现一个 allObjects 方法，可以一次性取出所有元素。
     
     */
    
    NSArray *array = @[@0,@[@1,@2],@3,@[@4,@[@5,@[@6,@7],@8,@[@9]]]];
    NSLog(@"%@", [array allObjects]);
    
    NSLog(@"-------------");
    ArrayIteration *arrayIteration = [[ArrayIteration alloc] initWithArray:array];
    id object = [arrayIteration next];
    while (object) {
        NSLog(@"%@", object);
        object = [arrayIteration next];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
