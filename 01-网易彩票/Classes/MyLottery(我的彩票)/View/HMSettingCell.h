//
//  HMSettingCell.h
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMItem;
@interface HMSettingCell : UITableViewCell
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style;
// item模型
@property (nonatomic, strong) HMItem *item;
/**
 *  是否显示分隔线
 *
 *  @param show 
 */
- (void)showLine:(BOOL)show;
@end
