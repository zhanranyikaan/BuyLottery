//
//  HMSettingCell.m
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMSettingCell.h"
#import "HMArrowItem.h"
#import "HMSwitchItem.h"
#import "HMLabelItem.h"
#import "UIView+HMExt.h"
@interface HMSettingCell ()
// 开关
@property (nonatomic, strong) UISwitch *accessorySwitch;
// 箭头
@property (nonatomic, strong) UIImageView *accessoryArrow;
// label
@property (nonatomic, strong) UILabel *accessoryLabel;

// 分隔线
@property (nonatomic, strong) UIView *lineView;

@end
@implementation HMSettingCell
+ (instancetype)settingCellWithTableView:(UITableView *)tableView {
    return [self settingCellWithTableView:tableView cellStyle:UITableViewCellStyleDefault];
}

+ (instancetype)settingCellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style {
    static NSString *ID = @"SettingCell";
    HMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 判断是否为nil
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:style reuseIdentifier:ID];
        [cell setupCell];
    }
    return cell;
}

// 设置cell的样式
- (void)setupCell {
    // 设置字体
    self.textLabel.font = [UIFont systemFontOfSize:14.f];
    // 字体颜色
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor colorWithRed:210 / 255.0 green:204/255.0 blue:205 / 255.0 alpha:1];
    self.selectedBackgroundView = selectedView;
}

- (void)setItem:(HMItem *)item {
    _item = item;
    
    // 设置图片
    // CUICatalog: Invalid asset name supplied: (null)
    // 如果图片名字为nil，就会报此错误
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    
    // 设置标题
    self.textLabel.text = item.title;
    // 设置副标题
    self.detailTextLabel.text = item.subTitle;
    
    self.selectionStyle = [item isKindOfClass:[HMSwitchItem class]] ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
    
    if ([item isKindOfClass:[HMArrowItem class]]) {// 箭头
        self.accessoryView = self.accessoryArrow;
        
    }else if([item isKindOfClass:[HMSwitchItem class]]){// 开关
        HMSwitchItem *switchItem = (HMSwitchItem *)item;
        // 取出开关状态
        //        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        //        self.accessorySwitch.on = [defaults boolForKey:item.title];
        self.accessorySwitch.on = switchItem.on;
        self.accessoryView = self.accessorySwitch;
        
    }else if([item isKindOfClass:[HMLabelItem class]]){// 开关
        // 转成label模型
        HMLabelItem *labelItem = (HMLabelItem *)item;
        // 设置label的值
        self.accessoryLabel.text = labelItem.value;
        // 让label 自适应
        [self.accessoryLabel sizeToFit];
        self.accessoryView = self.accessoryLabel;
    }
    
}

// 开关状态发生改变
- (void)switchChange {
    //    NSLog(@"点击开关");
    //    // 保存数据
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //
    //    // 保存开关状态
    //    [defaults setBool:self.accessorySwitch.isOn forKey:self.item.title];
    //    // 同步
    //    [defaults synchronize];
    //    NSLog(@"%@",NSHomeDirectory());
    HMSwitchItem *switchItem = (HMSwitchItem *)self.item;
    switchItem.on = self.accessorySwitch.isOn;
}

- (UISwitch *)accessorySwitch {
    if (_accessorySwitch == nil) {
        _accessorySwitch = [[UISwitch alloc]init];
        // 添加事件
        [_accessorySwitch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    return _accessorySwitch;
}

- (UIImageView *)accessoryArrow {
    if (_accessoryArrow == nil) {
        _accessoryArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _accessoryArrow;
}

- (UILabel *)accessoryLabel {
    if (_accessoryLabel == nil) {
        _accessoryLabel = [[UILabel alloc]init];
        _accessoryLabel.textColor = [UIColor lightGrayColor];
        _accessoryLabel.font = [UIFont systemFontOfSize:13.f];
    }
    return _accessoryLabel;
}

// iOS8 之后最好是自己定义
- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.hidden = YES;
        
        _lineView.alpha = 0.5;
        _lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}

// YES 要显示 NO是不需要显示
- (void)showLine:(BOOL)show {
    self.lineView.hidden = !show;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineView.x = self.textLabel.x;
    self.lineView.width = self.width;
    _lineView.height = 1;
    
    _lineView.y = self.height - 1;
    
}

@end
