//
//  HMCustomDatePickerView.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMCustomDatePickerView.h"
#import "HMTool.h"
#import "UIView+HMExt.h"
@interface HMCustomDatePickerView ()<HMToolDelegate>
/**
 *  工具条
 */
@property (nonatomic, weak) HMTool *tool;

/**
 *  时间选择器
 */
@property (nonatomic, weak) UIDatePicker *datePicker;

/**
 *  关闭按钮
 */
@property (nonatomic, weak) UIButton *closeBtn;



@end
@implementation HMCustomDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTool];
        [self setupDatePicker];
    }
    return self;
}

// 初始化时间选择器
- (void)setupDatePicker {
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    // 设置选择的是时间
    datePicker.datePickerMode = UIDatePickerModeTime;
    // 设置时区
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    
    [datePicker addTarget:self action:@selector(dateChange) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:datePicker];
    self.datePicker = datePicker;
}

- (void)dateChange {
    if ([self.delegate respondsToSelector:@selector(customDatePickerDidClickChange:)]) {
        [self.delegate customDatePickerDidClickChange:self];
    }
}

// 初始化工具条
- (void)setupTool {
    HMTool *tool = [HMTool tool];
    
    [self addSubview:tool];
    tool.delegate = self;
    self.tool = tool;
}

- (void)show {
    // window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 直接添加一个按钮
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = window.bounds;
    [close addTarget:self action:@selector(toolDidClickCancel:) forControlEvents:UIControlEventTouchDown];
    [window addSubview:close];
    self.closeBtn = close;
    
    // 设置self的frame
    self.height = 260;// 工具条 44 时间选择器216
    self.width = window.width;
    
    [window addSubview:self];
    // 设置起始位置
    self.y = window.height;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.y = window.height - self.height;
        
    }];
}


- (void)hide {
    [UIView animateWithDuration:0.25 animations:^{
        self.y = [UIScreen mainScreen].bounds.size.height;
    } completion:^(BOOL finished) {
        
        [self.closeBtn removeFromSuperview];
        [self removeFromSuperview];

    }];
    
}

#pragma mark - 工具条代理
- (void)toolDidClickSure:(HMTool *)tool {
    [self hide];
    if ([self.delegate respondsToSelector:@selector(customDatePickerDidClickSure:)]) {
        [self.delegate customDatePickerDidClickSure:self];
    }
}

- (void)toolDidClickCancel:(HMTool *)tool {
    [self hide];
    if ([self.delegate respondsToSelector:@selector(customDatePickerDidClickCancel:)]) {
        [self.delegate customDatePickerDidClickCancel:self];
    }
}

- (void)setCurrentDate:(NSDate *)currentDate {
    _currentDate = currentDate;
    // 设置时间选择器的当前时间
    self.datePicker.date = currentDate;
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    _maximumDate = maximumDate;
    // 设置时间选择器的最大值
    self.datePicker.maximumDate = maximumDate;
}

- (void)setMinimumDate:(NSDate *)minimumDate {
    _minimumDate = minimumDate;
    // 设置时间选择器的最小值
    self.datePicker.minimumDate = minimumDate;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 工具条宽度
    self.tool.width = self.width;
    self.tool.x = 0;
    self.tool.height = 44;
  
    // 设置时间选择器坐标
    self.datePicker.y = self.tool.height;
    self.datePicker.width = self.width;
}

@end
