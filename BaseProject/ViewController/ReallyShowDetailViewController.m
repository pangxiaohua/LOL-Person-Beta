//
//  ReallyShowDetailViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReallyShowDetailViewController.h"

@interface ReallyShowDetailViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation ReallyShowDetailViewController

-(id)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

-(UIWebView *)webView{
    if (!_webView) {
        NSString *str = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/UgcsService/userShowDegree?id=%@&i_=866002024907023&t_=1447316907912&p_=26081&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&",_ID];
        NSURL *url = [NSURL URLWithString:str];
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
        _webView.delegate = self;
    }
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
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
