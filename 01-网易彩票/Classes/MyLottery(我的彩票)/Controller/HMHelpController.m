//
//  HMHelpController.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMHelpController.h"
#import "HMGroup.h"
#import "HMArrowItem.h"
#import "HMHelp.h"
#import "HMHTMLController.h"
#import "HMBaseNavController.h"
@interface HMHelpController ()
@property (nonatomic, strong) NSArray *helps;
@end

@implementation HMHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData {
    // 创建组
    HMGroup *group = [[HMGroup alloc]init];
    NSMutableArray *items = [NSMutableArray array];
    // 创建item
    [self.helps enumerateObjectsUsingBlock:^(HMHelp  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HMArrowItem *item = [HMArrowItem itemWithIcon:nil title:obj.title];
        [items addObject:item];
    }];
    
    group.items = items.copy;
    
    [self.group addObject:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出数据
    HMGroup *group = self.group[indexPath.section];
    HMItem *item = group.items[indexPath.row];
    
    HMHTMLController *htmlVC = [[HMHTMLController alloc]init];
    // 设置标题
    htmlVC.title = item.title;
    // 把help 模型传过去
    htmlVC.help = self.helps[indexPath.row];
    
    HMBaseNavController *nav = [[HMBaseNavController alloc]initWithRootViewController:htmlVC];
    
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (NSArray *)helps {
    if (_helps == nil) {
        //        // 1. 文件路径
        //        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        //        // 2. 读取文件 - 二进制数据
        //        NSData *data = [NSData dataWithContentsOfFile:path];
        //
        //        // 把二进制数据转成一个数组
        //        /**
        //         * NSJSONSerialization 解析json使用的类
        //         NSJSONReadingMutableContainers = (1UL << 0), 可变的容器
        //         NSJSONReadingMutableLeaves = (1UL << 1), 叶子可变，跟第一效果一样
        //         NSJSONReadingAllowFragments = (1UL << 2) 允许一些特殊的格式 (这种格式，肯定不会使用到) "a=b"
        //         */
        //        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //        NSMutableArray *helps = [NSMutableArray array];
        //        // 3. 转成模型
        //        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //            HMHelp *help = [HMHelp helpWithDict:obj];
        //            [helps addObject:help];
        //        }];
        //        
        //        _helps = helps.copy;
        _helps = [HMHelp helps];
        
    }
    return _helps;
}

@end
