//
//  BasePopView.h
//  BiPay
//
//  Created by zsm on 2019/2/20.
//  Copyright © 2019年 zjs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasePopView : UIView

- (void)showView:(UIView*)view withPopView:(UIView *)popView superView:(UIView *)superView;
- (void)hideViewWithPopView:(UIView *)popView;
@end

NS_ASSUME_NONNULL_END
