//
//  ZhanBuController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZhanBuController.h"
#import "iKYLoadingHubView.h"
@interface ZhanBuController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)iKYLoadingHubView *loading;

@end

@implementation ZhanBuController

-(iKYLoadingHubView *)loading{
    if (!_loading) {
       _loading = [[iKYLoadingHubView alloc]initWithFrame:CGRectMake(85, 180, 150, 150)];
    }
    return _loading;
}


-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        NSString *path = @"http://webapp.zhangyoubao.com/divination/mobile/index?gid=5&appName=lol";
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
    
    self.title = @"占卜";
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UILabel *errorLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 120, 50, 50)];
    errorLabel.text = @"加载出错，请从新刷新";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
