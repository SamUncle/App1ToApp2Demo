//
//  ViewController.m
//  FirstApp
//
//  Created by zsm on 2019/3/12.
//  Copyright © 2019 zsm. All rights reserved.
//

#import "ViewController.h"
#import "ZsmPayViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
//MARK:--处理完订单返回结果给第三方运营
- (IBAction)receiveOrderHandle:(id)sender {
    
    ZsmPayViewController * payVc = [[ZsmPayViewController alloc] init];
    [self.navigationController pushViewController:payVc animated:YES];
//    NSString *urlStr = [NSString stringWithFormat:@"%@://result=success", @"thirdParty"];
//    
//    NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否有can打开应用程序，如果成功就打开
//    
//    if ([[UIApplication sharedApplication] canOpenURL:open_URL_A]) {
//        NSLog(@"可以打开");
//        [[UIApplication sharedApplication] openURL:open_URL_A options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
//            
//        }];
//        
//    }
}

@end
