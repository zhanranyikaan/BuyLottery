//
//  HMHelp.h
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHelp : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *helpId;

+ (instancetype)helpWithDict:(NSDictionary *)dict;
+ (NSArray *)helps;
@end
