//
//  HMGuideController.m
//  01-网易彩票
//
//  Created by HM on 16/3/17.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMGuideController.h"
#import "HMGuideCell.h"
#import "UIView+HMExt.h"
#import "HMMainController.h"
@interface HMGuideController ()
@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) UIImageView *guideLargeText;
@property (nonatomic, strong) UIImageView *guideSmallText;
@property (nonatomic, strong) HMGuideController *vc;
/**
 *  上一次依稀的x坐标
 */
@property (nonatomic, assign) CGFloat offsetX;

@end

@implementation HMGuideController

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 设置item大小
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置item之间的间隔
    layout.minimumLineSpacing = 0;
    // UICollectionView must be initialized with a non-nil layout parameter
    // 在初始化的时候必须要有一个布局对象
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMGuideCell" bundle:nil] forCellWithReuseIdentifier:@"HMGuideCell"];
    // 设置分页
    self.collectionView.pagingEnabled = YES;
    // 关闭滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 关闭弹簧效果
    self.collectionView.bounces = NO;
    [self setupOtherView];
    // 自己引用自己
    self.vc = self;
}


// 初始化其他的view
- (void)setupOtherView {
    // 线图片
    UIImageView *lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:lineImageView];
    lineImageView.x = -150;
    lineImageView.y = 30;
    
    // 大图片
    UIImageView *bigImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:bigImageView];
    bigImageView.center = self.collectionView.center;
    self.bigImageView = bigImageView;
    
    // 大标题
    UIImageView *guideLargeText1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText1];
    guideLargeText1.center = self.collectionView.center;
    guideLargeText1.y = self.collectionView.height * 0.7;
    self.guideLargeText = guideLargeText1;
    
    // 小标题
    UIImageView *guideSmallText1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText1];
    guideSmallText1.center = self.collectionView.center;
    guideSmallText1.y = self.collectionView.height * 0.8;
    self.guideSmallText = guideSmallText1;
}

#define HMGuideCount 4
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return HMGuideCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HMGuideCell" forIndexPath:indexPath];
    // 判断是否需要显示开始按钮
    [cell showStartBtn:(indexPath.item == (HMGuideCount - 1))];
   
    __weak typeof(self) weakSelf = self;
    // 点击开始按钮
    [cell setClickStartBtnBlock:^{
        // 进入主界面
        HMMainController *main = [[HMMainController alloc]init];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        window.rootViewController = main;
        
        [window addSubview:weakSelf.collectionView];
        [UIView animateWithDuration:3 animations:^{
            weakSelf.collectionView.y = window.height;
        } completion:^(BOOL finished) {
          
            [weakSelf.collectionView removeFromSuperview];
            // 让控制器释放
            weakSelf.vc = nil;
        }];
    }];
   
//    guide1Background 设置背景图片
    NSString *imageName = [NSString stringWithFormat:@"guide%zdBackground",indexPath.item + 1];
    cell.imageName = imageName;
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"滚动结束");
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / scrollView.width + 1;
    CGFloat width = self.collectionView.width;
    
    // 图片名字
    NSString *bigImageName = [NSString stringWithFormat:@"guide%zd",index];
    NSString *guideLargeTextName = [NSString stringWithFormat:@"guideLargeText%zd",index];
    NSString *guideSmallTextName = [NSString stringWithFormat:@"guideSmallText%zd",index];
    
    // 更换图片
    self.bigImageView.image = [UIImage imageNamed:bigImageName];
    self.guideLargeText.image = [UIImage imageNamed:guideLargeTextName];
    self.guideSmallText.image = [UIImage imageNamed:guideSmallTextName];
    
    // 判断滚动方向
    if (offsetX > self.offsetX) {// 往右边
        self.bigImageView.x = offsetX + ((self.collectionView.width - self.bigImageView.width) * 0.5) + width;
        self.guideLargeText.x = offsetX + ((self.collectionView.width - self.guideLargeText.width) * 0.5) + width;
        self.guideSmallText.x = offsetX + ((self.collectionView.width - self.guideSmallText.width) * 0.5) + width;
        

//        NSLog(@"右边");
    }else if (offsetX < self.offsetX) {// 往左边
//        NSLog(@"左边");
        self.bigImageView.x = offsetX + ((self.collectionView.width - self.bigImageView.width) * 0.5) - width;
        self.guideLargeText.x = offsetX + ((self.collectionView.width - self.guideLargeText.width) * 0.5) -width;
        self.guideSmallText.x = offsetX + ((self.collectionView.width - self.guideSmallText.width) * 0.5) - width;
    }
    
       [UIView animateWithDuration:0.3 animations:^{
        // 移动图片
        self.bigImageView.x = offsetX + ((self.collectionView.width - self.bigImageView.width) * 0.5);
        self.guideLargeText.x = offsetX + ((self.collectionView.width - self.guideLargeText.width) * 0.5);
        self.guideSmallText.x = offsetX + ((self.collectionView.width - self.guideSmallText.width) * 0.5);
    }];
    self.offsetX = offsetX;
}

- (void)dealloc {
    NSLog(@"dealloc");
}



@end
