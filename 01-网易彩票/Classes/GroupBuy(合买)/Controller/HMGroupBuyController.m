//
//  HMGroupBuyController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMGroupBuyController.h"
#import "UIView+HMExt.h"
@interface HMGroupBuyController ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation HMGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickTitleView:(UIButton *)btn {
    
    CGFloat demoViewH = 0;
    if (self.demoView.height == 0) {
        demoViewH = 200;
    }else {
        demoViewH = 0;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.demoView.height = demoViewH;
        // 在原来的基础上再转M_PI
        btn.imageView.transform = CGAffineTransformRotate(btn.imageView.transform, M_PI);
    }];
}

- (UIView *)demoView {
    if (_demoView == nil) {
        _demoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
        _demoView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_demoView];
    }
    return _demoView;
}

@end
