//
//  HMHallController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMHallController.h"
#import "UIView+HMExt.h"
@interface HMHallController ()
/**
 *  蒙板
 */
@property(nonatomic,weak)UIView *coverView;
/**
 *   活动图片
 */
@property(nonatomic,weak)UIImageView *activityImageView;
@end

@implementation HMHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self setupLeftItem];
}

// 方法一
// 初始化活动按钮
- (void)setupLeftItem {
    // 活动图片
    UIImage *image = [[UIImage imageNamed:@"CS50_activity_image"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickActivity)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (IBAction)clickActivity {
    //    NSLog(@"点击活动");
    // 获取 应用的窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 显示一个蒙板
    UIView *coverView = [[UIView alloc]initWithFrame:window.bounds];
    // 设置背景色
    coverView.backgroundColor = [UIColor blackColor];
    // 设置透明度
    coverView.alpha = 0.3;
    // 如果直接添加到self.view是不能盖住导航栏和tabbar
    [window addSubview:coverView];
    self.coverView = coverView;
    
    // 显示活动图片 - 不需要设置图片大小
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    // 设置图片位置
    imageView.center = window.center;
    // 打开用户交互
    imageView.userInteractionEnabled = YES;
    
    [window addSubview:imageView];
    self.activityImageView = imageView;
    
    // 关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置图片
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    // 设置frame
    //    closeBtn.frame = CGRectMake(imageView.bounds.size.width - 30, 0, 30, 30);
    // 如果使用自动布局，必须先关闭
    closeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    // 在添加约束之前，必须先添加subView
    [imageView addSubview:closeBtn];
    // 自动布局
    // 方法一
    /**
     *  constraintWithItem 要约束的对象
        attribute 约束的属性
        relatedBy 关系(大于，小于，等于)
        toItem 跟哪个view相比
        attribute 跟哪个属性比较
        multiplier 倍数
        constant 常量值
     */
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:closeBtn.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    // 自动布局动画最常用的方式
//    top.constant = 10;
//    [imageView layoutIfNeeded];
//
//    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:closeBtn.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//    
//    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
//    
//    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:closeBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
//    
//    [imageView addConstraints:@[top, right]];
//    [closeBtn addConstraints:@[width, height]];
    
    
    // 方法二 - VFL
    /*
     1. 水平方向 H:
     2. 垂直方向 V:
     3. superView |
     4. item [itemName]
     5. 设置item的值 [closeBtn(==30)] 如果是H 就是设置宽度 如果是V就是设置高度
     6. 设置间隔 -10-,默认跟superView之前是8
     7. @{@"closeBtn":closeBtn} 与 NSDictionaryOfVariableBindings(closeBtn) 是一样的
     8. metrics 传递数据值 @{@"width":@30} [close(==width)] 设置item的宽度
     */
    NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[close(==width)]|" options:0 metrics:@{@"width":@30} views:@{@"close":closeBtn}];
    
    NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[closeBtn(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(closeBtn)];
    
    [imageView addConstraints:constraintsH];
    [imageView addConstraints:constraintsV];
    
    // 添加按钮点击事件
    [closeBtn addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];

}

// 点击关闭按钮
- (void)closeView:(UIButton *)btn {
    
//    // 修改蒙板的位置
//    CGRect coverFrame = self.coverView.frame;
//    coverFrame.origin.y += coverFrame.size.height;
//    // 修改活动图片的位置
//    CGRect imageFrame = self.activityImageView.frame;
//    imageFrame.origin.y += coverFrame.size.height;
    
    [UIView animateWithDuration:0.3 animations:^{
//        self.coverView.frame = coverFrame;
//        self.activityImageView.frame = imageFrame;
        self.coverView.y += self.coverView.height;
        self.activityImageView.y += self.coverView.height;
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.activityImageView removeFromSuperview];
    }];
}

@end
