//
//  HMItem.h
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef NS_ENUM(NSInteger,HMItemType) {
//    /**
//     *  箭头
//     */
//    HMItemTypeArrow ,
//    /**
//     *  开关
//     */
//    HMItemTypeSwitch
//};

@interface HMItem : NSObject
/**
 *   图片
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, copy) NSString *subTitle;
/**
 *  附件类型
 */
//@property (nonatomic, assign) HMItemType type;



/**
 *  点击执行的block
 */
@property (nonatomic, copy) void (^block)();

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
