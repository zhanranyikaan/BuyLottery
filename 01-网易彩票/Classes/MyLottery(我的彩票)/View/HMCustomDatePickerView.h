//
//  HMCustomDatePickerView.h
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMCustomDatePickerView;
@protocol HMCustomDatePickerViewDelegate <NSObject>

@optional
- (void)customDatePickerDidClickSure:(HMCustomDatePickerView *)customDatePicker;
- (void)customDatePickerDidClickCancel:(HMCustomDatePickerView *)customDatePicker;
- (void)customDatePickerDidClickChange:(HMCustomDatePickerView *)customDatePicker;
@end


@interface HMCustomDatePickerView : UIView

/**
 *   调用view的模型
 */
@property (nonatomic, strong) id model;
/**
 *  当前的时间
 */
@property (nonatomic, strong) NSDate *currentDate;
/**
 *  最小时间
 */
@property (nonatomic, strong) NSDate *minimumDate;
/**
 *  最大时间
 */
@property (nonatomic, strong) NSDate *maximumDate;

@property (nonatomic, weak) id<HMCustomDatePickerViewDelegate> delegate;
@property (nonatomic, weak, readonly) UIDatePicker *datePicker;

// 显示时间选择器
- (void)show;
/**
 *  隐藏时间选择器
 */
- (void)hide;
@end
