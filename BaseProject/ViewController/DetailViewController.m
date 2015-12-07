//
//  DetailViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface DetailViewController ()

@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)UIButton *playbtn;
@end

@implementation DetailViewController


/** 为了保证同一时间只有一个播放器，使用单例模式 */

-(AVPlayerViewController *)shareInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    // static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}


-(id)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

-(UIButton *)playbtn{
    if (!_playbtn) {
        if (self.vidoURL.length == 0) {
            _playbtn = [UIButton buttonWithType:UIButtonTypeCustom];
            return _playbtn;
        }
        _playbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playbtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
       // [_playbtn setTitle:@"播放" forState:UIControlStateNormal];
       // [_playbtn setTitle:@"正在播放" forState:UIControlStateSelected];
       // [_playbtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        _playbtn.backgroundColor = [UIColor clearColor];
    }
    return _playbtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    //地址为详情地址
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/mobiles/item/%@?v_=400606&token=9106edd4bac1f8ab738adc3a17630480839b&user_id=13360447&size=middle&t=1446431148",_ID];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:self.playbtn];
    [self.playbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(85);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 230));
    }];
    
}

-(void)play{
    
    
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.vidoURL]];
    [player play];
    [self shareInstance].player = player;
    [self.view addSubview:[self shareInstance].view];
    [[self shareInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-50);
        
    }];
    
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
