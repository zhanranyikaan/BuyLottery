//
//  NSString+HMDateFormat.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "NSString+HMDateFormat.h"

@implementation NSString (HMDateFormat)
- (NSDate *)dateWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // 设置时间格式
    formatter.dateFormat = format;
    return [formatter dateFromString:self];
}

+ (instancetype)stringWithDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // 设置时间格式
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}
@end
