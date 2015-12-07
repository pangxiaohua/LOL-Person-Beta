//
//  NovelTableViewCell.h
//  BaseProject
//
//  Created by apple-jd17 on 15/12/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovelTableViewCell : UITableViewCell

@property(nonatomic,strong)TRImageView *imageIV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *descLb;
@property(nonatomic,strong)UIView *containView;
@property(nonatomic,strong)UIView *topLine;
@property(nonatomic,strong)UIView *rightLine;
@property(nonatomic,strong)UIView *bottomLine;

@end
