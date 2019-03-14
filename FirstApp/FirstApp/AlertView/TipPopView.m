//
//  AuthorityBuyPopView.m
//  BiPay
//
//  Created by zsm on 2019/1/5.
//  Copyright © 2019年 zjs. All rights reserved.
//

#import "TipPopView.h"

@implementation TipPopView

+ (instancetype)instance{
    TipPopView * view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TipPopView class]) owner:nil options:nil].firstObject;
    view.frame = [UIScreen mainScreen].bounds;
    return view;
}

 

- (IBAction)touchClick:(UIButton *)sender {
    if (sender.tag == 0) {
        [self hideView];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tipPopView:button:)]) {
        [self.delegate tipPopView:self button:sender];
    }
}
- (void)hideView{
    [self hideViewWithPopView:self.popView];
}
- (void)showView{
    [self showView:[UIApplication sharedApplication].delegate.window withPopView:self.popView superView:self];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
