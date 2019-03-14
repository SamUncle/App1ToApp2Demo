//
//  ZsmPayViewController.m
//  FirstApp
//
//  Created by zsm on 2019/3/13.
//  Copyright © 2019 zsm. All rights reserved.
//

#import "ZsmPayViewController.h"
#import "HBAlertPasswordView.h"
@interface ZsmPayViewController ()<HBAlertPasswordViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *serialNum;
@property (weak, nonatomic) IBOutlet UILabel *orderInfo;
@property (weak, nonatomic) IBOutlet UILabel *count;

@end

@implementation ZsmPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认支付";
}

//MARK:--立即支付
- (IBAction)payClick:(UIButton *)sender {
    
    //处理支付信息
    
    //弹支付框
    //密码框的View
    HBAlertPasswordView *alertPwd = [[HBAlertPasswordView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    alertPwd.delegate = self;
    [self.view addSubview:alertPwd];
    

    
    
}

#pragma mark - <HBAlertPasswordViewDelegate>
- (void)sureActionWithAlertPasswordView:(HBAlertPasswordView *)alertPasswordView password:(NSString *)password {
    [alertPasswordView removeFromSuperview];
    
    //验证密码
    
    //    处理完成通知第三方运营
    BOOL isPayHandle = YES;
    if (isPayHandle) {
        NSString *urlStr = [NSString stringWithFormat:@"%@://result=success", @"thirdParty"];
        
        NSURL* open_URL_A = [NSURL URLWithString:urlStr];//判断是否有can打开应用程序，如果成功就打开
        
        [[UIApplication sharedApplication] openURL:open_URL_A options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
            NSLog(@"succeess:%d",success);
        }];
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
