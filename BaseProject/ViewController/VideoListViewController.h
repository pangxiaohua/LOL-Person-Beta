//
//  VideoListViewController.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface VideoListViewController : UITableViewController

@property(nonatomic,strong)VideoDataCatword_IdModel *videoData;

@property(nonatomic,strong)VideoDataModel *catId;

@property(nonatomic,strong)NSString *videoaDress;

@end
