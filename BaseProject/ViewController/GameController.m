//
//  GameController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameController.h"
#import "iKYLoadingHubView.h"

@interface GameController ()<UIWebViewDelegate>


@property(nonatomic,strong)iKYLoadingHubView *loading;
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation GameController

-(iKYLoadingHubView *)loading{
    if (!_loading) {
        
        _loading = [[iKYLoadingHubView alloc]initWithFrame:CGRectMake(85, 180, 150, 150)];
        
    }
    return _loading;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
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
    self.title = @"战绩查询";

}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //[self showProgress]; //旋转提示
    DDLogVerbose(@"开始请求");
    
    [self.view addSubview:self.loading];
    [self.loading showHub];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //[self hideProgress];
    DDLogVerbose(@"请求成功");
    [self.loading dismissHub];
   
    //self.loadingHunbView = nil;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //[self hideProgress];
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
