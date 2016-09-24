//
//  HMTitleButton.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMTitleButton.h"
#import "UIView+HMExt.h"
@interface HMTitleButton ()
// 标题的宽度
@property (nonatomic, assign) CGFloat titleW;
@end
@implementation HMTitleButton

// 从xib 或者 sb里面加载才会调用
- (void)awakeFromNib {
    self.titleW = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:0 attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width;
}

// 方式一

#define margin 5
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//    // 按钮宽度
//    CGFloat btnW = contentRect.size.width;
//    CGFloat btnH = contentRect.size.height;
//    // 图片宽度
//    CGFloat imageW = self.imageView.bounds.size.width;
//    
//    // 算出label宽度
//   CGFloat labelW = self.titleW;
//    
//    // 计算labelX
//    CGFloat labelX = btnW - imageW - margin - labelW;
//    return CGRectMake(labelX, 0, labelW, btnH);
//}
//
//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//    // 按钮
//    CGFloat btnW = contentRect.size.width;
//    CGFloat btnH = contentRect.size.height;
//    // 图片 self.currentImage 获取当前显示状态下的图片
//    CGFloat imageW = self.currentImage.size.width;
//    CGFloat imageH = self.currentImage.size.height;
//    CGFloat imageX = btnW - imageW;
//    CGFloat imageY = (btnH - imageH) * 0.5;
//    
//    return CGRectMake(imageX, imageY, imageW, imageH);
//    
//}

// 方式二
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + margin;
}

@end
