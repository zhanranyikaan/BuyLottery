//
//  HMTool.h
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMTool;
@protocol HMToolDelegate <NSObject>

@optional
- (void)toolDidClickSure:(HMTool *)tool;
- (void)toolDidClickCancel:(HMTool *)tool;

@end
@interface HMTool : UIView
+ (instancetype)tool;
@property (nonatomic, weak) id<HMToolDelegate> delegate;
@end
