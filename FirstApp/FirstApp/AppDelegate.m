//
//  AppDelegate.m
//  FirstApp
//
//  Created by zsm on 2019/3/12.
//  Copyright © 2019 zsm. All rights reserved.
//

#import "AppDelegate.h"
#import "ZsmPayViewController.h"
#import "ZsmWithDrawViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *urlStr = [NSString stringWithFormat:@"%@://para1=value1&para2=value2", @"thirdParty"];
    NSString *hString = [self paramValueOfUrl:urlStr withParam:@"para2"];
    
    
    NSLog(@"%@",hString);
    
    
    return YES;
}
//MARK:-- 其他App调起
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    NSString *para = [url absoluteString];
    NSDictionary * json = [self getUrlParameterWithUrl:url];
    NSLog(@"%@",json);
    
    if ([para containsString:@"order"]) {
        ZsmPayViewController * payVc = [[ZsmPayViewController alloc] init];
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:payVc];
    }else{
        ZsmWithDrawViewController * payVc = [[ZsmWithDrawViewController alloc] init];
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:payVc];
    }
    
    
    return YES;
}
- (NSDictionary *)getUrlParameterWithUrl:(NSURL *)url {
    NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
    //传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
    //回调遍历所有参数，添加入字典
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [parm setObject:obj.value forKey:obj.name];
    }];
    return parm;
}
//以url形式的字符串中获取某一个值
- (NSString *)paramValueOfUrl:(NSString *)url withParam:(NSString *)param
{
    
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^||\\?)+%@=+([^&]*)(&|$)",param];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [url substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        return tagValue;
    }
    return nil;
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
