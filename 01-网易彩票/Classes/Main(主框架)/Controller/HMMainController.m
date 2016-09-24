//
//  HMMainController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMMainController.h"
#import "HMCustomTabBar.h"
#import "HMBaseNavController.h"
@interface HMMainController ()<HMCustomTabBarDelegate>

@end

@implementation HMMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewControllers];
    
    [self setupTabbar];
    
    //    self.selectedIndex
        
    
//    UILabel *label = [UILabel appearance];
//    label.textColor = [UIColor redColor];
//    label.font = [UIFont systemFontOfSize:100];
}

// 初始化自定义的tabbar
- (void)setupTabbar {
    // 移除系统的tabbar
//    [self.tabBar removeFromSuperview];
    
    HMCustomTabBar *customTabBar = [[HMCustomTabBar alloc]init];
    customTabBar.delegate = self;
    // 设置frame
    customTabBar.frame = self.tabBar.bounds;
    
    // 动态添加tabbar按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *normalImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selectImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        [customTabBar addButtonWithNormalImageName:normalImageName selectedImageName:selectImageName];
    }
    
    [self.tabBar addSubview:customTabBar];
}

// 动态加载子控制器
- (void)loadViewControllers {
    // 加载五个导航栏控制器
    // 购彩大厅
    HMBaseNavController *hallNav = [self navControllerWithStoryboardName:@"Hall"];
    // 设置购彩大厅的标题
//        hallNav.tabBarItem.title = @"购彩大厅";
    // 设置风彩大厅的图片
//    UIImage *hallImage = [[UIImage imageNamed:@"TabBar1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    hallNav.tabBarItem.image = hallImage;
    // 合买
    HMBaseNavController *groupBuyNav = [self navControllerWithStoryboardName:@"GroupBuy"];
    // 幸运选号
    HMBaseNavController *luckyNav = [self navControllerWithStoryboardName:@"Lucky"];
    // 开奖信息
    HMBaseNavController *openNav = [self navControllerWithStoryboardName:@"OpenAward"];
    //  我的彩票
    HMBaseNavController *myLotteryNav = [self navControllerWithStoryboardName:@"MyLottery"];
    
    // 设置导航到tabbar 中
    self.viewControllers = @[hallNav, groupBuyNav, luckyNav, openNav, myLotteryNav];
    
}


/**
 *  从storyboard 中加载初始化控制器
 *
 *  @param name
 *
 *  @return
 */
- (HMBaseNavController *)navControllerWithStoryboardName:(NSString *)name {
    UIStoryboard *hallSB = [UIStoryboard storyboardWithName:name bundle:nil];
    // 加载初始化控制器 也就是有剪头指向
    HMBaseNavController *nav = [hallSB instantiateInitialViewController];
    // 使用id来加载对应的控制器
//    [hallSB instantiateViewControllerWithIdentifier:@""]
    return nav;
}

#pragma mark - 自定义tabbar的代理回调
- (void)customTabBar:(HMCustomTabBar *)tabbar didClickIndex:(NSInteger)index {
    self.selectedIndex = index;
}


@end
