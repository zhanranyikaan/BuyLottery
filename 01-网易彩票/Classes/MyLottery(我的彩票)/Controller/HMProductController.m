//
//  HMProductController.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMProductController.h"
#import "HMProductCell.h"
#import "HMProduct.h"
@interface HMProductController ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation HMProductController

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 设置item大小
    layout.itemSize = CGSizeMake(90, 108);
    // UICollectionView must be initialized with a non-nil layout parameter
    // 在初始化的时候必须要有一个布局对象
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册cell的类型
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMProductCell" bundle:nil] forCellWithReuseIdentifier:@"HMProductCell"];
    // 设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HMProductCell" forIndexPath:indexPath];
    cell.product = self.data[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 取出模型
    HMProduct *product = self.data[indexPath.item];
    //    NSLog(@"点击 %@",product.title);
    // 如果手机有安装此应用，跳转应用
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://",product.customUrl]];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        //        -canOpenURL: failed for URL: "newsapp://" - error: "This app is not allowed to query for scheme newsapp" iOS9 新增的，要判断是否可以打开某个URL,必须添加白名单
        /**
         <key>LSApplicationQueriesSchemes</key>
         <array>
         <string>newsapp</string>
         </array>
         */
        [app openURL:url];
        
    }else {// 如果没有安装，跳转到商店下载
        url = [NSURL URLWithString:product.url];
        [app openURL:url];
    }
}


- (NSArray *)data {
    if (_data == nil) {
        _data = [HMProduct products];
    }
    return _data;
}

@end
