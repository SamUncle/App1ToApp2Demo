//
//  ViewController.m
//  APP2
//
//  Created by zsm on 2019/3/12.
//  Copyright © 2019 zsm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)send:(id)sender {
    NSString *urlStr = [NSString stringWithFormat:@"%@://order=112233445566", @"newbit"];
    
    NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否是否有can打开应用程序，如果成功就打开
    
    if ([[UIApplication sharedApplication] canOpenURL:open_URL_A]) {
        NSLog(@"可以打开");
        [[UIApplication sharedApplication] openURL:open_URL_A options:nil completionHandler:^(BOOL success) {
            
        }];
        
    }
    
}
- (IBAction)withDrawCoin:(UIButton *)sender {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"" message:@"是否同意提币到新比特钱包" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *urlStr = [NSString stringWithFormat:@"%@://withDraw=ineedwithdraw", @"newbit"];
        
        NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否是否有can打开应用程序，如果成功就打开
        
        if ([[UIApplication sharedApplication] canOpenURL:open_URL_A]) {
            NSLog(@"可以打开");
            [[UIApplication sharedApplication] openURL:open_URL_A options:nil completionHandler:^(BOOL success) {
                
            }];
            
        }
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}


@end
