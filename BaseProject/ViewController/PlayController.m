//
//  PlayController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface PlayController ()

@end

@implementation PlayController
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



-(id)initWithplayStr:(NSString *)playStr{
    if (self = [super init]) {
        self.playStr = playStr;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.playStr]];
    [player play];
    [self shareInstance].player = player;
    [self.view addSubview:[self shareInstance].view];
    [[self shareInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-50);
        
    }];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [[self shareInstance].view removeFromSuperview];
    [self shareInstance].player = nil;
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
