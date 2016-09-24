//
//  HMHTMLController.m
//  01-网易彩票
//
//  Created by HM on 16/3/16.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "HMHTMLController.h"
#import "HMHelp.h"
@interface HMHTMLController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation HMHTMLController

- (void)loadView {
    self.webView = [[UIWebView alloc]init];
    self.webView.delegate = self;
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLeftItem];
    // javascript 解析型语言
    // 本地文件URL
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.help.html withExtension:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 使用webview来显示html
    [self.webView loadRequest:request];
}

- (void)setupLeftItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem  = item;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *code = [NSString stringWithFormat:@"document.location.href = \"#%@\";",self.help.helpId];
    // 把js代码拼接到webview
    [self.webView stringByEvaluatingJavaScriptFromString:code];
}


@end
