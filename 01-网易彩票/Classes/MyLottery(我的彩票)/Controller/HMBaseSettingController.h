//
//  HMBaseSettingController.h
//  01-网易彩票
//
//  Created by HM on 16/3/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMBaseSettingController : UITableViewController
// 加只读属性，为了不让外界修改它的内存地址
@property (nonatomic, strong, readonly) NSMutableArray *group;
@end
