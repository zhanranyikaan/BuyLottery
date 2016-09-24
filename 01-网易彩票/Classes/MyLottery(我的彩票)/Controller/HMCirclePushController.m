//
//  HMCirclePushController.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMCirclePushController.h"
#import "HMGroup.h"
#import "HMSwitchItem.h"
@interface HMCirclePushController ()

@end

@implementation HMCirclePushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

// 加载数据
- (void)loadData {
    // 创建组
    HMGroup *group0 = [[HMGroup alloc]init];
    group0.footerTitle = @"开启后...开启后...开启后...开启后...";
    
    // 创建item
    HMSwitchItem *item0 = [HMSwitchItem itemWithIcon:nil title:@"圈子消息推送"];
    group0.items = @[item0];
    
    HMGroup *group1 = [[HMGroup alloc]init];
        // 创建item
    HMSwitchItem *item1 = [HMSwitchItem itemWithIcon:nil title:@"圈子仅wifi加载图片"];
    group1.items = @[item1];
    
    [self.group addObject:group0];
    [self.group addObject:group1];
}
@end
