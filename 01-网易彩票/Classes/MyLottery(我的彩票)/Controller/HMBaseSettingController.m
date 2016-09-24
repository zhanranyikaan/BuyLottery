//
//  HMBaseSettingController.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBaseSettingController.h"
#import "HMGroup.h"
#import "HMItem.h"
#import "HMArrowItem.h"
#import "HMSwitchItem.h"
#import "HMSettingCell.h"
@interface HMBaseSettingController ()
// 再次声明，不需要再次声明只读
@property (nonatomic, strong) NSMutableArray *group;
@end

@implementation HMBaseSettingController

- (instancetype)init {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置组之前的间隔
    self.tableView.sectionFooterHeight = 0;
    // 设置inset
    self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    // 去除分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

// 返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.group.count;
}

// 返回每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出组对应的数据
    HMGroup *group = self.group[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMSettingCell *cell = [HMSettingCell settingCellWithTableView:tableView];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 判断点击的是哪一个，再来执行一段代码
    // block可以保存一段代码，在有需要的时候执行
    // 取出组对应的数据
    HMGroup *group = self.group[indexPath.section];
    // 取出对应行的数据
    HMItem *item = group.items[indexPath.row];
    
    // 判断是否有block
    if (item.block) {
        // 执行block
        item.block();
        return;
    }
    // 判断是否是箭头模型，如果是再来看能不能跳转
    if ([item isKindOfClass:[HMArrowItem class]]) {
//        NSString *className = @"HMSettingController";
//        NSClassFromString(className);
        HMArrowItem *arrow = (HMArrowItem *)item;
        Class class = arrow.target;
        //    [[类名 alloc]init];
        // 根据类名来初始化一个对象
        UIViewController *vc = [[class alloc]init];
        if (vc) {
            // 设置标题
            vc.title = item.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HMGroup *group = self.group[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    HMGroup *group = self.group[section];
    return group.footerTitle;
}

- (NSMutableArray *)group {
    if (_group == nil) {
        _group = [NSMutableArray array];
    }
    return _group;
}

@end
