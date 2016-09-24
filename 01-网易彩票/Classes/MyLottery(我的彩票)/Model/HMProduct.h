//
//  HMProduct.h
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *customUrl;
+ (instancetype)productWithDict:(NSDictionary *)dict;
+ (NSArray *)products;
@end
