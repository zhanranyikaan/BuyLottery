//
//  UIImage+HMStr.m
//  01-网易彩票
//
//  Created by HM on 16/3/12.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIImage+HMStr.h"

@implementation UIImage (HMStr)
- (UIImage *)stretchableImage {
    NSInteger leftCapWidth = self.size.width * 0.5; // width - leftCapWidth - 1
    
    NSInteger topCapHeight = self.size.height * 0.5; // height - topCapWidth - 1
    
    return [self stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

- (UIImage *)stretchableImageWithwidthPercen:(CGFloat)width heightPercen:(CGFloat)height {
    NSInteger leftCapWidth = self.size.width * width; // width - leftCapWidth - 1
    
    NSInteger topCapHeight = self.size.height * height; // height - topCapWidth - 1
    
    return [self stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}
@end
