//
//  HMSettingController.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMSettingController.h"
#import "HMGroup.h"
#import "HMItem.h"
#import "HMTestController.h"
#import "HMArrowItem.h"
#import "HMSwitchItem.h"
#import "HMSettingCell.h"
#import "HMPushRemindController.h"
#import "MBProgressHUD+PKX.h"
#import "HMHelpController.h"
#import "HMAboutController.h"
#import "HMShareController.h"
#import "HMProductController.h"
@interface HMSettingController ()

@end

@implementation HMSettingController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
}

// 加载数据
- (void)loadData {
    // 1. 创建组
    HMGroup *group0 = [[HMGroup alloc]init];
    // 2. 创建item
    HMArrowItem *item0 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"使用兑换码"];
    item0.target = [HMTestController class];
    // 3. 把item 放到组里面去
    group0.items = @[item0];
    // 4. 把组数组放到self.group
    [self.group addObject:group0];
    
    
    // 1. 创建组
    HMGroup *group1 = [[HMGroup alloc]init];
    // 2. 创建item
    HMArrowItem *item1_0 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"推送提醒"];
    item1_0.target = [HMPushRemindController class];
    HMItem *item1_1 = [HMSwitchItem itemWithIcon:@"RedeemCode" title:@"摇一摇机选"];
  
    HMItem *item1_2 = [HMSwitchItem itemWithIcon:@"RedeemCode" title:@"声音效果"];
   
    HMItem *item1_3 = [HMSwitchItem itemWithIcon:@"RedeemCode" title:@"购彩小助手"];
    
    // 3. 把item 放到组里面去
    group1.items = @[item1_0, item1_1, item1_2, item1_3];
    // 4. 把组数组放到self.group
    [self.group addObject:group1];
    
    // 1. 创建组
    HMGroup *group2 = [[HMGroup alloc]init];
    // 2. 创建item
    HMItem *item2_0 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"检测新版本"];
    [item2_0 setBlock:^{
//        NSLog(@"检测新版本");
        [MBProgressHUD showMessage:@"正在检测新版本..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"没有新版本"];
        });
    }];
    HMArrowItem *item2_1 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"帮助"];
    item2_1.target = [HMHelpController class];

    HMArrowItem *item2_2 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"分享"];
    item2_2.target = [HMShareController class];
    
    HMArrowItem *item2_3 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"产品推荐"];
    item2_3.target = [HMProductController class];
    
    HMArrowItem *item2_4 = [HMArrowItem itemWithIcon:@"RedeemCode" title:@"关于我们"];
    item2_4.target = [HMAboutController class];
 
    // 3. 把item 放到组里面去
    group2.items = @[item2_0, item2_1, item2_2, item2_3, item2_4];
    // 4. 把组数组放到self.group
    [self.group addObject:group2];
}

@end
