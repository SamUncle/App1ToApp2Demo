//
//  AuthorityBuyPopView.h
//  BiPay
//
//  Created by zsm on 2019/1/5.
//  Copyright © 2019年 zjs. All rights reserved.
//

#import "BasePopView.h"

NS_ASSUME_NONNULL_BEGIN
@class TipPopView;
@protocol TipPopViewDelegate <NSObject>

- (void)tipPopView:(TipPopView *)view button:(UIButton *)button;

@end
@interface TipPopView : BasePopView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confrimButton;

@property (weak, nonatomic) IBOutlet UIView *popView;
@property (nonatomic, weak) id <TipPopViewDelegate> delegate;
+ (instancetype)instance;
//- (void)showView:(UIView*)view;
- (void)showView;
- (void)hideView;
@end

NS_ASSUME_NONNULL_END
