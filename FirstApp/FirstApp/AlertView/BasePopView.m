//
//  BasePopView.m
//  BiPay
//
//  Created by zsm on 2019/2/20.
//  Copyright © 2019年 zjs. All rights reserved.
//

#import "BasePopView.h"

@implementation BasePopView

- (void)showView:(UIView*)view withPopView:(UIView *)popView superView:(UIView *)superView{
    popView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:.3 delay:0.0 options:(7<<16) animations:^{
//        self.dimmingView.alpha = 1.0;
        popView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        popView.transform = CGAffineTransformIdentity;
//        if (completion) {
//            completion(finished);
//        }
    }];
    [view addSubview:superView];
}
- (void)hideViewWithPopView:(UIView *)popView{

    [UIView animateWithDuration:.3 delay:0.0 options:(7<<16) animations:^{
//        self.dimmingView.alpha = 0.0;
        popView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
//        if (completion) {
            popView.transform = CGAffineTransformIdentity;
        
//            completion(finished);
//        }
    }];
}



@end
