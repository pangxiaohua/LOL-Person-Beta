//
//  bgAndTipCell.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bgAndTipCell : UITableViewCell

/** 容器View */
@property(nonatomic,strong)UIView *containView;
/** 背景/使用技巧/对抗技巧Lb */
@property(nonatomic,strong)UILabel *tip;
/** 中间的横线V */
@property(nonatomic,strong)UIView *lineV;
/** 内容Lb */
@property(nonatomic,strong)UILabel *contentLb;

@end
