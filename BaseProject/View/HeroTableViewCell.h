//
//  HeroTableViewCell.h
//  BaseProject
//
//  Created by apple-jd17 on 15/12/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroTableViewCell : UITableViewCell

/** 英雄头像 */
@property(nonatomic,strong)TRImageView *imageVC;
/** 英雄中文名字 */
@property(nonatomic,strong)UILabel *nameLb;
/** 金币 */
@property(nonatomic,strong)UILabel *costLb;
@property(nonatomic,strong)UILabel *moneyLb;

@property(nonatomic,strong)TRImageView *costImg;
@property(nonatomic,strong)TRImageView *moneyImg;


@end
