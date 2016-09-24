//
//  HMItem.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMItem.h"

@implementation HMItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    // HMItem 如果子类使用了这个方法，创建出来的还是父类
    // 类方法，应该使用self,self代表当前类(谁调用就是谁)
    return [[self alloc]initWithIcon:icon title:title];
}

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title {
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    HMItem *item = [[self alloc]initWithIcon:nil title:title];
    item.subTitle = subTitle;
    return item;
}
@end
