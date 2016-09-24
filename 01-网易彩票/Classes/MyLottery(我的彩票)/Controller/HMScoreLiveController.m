//
//  HMScoreLiveController.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMScoreLiveController.h"
#import "HMGroup.h"
#import "HMSwitchItem.h"
#import "HMLabelItem.h"
#import "HMCustomDatePickerView.h"
#import "NSString+HMDateFormat.h"
@interface HMScoreLiveController ()<HMCustomDatePickerViewDelegate>

@end

@implementation HMScoreLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData {
    // 第一组
    HMGroup *group0 = [[HMGroup alloc]init];
    group0.footerTitle = @"开启后，当我投注的比赛开启后，当我投注的比赛开启后，当我投注的比赛开启后，当我投注的比赛开启后，当我投注的比赛开启后，当我投注的比赛";
    
    HMSwitchItem *item0 = [HMSwitchItem itemWithIcon:nil title:@"推送我关注的比赛"];
    group0.items = @[item0];
    
    // 第二组
    HMGroup *group1 = [[HMGroup alloc]init];
    group1.headerTitle = @"只有在以下时间段内接收推送";
    
    HMLabelItem *item1 = [HMLabelItem labelItemWithTitle:@"起始时间" value:@"09:00"];
    HMLabelItem *item2 = [HMLabelItem labelItemWithTitle:@"结束时间" value:@"17:00"];
    __weak HMLabelItem *weakItem1 = item1;
    __weak HMLabelItem *weakItem2 = item2;
//    __weak HMScoreLiveController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
//    __block 在block中修改变量的值
    // 设置block，让它在点击的时候，弹出时间选择器
    [item1 setBlock:^{
       // 弹出时间选择
//        NSLog(@"弹出时间选择");
        HMCustomDatePickerView *customDatePicker = [[HMCustomDatePickerView alloc]init];
//        customDatePicker.backgroundColor = [UIColor redColor];
        customDatePicker.delegate = weakSelf;
        // 记录当前的模型
        customDatePicker.model = weakItem1;
        
        // 把字符串转成时间
        
        customDatePicker.currentDate = [weakItem1.value dateWithFormat:@"HH:mm"];
        
        // 设置最大时间
        customDatePicker.maximumDate = [weakItem2.value dateWithFormat:@"HH:mm"];
        // 让它显示出来
        [customDatePicker show];
        
        
    }];
    
    
    group1.items = @[item1];
    
    // 第三组
    HMGroup *group2 = [[HMGroup alloc]init];
   
    
    [item2 setBlock:^{
        // 弹出时间选择
        //        NSLog(@"弹出时间选择");
        HMCustomDatePickerView *customDatePicker = [[HMCustomDatePickerView alloc]init];
        //        customDatePicker.backgroundColor = [UIColor redColor];
        customDatePicker.delegate = weakSelf;
        // 记录当前的模型
        customDatePicker.model = weakItem2;
        
        // 把字符串转成时间
        
        customDatePicker.currentDate = [weakItem2.value dateWithFormat:@"HH:mm"];
        // 设置最小时间
        customDatePicker.minimumDate = [weakItem1.value dateWithFormat:@"HH:mm"];
        // 让它显示出来
        [customDatePicker show];
    }];
    
    group2.items = @[item2];
    
    [self.group addObject:group0];
    [self.group addObject:group1];
    [self.group addObject:group2];
}

#pragma mark - 时间选择器代理
- (void)customDatePickerDidClickSure:(HMCustomDatePickerView *)customDatePicker {
    // 取到选中的时间
    NSDate *date = customDatePicker.datePicker.date;
//    NSLog(@"%@",customDatePicker.datePicker.date);
    // 拿到对应的labelItem,设置value 值
    HMLabelItem *item = customDatePicker.model;
    // 时间转化成字符串
   item.value = [NSString stringWithDate:date format:@"HH:mm"];
    // 刷新表格
    [self.tableView reloadData];
}

- (void)customDatePickerDidClickChange:(HMCustomDatePickerView *)customDatePicker {
    // 取到选中的时间
    NSDate *date = customDatePicker.datePicker.date;
//        NSLog(@"%@",customDatePicker.datePicker.date);
    // 拿到对应的labelItem,设置value 值
    HMLabelItem *item = customDatePicker.model;
    // 时间转化成字符串
   
    
    item.value = [NSString stringWithDate:date format:@"HH:mm"];
    // 刷新表格
    [self.tableView reloadData];
}

- (void)customDatePickerDidClickCancel:(HMCustomDatePickerView *)customDatePicker {
    // 取到选中的时间
    NSDate *date = customDatePicker.currentDate;
    //    NSLog(@"%@",customDatePicker.datePicker.date);
    // 拿到对应的labelItem,设置value 值
    HMLabelItem *item = customDatePicker.model;
    // 时间转化成字符串
  item.value = [NSString stringWithDate:date format:@"HH:mm"];
    // 刷新表格
    [self.tableView reloadData];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
