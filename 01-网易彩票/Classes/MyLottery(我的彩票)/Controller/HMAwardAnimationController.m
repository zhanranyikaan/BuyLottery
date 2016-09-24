//
//  HMAwardAnimationController.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMAwardAnimationController.h"
#import "HMGroup.h"
#import "HMSwitchItem.h"
@interface HMAwardAnimationController ()

@end

@implementation HMAwardAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}

- (void)loadData {
    HMGroup *group0 = [[HMGroup alloc]init];
    group0.footerTitle = @"开启后...开启后...开启后...开启后...";
    
    // 创建item
    HMSwitchItem *item0 = [HMSwitchItem itemWithIcon:nil title:@"中奖动画"];
    group0.items = @[item0];
    [self.group addObject:group0];

}

@end
