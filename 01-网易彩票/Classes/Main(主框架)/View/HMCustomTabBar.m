//
//  HMCustomTabBar.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMCustomTabBar.h"
#import "HMTabBarButton.h"
@interface HMCustomTabBar ()
// 当前选中的按钮
@property(nonatomic,weak)UIButton *currentBtn;
@end
@implementation HMCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
//        self.backgroundColor = [UIColor redColor];

//        for (int i = 0; i < 5; i ++) {
//            // 创建按钮
//            HMTabBarButton *btn = [HMTabBarButton buttonWithType:UIButtonTypeCustom];
//            // 设置tag
//            btn.tag = i;
//            // 拼接图片的名字
//            NSString *normalImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
//            NSString *selectImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
//            // 设置按钮图片
//            [btn setBackgroundImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
//            [btn setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
//            // 添加点击事件
//            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
//            if (i == 0) {
//                // 默认选中第一个
////                [self btnClick:btn];
//                btn.selected = YES;
//                self.currentBtn = btn;
//            }
//            // 把按钮添加到view上面
//            [self addSubview:btn];
//        }
    }
    return self;
}

- (void)addButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectImageName {
    // 创建按钮
    HMTabBarButton *btn = [HMTabBarButton buttonWithType:UIButtonTypeCustom];

    // 设置按钮图片
    [btn setBackgroundImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    // 添加点击事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    // 把按钮添加到view上面
    [self addSubview:btn];
}

- (void)btnClick:(UIButton *)btn {
    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(customTabBar:didClickIndex:)]) {
        [self.delegate customTabBar:self didClickIndex:btn.tag];
    }
    // 取消上一个选中的按钮
    self.currentBtn.selected = NO;
    
    // 选中当前点击的按钮
    btn.selected = YES;
    
    //记录当前点击的按钮
    self.currentBtn = btn;
    
}

// 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnY = 0;
    for (int i = 0; i < self.subviews.count; i ++) {
        
        HMTabBarButton *btn = self.subviews[i];
        if (i == 0) {
            // 默认选中第一个
            //                [self btnClick:btn];
            btn.selected = YES;
            self.currentBtn = btn;
        }
        
        CGFloat btnX = btnW * i;
        // 设置tag
        btn.tag = i;
        // 设置frame
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end
