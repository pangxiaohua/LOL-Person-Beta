//
//  ShangChengController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShangChengController.h"
#import "iKYLoadingHubView.h"

@interface ShangChengController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)iKYLoadingHubView *loading;

@end

@implementation ShangChengController

-(iKYLoadingHubView *)loading{
    if (!_loading) {
         _loading = [[iKYLoadingHubView alloc]initWithFrame:CGRectMake(85, 180, 150, 150)];
    }
    return _loading;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        NSString *path = @"http://lol.mall.zhangyoubao.com/?appName=lol";
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        _webView.delegate = self;
        
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    // _webView.backgroundColor = [UIColor whiteColor];
    
    self.title = @"商场";
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view addSubview:self.loading];
    [self.loading showHub];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.loading dismissHub];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UILabel *errorLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 50, 50)];
    errorLabel.text = @"加载出错，请从新刷新";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
