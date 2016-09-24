//
//  HMProduct.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMProduct.h"

@implementation HMProduct
+ (instancetype)productWithDict:(NSDictionary *)dict {
    HMProduct *product = [[self alloc]init];
    product.title = dict[@"title"];
    product.icon = dict[@"icon"];
    product.url = dict[@"url"];
    product.customUrl = dict[@"customUrl"];
    return product;
}

+ (NSArray *)products {
    // 文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
    // 二进制数据
    NSData *data = [NSData dataWithContentsOfFile:path];
    // 解析json
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // 转成模型
    NSMutableArray *products = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [products addObject:[HMProduct productWithDict:obj]];
    }];
    return products.copy;
}
@end
