//
//  HMLuckyController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMLuckyController.h"

@interface HMLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;

@end

@implementation HMLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1.加载动画图片
    UIImage *image0 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    // 2.设置动画图片
    self.lightImageView.animationImages = @[image0, image1];

    // 3.设置动画时间
    self.lightImageView.animationDuration = 0.5;
    
    // 4.设置动画重复次数
    self.lightImageView.animationRepeatCount = 0;
    
    // 5.开始动画
    [self.lightImageView startAnimating];
}


@end
