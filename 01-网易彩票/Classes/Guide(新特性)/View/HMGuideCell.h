//
//  HMGuideCell.h
//  01-网易彩票
//
//  Created by HM on 16/3/17.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMGuideCell : UICollectionViewCell
@property (nonatomic, copy) NSString *imageName;
/**
 *  点击开始按钮的回调
 */
@property (nonatomic, copy) void(^clickStartBtnBlock)();
- (void)showStartBtn:(BOOL)show;
@end
