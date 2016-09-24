//
//  HMLabelItem.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMLabelItem.h"

@implementation HMLabelItem
+ (instancetype)labelItemWithTitle:(NSString *)title value:(NSString *)value {
    HMLabelItem *item = [self itemWithIcon:nil title:title];
    // 判断时间是否有默认值
    if (item.value == nil) {
        // 默认值
        item.value = value;
    }
    return item;
}

- (NSString *)value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:self.title];
}

- (void)setValue:(NSString *)value {
    // 保存选好的时间
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:self.title];
    // 同步
    [defaults synchronize];
}
@end
