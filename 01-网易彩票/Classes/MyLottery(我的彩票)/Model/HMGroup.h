//
//  HMGroup.h
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMGroup : NSObject
// 行的数据
@property (nonatomic, strong) NSArray *items;
// 头部标题
@property (nonatomic, copy) NSString *headerTitle;
// 尾部标题
@property (nonatomic, copy) NSString *footerTitle;
@end
