//
//  ViewController.m
//  json
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSFileManager *manager;

@end

@implementation ViewController

-(NSFileManager *)manager{
    if (!_manager) {
        _manager = [NSFileManager defaultManager];
    }
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"json"];
    NSLog(@"path,%@",path);
    
    NSDictionary *arr = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"arr %@",arr);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
