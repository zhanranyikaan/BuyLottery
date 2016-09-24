//
//  HMBaseNavController.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMBaseNavController.h"

@interface HMBaseNavController ()

@end

@implementation HMBaseNavController

// 加载代码的时候(启动程序的时候)
// 不管有不有用到，都会去调用
// 在很多第三方会使用到，只需要拖到项目中，就起作用(键盘处理)
+ (void)load {
//    NSLog(@"load");
}

// 当第一次使用的时候会调用
+ (void)initialize {
//    NSLog(@"initialize");
    // self 当前当前的类
    // 判断如果是当前的类(非子类)，才调用方法
    if (self == [HMBaseNavController class]) {
        [self setupNav];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

+ (void)setupNav {
//    NSLog(@"setupNav");
    
    // 获取全局的对象,对此对象进行设置，整个项目都会起作用
    UINavigationBar *bar = [UINavigationBar appearance];
    /*
     UIBarMetricsDefault, 横屏竖屏都生效
     UIBarMetricsCompact, 只有横屏的时候才生效
     */
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置标题属性
    NSDictionary *att = @{
                          NSForegroundColorAttributeName:[UIColor whiteColor],
                          NSFontAttributeName:[UIFont systemFontOfSize:16]
                          };
    [bar setTitleTextAttributes:att];
    
    // 为行不影响背景色，但是会影响添加到它上面的view(导航栏上的按钮，返回按钮)
    bar.tintColor = [UIColor whiteColor];
    // 可以设置导航栏背景颜色
    //    bar.barTintColor = [UIColor redColor];
    
    // 导航栏item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:att forState:UIControlStateNormal];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 设置push的时候隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
