//
//  HMHelp.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMHelp.h"

@implementation HMHelp
+ (instancetype)helpWithDict:(NSDictionary *)dict {
    HMHelp *help = [[self alloc] init];
    help.title = dict[@"title"];
    help.html = dict[@"html"];
    help.helpId  = dict[@"id"];
    return help;
}

+ (NSArray *)helps {
    // 1. 文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
    // 2. 读取文件 - 二进制数据
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // 把二进制数据转成一个数组
    /**
     * NSJSONSerialization 解析json使用的类
     NSJSONReadingMutableContainers = (1UL << 0), 可变的容器
     NSJSONReadingMutableLeaves = (1UL << 1), 叶子可变，跟第一效果一样
     NSJSONReadingAllowFragments = (1UL << 2) 允许一些特殊的格式 (这种格式，肯定不会使用到) "a=b"
     */
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *helps = [NSMutableArray array];
    // 3. 转成模型
    [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HMHelp *help = [HMHelp helpWithDict:obj];
        [helps addObject:help];
    }];
    
   return helps.copy;
}
@end
