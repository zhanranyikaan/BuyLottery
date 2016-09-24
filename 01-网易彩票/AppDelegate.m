//
//  AppDelegate.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "AppDelegate.h"
#import "HMMainController.h"
#import "HMSaveDefaluts.h"
#import "HMGuideController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用启动完成之后
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 显示状态栏 - iOS9 之后建议我们把状态栏交给某一个控制器去管理
    [application setStatusBarHidden:NO];
//    [application setStatusBarHidden:YES];
    // 设置状态栏样式
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    // 初始化window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 设置window的背景色
    self.window.backgroundColor = [UIColor whiteColor];
    
        {
        //    // 加载五个导航栏控制器
        //    // 购彩大厅
        ////    UIStoryboard *hallSB = [UIStoryboard storyboardWithName:@"Hall" bundle:nil];
        ////    UINavigationController *hallNav = [hallSB instantiateInitialViewController];
        //    UINavigationController *hallNav = [self navControllerWithStoryboardName:@"Hall"];
        //    // 合买
        //    UINavigationController *groupBuyNav = [self navControllerWithStoryboardName:@"GroupBuy"];
        //    // 幸运选号
        //    UINavigationController *luckyNav = [self navControllerWithStoryboardName:@"Lucky"];
        //    // 开奖信息
        //    UINavigationController *openNav = [self navControllerWithStoryboardName:@"OpenAward"];
        //    //  我的彩票
        //    UINavigationController *myLotteryNav = [self navControllerWithStoryboardName:@"MyLottery"];
        //
        //    // 设置导航到tabbar 中
        //    main.viewControllers = @[hallNav, groupBuyNav, luckyNav, openNav, myLotteryNav];
        //
    }
    // 设置根控制器
    
    [self chooseRootViewController];
    // 让window 可视
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)chooseRootViewController {
    // 判断当前的版本号是否有运行过
    NSString *verson = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    // 用来保存版本号到偏好设置
    NSString *key = @"CFBundleVersion";
    
    // 旧的版本号
    NSString *oldVerson = [HMSaveDefaluts objectForKey:key];
    if (oldVerson == nil || ![oldVerson isEqualToString:verson]) {// 如果是第一次运行，或者是新版本
        // 显示新特性
        HMGuideController *guide = [[HMGuideController alloc]init];
        self.window.rootViewController = guide;
        // 记录当前的版本号
//        [HMSaveDefaluts setObject:verson forKey:key];
    }else {
        // 进行主界面
        HMMainController *main = [[HMMainController alloc]init];

        self.window.rootViewController = main;

    }
    
}

/**
 *  从storyboard 中加载初始化控制器
 *
 *  @param name
 *
 *  @return
 */
//- (UINavigationController *)navControllerWithStoryboardName:(NSString *)name {
//    UIStoryboard *hallSB = [UIStoryboard storyboardWithName:name bundle:nil];
//    UINavigationController *nav = [hallSB instantiateInitialViewController];
//    return nav;
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
