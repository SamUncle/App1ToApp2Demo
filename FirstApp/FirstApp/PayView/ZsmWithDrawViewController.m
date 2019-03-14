//
//  ZsmWithDrawViewController.m
//  FirstApp
//
//  Created by zsm on 2019/3/13.
//  Copyright © 2019 zsm. All rights reserved.
//

#import "ZsmWithDrawViewController.h"
#import "TipPopView.h"
@interface ZsmWithDrawViewController ()<TipPopViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *coinType;
@property (weak, nonatomic) IBOutlet UILabel *count;

@end

@implementation ZsmWithDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认提币";
}

- (IBAction)confirmWithDraw:(UIButton *)sender {
    //    处理完成通知第三方运营
//
    TipPopView * popView = [TipPopView instance];
    popView.delegate = self;
    popView.title.text = @"是否同意新比特钱包进行提币";
    [popView showView];
//    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"" message:@"是否同意新比特钱包进行提币" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        BOOL isPayHandle = YES;
//        if (isPayHandle) {
//            NSString *urlStr = [NSString stringWithFormat:@"%@://address=ox112233445566", @"thirdParty"];
//            
//            NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否有can打开应用程序，如果成功就打开
//            
//            [[UIApplication sharedApplication] openURL:open_URL_A options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
//                NSLog(@"succeess:%d",success);
//            }];
//        }
//    }];
//    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    [alert addAction:ok];
//    [alert addAction:cancel];
//    [self presentViewController:alert animated:YES completion:^{
//        
//    }];
   
}
- (void)tipPopView:(TipPopView *)view button:(UIButton *)button
{
    if (button.tag == 1) {
        
        BOOL isPayHandle = YES;
        if (isPayHandle) {
            NSString *urlStr = [NSString stringWithFormat:@"%@://address=ox112233445566", @"thirdParty"];

            NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否有can打开应用程序，如果成功就打开

            [[UIApplication sharedApplication] openURL:open_URL_A options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
                NSLog(@"succeess:%d",success);
            }];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
