//
//  HMSwitchItem.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMSwitchItem.h"

@implementation HMSwitchItem


- (BOOL)on {
    // 取出开关状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:self.title];
}

- (void)setOn:(BOOL)on {
    // 保存数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 保存开关状态
    [defaults setBool:on forKey:self.title];
    // 同步
    [defaults synchronize];
}
@end
