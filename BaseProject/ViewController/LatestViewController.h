//
//  LatestViewController.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LatestViewModel.h"

@interface LatestViewController : UIViewController

//需要通过传入的变量确定显示的是哪一页
@property(nonatomic)LolListType type;

@property(nonatomic,strong)NSUserDefaults *userDefaults;

@end
