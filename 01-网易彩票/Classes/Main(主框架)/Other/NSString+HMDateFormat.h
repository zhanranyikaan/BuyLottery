//
//  NSString+HMDateFormat.h
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HMDateFormat)
// 09:00 HH:mm
- (NSDate *)dateWithFormat:(NSString *)format;
+ (instancetype)stringWithDate:(NSDate *)date format:(NSString *)format;

@end
