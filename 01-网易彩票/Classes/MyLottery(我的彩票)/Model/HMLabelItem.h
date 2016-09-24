//
//  HMLabelItem.h
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMItem.h"

@interface HMLabelItem : HMItem
/**
 *  label的值
 */
@property (nonatomic, copy) NSString *value;
+ (instancetype)labelItemWithTitle:(NSString *)title value:(NSString *)value;
@end
