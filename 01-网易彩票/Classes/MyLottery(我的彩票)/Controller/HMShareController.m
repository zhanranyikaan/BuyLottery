//
//  HMShareController.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMShareController.h"
#import "HMGroup.h"
#import "HMArrowItem.h"
#import "MBProgressHUD+PKX.h"
@import MessageUI;

@interface HMShareController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation HMShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData {
    HMGroup *group = [[HMGroup alloc]init];
    
    HMArrowItem *item0 = [HMArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    HMArrowItem *item1 = [HMArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    [item1 setBlock:^{
       // 方法一 跳转到短信应用 ， 不能指定发短信的内容
//        NSURL *url = [NSURL URLWithString:@"sms://10010"];
//        [[UIApplication sharedApplication]openURL:url];
        // 发短信的控制器
        MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc]init];
        // 设置短信内容
        message.body = @"cxll";
        // 设置接收人
        message.recipients = @[@"10010",@"10086",@"10000"];
        //  设置代理
        message.messageComposeDelegate = self;
        
        // 显示界面 一般系统的控制器都使用model来显示
        [self presentViewController:message animated:YES completion:nil];
        
    }];
    
    HMArrowItem *item2 = [HMArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    [item2 setBlock:^{
        // 发送邮件 - 方法一,跳转去系统的email
//        NSURL *url = [NSURL URLWithString:@"mailto://zhiwupei@itcast.cn"];
//        [[UIApplication sharedApplication]openURL:url];
        
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        // 设置收件人
        [mail setToRecipients:@[@"zhiwupei@itcast.cn"]];
        // 设置邮件内容
        [mail setMessageBody:@"约吗?" isHTML:YES];
        // 设置邮件主题
        [mail setSubject:@"邮件主题"];
        // 设置代理
        mail.mailComposeDelegate = self;
        
        [self presentViewController:mail animated:YES completion:nil];

    }];
    
    group.items = @[item0, item1, item2];
    
    [self.group addObject:group];
    
}

#pragma mark - 发短信代理
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    // dismiss
    [controller dismissViewControllerAnimated:YES completion:nil];
    /*
     MessageComposeResultCancelled, 取消
     MessageComposeResultSent, 发送
     MessageComposeResultFailed 失败
     */
    if (result == MessageComposeResultCancelled) {
        [MBProgressHUD showSuccess:@"取消发送"];
    }else if (result == MessageComposeResultSent) {
        [MBProgressHUD showSuccess:@"发送成功"];
    }else if (result == MessageComposeResultFailed) {
        [MBProgressHUD showSuccess:@"发送失败"];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
    /**
     MFMailComposeResultCancelled, 取消
     MFMailComposeResultSaved,保存
     MFMailComposeResultSent,发送
     MFMailComposeResultFailed 发送失败
     */
    if (result == MFMailComposeResultCancelled) {
        [MBProgressHUD showSuccess:@"取消发送"];
    }else if (result == MFMailComposeResultSent) {
        [MBProgressHUD showSuccess:@"发送成功"];
    }else if (result == MFMailComposeResultSaved) {
        [MBProgressHUD showSuccess:@"保存草稿"];
    }else if (result == MFMailComposeResultFailed) {
        [MBProgressHUD showSuccess:@"发送失败"];
    }}

@end
