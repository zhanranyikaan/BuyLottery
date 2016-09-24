//
//  HMTool.m
//  01-网易彩票
//
//  Created by HM on 16/3/14.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMTool.h"

@implementation HMTool

+ (instancetype)tool {
    return [[[NSBundle mainBundle] loadNibNamed:@"HMTool" owner:nil options:nil]lastObject];
}
- (IBAction)clickSure:(id)sender {
    if ([self.delegate respondsToSelector:@selector(toolDidClickSure:)]) {
        [self.delegate toolDidClickSure:self];
    }
}

- (IBAction)clickCancel:(id)sender {
    if ([self.delegate respondsToSelector:@selector(toolDidClickCancel:)]) {
        [self.delegate toolDidClickCancel:self];
    }
}
@end
