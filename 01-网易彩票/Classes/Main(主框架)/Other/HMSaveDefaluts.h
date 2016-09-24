//
//  HMSaveDefaluts.h
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMSaveDefaluts : NSObject
/**
 *  保存值到UserDefaults
 *
 *  @param obj 值
 *  @param key key
 */
+ (void)setObject:(id)obj forKey:(NSString *)key;
/**
 *  从偏好设置中取出值
 *
 *  @param key
 *
 *  @return
 */
+ (id)objectForKey:(NSString *)key;

+ (BOOL)boolForKey:(NSString *)key;
@end
