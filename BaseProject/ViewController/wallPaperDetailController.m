//
//  wallPaperDetailController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wallPaperDetailController.h"
#import "TRImageView.h"

@interface wallPaperDetailController ()

@property(nonatomic,strong)TRImageView *Imageview;
@property(nonatomic,strong)UIButton *downLoad;
@property(nonatomic,strong)NSString *documentsPath;
@property(nonatomic,strong)UIButton *slanbtn;
@property(nonatomic,strong)NSFileManager *manager;
@end

@implementation wallPaperDetailController

-(NSString *)documentsPath{
    if (!_documentsPath) {
        _documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    }
    return _documentsPath;
}


-(TRImageView *)Imageview{
    if (!_Imageview) {
        _Imageview = [[TRImageView alloc]init];
        NSString *path = self.pic_url;
        [_Imageview.imageView setImageWithURL:[NSURL URLWithString:path]];
        [_Imageview addSubview:self.downLoad];
        [self.downLoad mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(100, 35));
        }];
        [_Imageview addSubview:self.slanbtn];
        [self.slanbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(100, 35));
        }];
    }
    return _Imageview;
}

-(UIButton *)downLoad{
    if (!_downLoad) {
        _downLoad = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downLoad setTitle:@"下载本地" forState:UIControlStateNormal];
        [_downLoad setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _downLoad.backgroundColor = [UIColor orangeColor];
        [_downLoad addTarget:self action:@selector(dwnload) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downLoad;
}

-(UIButton *)slanbtn{
    if (!_slanbtn) {
        _slanbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_slanbtn setTitle:@"查看壁纸" forState:UIControlStateNormal];
        [_slanbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _slanbtn.backgroundColor = [UIColor orangeColor];
        [_slanbtn addTarget:self action:@selector(slanPic) forControlEvents:UIControlEventTouchUpInside];
    }
    return _slanbtn;
}

-(NSFileManager *)manager{
    if (!_manager) {
        _manager = [NSFileManager defaultManager];
    }
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.Imageview];
    [self.Imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-44);
    }];
    self.title = @"壁纸详情";
    
}


-(void)dwnload{
    NSString *imapath = self.pic_url;
    NSURL *imageUrl = [NSURL URLWithString:imapath];
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:imageUrl];
        NSString *path = [self.documentsPath stringByAppendingString:@"wallPaper.png"];
        BOOL success = [[NSFileManager defaultManager]createFileAtPath:path contents:nil attributes:nil];
        if (!success) {
            NSLog(@"文件创建失败");
        }else{
            NSLog(@"文件创建成功%@",path);
        }
        //创建一个文件写入控制器
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [fileHandle writeData:data];
        [fileHandle closeFile];
    });
   
}


-(void)slanPic{
    //拼出我们要查询的文件夹的路径
    NSString *path = self.documentsPath;
    //查询路径下所有文件
    NSError *error = nil;
    NSArray *files = [self.manager subpathsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"查询失败%@",error.userInfo);
    }else{
        NSLog(@"查询成功%@",files);
    }
    
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
