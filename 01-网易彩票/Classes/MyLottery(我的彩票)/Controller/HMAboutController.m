//
//  HMAboutController.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMAboutController.h"
#import "HMGroup.h"
#import "HMArrowItem.h"
#import "HMSettingCell.h"
@interface HMAboutController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation HMAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.tableHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"HMAboutHeaderView" owner:nil options:nil] lastObject];
    [self loadData];
    // Do any additional setup after loading the view.
}
// 评分支持的时候直接打开应用的连接就可以了 https://itunes.apple.com/cn/app/song-guo-sheng-huo/id1055956125?mt=8
- (void)loadData {
    
    HMGroup *group = [[HMGroup alloc]init];
    
    HMArrowItem *item0 = [HMArrowItem itemWithIcon:nil title:@"评分支持"];
    [item0 setBlock:^{
        // 去评分 - 在商店中打开应用
        NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/song-guo-sheng-huo/id1055956125?mt=8"];
        
        [[UIApplication sharedApplication]openURL:url];
        
    }];
    
    HMArrowItem *item1 = [HMArrowItem itemWithTitle:@"客服电话" subTitle:@"10010"];
    [item1 setBlock:^{
        // 在iOS8之后，打完电话会回到我们的应用
        // http://
        // 方法一
        NSURL *url = [NSURL URLWithString:@"tel://10010"];
        // 方法二 - 拨打的时候会讯问是否拨打，打完之后会回到应用,但是是私有API使用了不能上架
//         NSURL *url = [NSURL URLWithString:@"telprompt://10010"];
       
       // 拨打电话
//        [[UIApplication sharedApplication]openURL:url];
         // 方法三 - 拨打的时候会讯问是否拨打，打完之后会回到应用
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:request];
    }];
    
    group.items = @[item0, item1];
    
    [self.group addObject:group];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMSettingCell *cell = [HMSettingCell settingCellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
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

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
    }
    return _webView;
}

@end
