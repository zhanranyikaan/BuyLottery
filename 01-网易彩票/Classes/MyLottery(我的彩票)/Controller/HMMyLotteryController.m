//
//  HMMyLotteryController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMMyLotteryController.h"
#import "UIImage+HMStr.h"
@interface HMMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation HMMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 加载图片
    UIImage *image = [[UIImage imageNamed:@"RedButton"] stretchableImage];
    // 2. 拉伸图片
    /*
     取到图片的正中心
     假如宽高都是100 
     100 - 50 -1 = 49
     取到49 * 49这个点，对图片进行平铺
     通常在我们开发中，使用中间点就可以
     只需要避开圆角的地方就可以了
     */
//    NSInteger leftCapWidth = image.size.width * 0.5; // width - leftCapWidth - 1
//
//    NSInteger topCapHeight = image.size.height * 0.5; // height - topCapWidth - 1
//
//    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    // 3. 设置按钮背景图
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    // push
//    [self.navigationController pushViewController:nil animated:YES];
    // model
//    [self presentViewController:nil animated:YES completion:nil];
}


@end
