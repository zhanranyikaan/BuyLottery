//
//  HMCustomTabBar.h
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMCustomTabBar;
@protocol HMCustomTabBarDelegate <NSObject>

@optional
- (void)customTabBar:(HMCustomTabBar *)tabbar didClickIndex:(NSInteger)index;

@end
@interface HMCustomTabBar : UIView
@property (nonatomic ,weak) id<HMCustomTabBarDelegate> delegate;
/**
 *  添加tabbar 按钮
 *
 *  @param normalImageName 默认的图片名字
 *  @param selectImageName 选中的图片名字
 */
- (void)addButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectImageName;
@end
