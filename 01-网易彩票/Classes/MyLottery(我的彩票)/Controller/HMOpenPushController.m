//
//  HMOpenPushController.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMOpenPushController.h"
#import "HMGroup.h"
#import "HMSwitchItem.h"
#import "HMSettingCell.h"
#import "UIView+HMExt.h"
@interface HMOpenPushController ()

@end

@implementation HMOpenPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMOpenPushHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = headerView;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self loadData];
}


- (void)loadData {
    HMGroup *group = [[HMGroup alloc]init];
    
    HMSwitchItem *item0 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item1 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item2 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item3 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item4 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item5 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    HMSwitchItem *item6 = [HMSwitchItem itemWithTitle:@"双色球" subTitle:@"每周二、四、日开奖"];
    
    group.items = @[item0, item1, item2, item3, item4, item5, item6];
    
    [self.group addObject:group];
}


// 父类的数据源方法不能满足我们的需求，我们就重写方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMSettingCell *cell = [HMSettingCell settingCellWithTableView:tableView cellStyle:UITableViewCellStyleSubtitle];
    // 设置cell的数据
    // 取出组对应的数据
    HMGroup *group = self.group[indexPath.section];
    // 取出对应行的数据
    HMItem *item = group.items[indexPath.row];
    if (indexPath.row == group.items.count - 1) {
        [cell showLine:NO];
    }else {
        [cell showLine:YES];
    }
    cell.item = item;
    return cell;
}


@end
