//
//  HMProductCell.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMProductCell.h"
#import "HMProduct.h"
@interface HMProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation HMProductCell

- (void)awakeFromNib {
    // Initialization code
    // 设置圆角
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.cornerRadius = 10;
}

- (void)setProduct:(HMProduct *)product {
    _product = product;
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.titleLabel.text = product.title;
}

@end
