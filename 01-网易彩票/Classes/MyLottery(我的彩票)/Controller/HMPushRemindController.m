//
//  HMPushRemindController.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMPushRemindController.h"
#import "HMArrowItem.h"
#import "HMGroup.h"
#import "HMSettingCell.h"
#import "HMBuyRemindController.h"
#import "HMCirclePushController.h"
#import "HMAwardAnimationController.h"
#import "HMOpenPushController.h"
#import "HMScoreLiveController.h"
@interface HMPushRemindController ()
@end

@implementation HMPushRemindController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    // 1. 创建组
    HMGroup *group = [[HMGroup alloc]init];
    // 2. 创建item
    HMArrowItem *item0 = [HMArrowItem itemWithIcon:nil title:@"开奖推送"];
    item0.target = [HMOpenPushController class];
    HMArrowItem *item1 = [HMArrowItem itemWithIcon:nil title:@"比分直播推送"];
    item1.target = [HMScoreLiveController class];
    HMArrowItem *item2 = [HMArrowItem itemWithIcon:nil title:@"中奖动画"];
    item2.target = [HMAwardAnimationController class];
    HMArrowItem *item3 = [HMArrowItem itemWithIcon:nil title:@"购彩提醒"];
    item3.target = [HMBuyRemindController class];
    HMArrowItem *item4 = [HMArrowItem itemWithIcon:nil title:@"圈子推送"];
    item4.target = [HMCirclePushController class];
    //3. 把item放到组里面
    group.items = @[item0, item1, item2, item3, item4];
    
    // 4. 把group放到self.group中
    [self.group addObject:group];
}


@end
