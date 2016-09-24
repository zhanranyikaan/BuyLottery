
//
//  HMGuideCell.m
//  01-网易彩票
//
//  Created by HM on 16/3/17.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMGuideCell.h"
#import "HMMainController.h"
@interface HMGuideCell ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation HMGuideCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setImageName:(NSString *)imageName {
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (void)showStartBtn:(BOOL)show {
    self.startBtn.hidden = !show;
}

- (IBAction)clickStartBtn:(id)sender {
    if (self.clickStartBtnBlock) {
        self.clickStartBtnBlock();
    }
}

@end
