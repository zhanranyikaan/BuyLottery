//
//  HMBuyRemindController.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBuyRemindController.h"
#import "HMGroup.h"
#import "HMSwitchItem.h"
@interface HMBuyRemindController ()

@end

@implementation HMBuyRemindController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)loadData {
    HMGroup *group = [[HMGroup alloc]init];
    // 设置尾部标题
    group.footerTitle = @"开启后,xxxxxxxxxxxxxxx";
    
    HMSwitchItem *item = [HMSwitchItem itemWithIcon:nil title:@"定时提醒"];
    group.items = @[item];
    
    [self.group addObject:group];
    
}

@end
