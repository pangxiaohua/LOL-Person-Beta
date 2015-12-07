//
//  HeroTableViewCell.m
//  BaseProject
//
//  Created by apple-jd17 on 15/12/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroTableViewCell.h"

@implementation HeroTableViewCell


-(TRImageView *)imageVC{
    if (!_imageVC) {
        _imageVC = [[TRImageView alloc]init];
        [self.contentView addSubview:_imageVC];
        [_imageVC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _imageVC;
}

-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [self.contentView addSubview:_nameLb];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = [UIColor lightGrayColor];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(self.imageVC.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
    }
    return _nameLb;
}

-(TRImageView *)moneyImg{
    if (!_moneyImg) {
        _moneyImg = [[TRImageView alloc]init];
        [self.contentView addSubview:_moneyImg];
        [_moneyImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageVC.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.width.height.mas_equalTo(17);
        }];
    }
    return _moneyImg;
}


-(UILabel *)moneyLb{
    if (!_moneyLb) {
        _moneyLb = [UILabel new];
        [self.contentView addSubview:_moneyLb];
        _moneyLb.font = [UIFont systemFontOfSize:12];
        _moneyLb.textColor = [UIColor lightGrayColor];
        [_moneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.moneyImg.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(35);
        }];
    }
    return _moneyLb;
}




-(TRImageView *)costImg{
    if (!_costImg) {
        _costImg = [[TRImageView alloc]init];
        [self.contentView addSubview:_costImg];
        [_costImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.moneyLb.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.width.height.mas_equalTo(17);
        }];
    }
    return _costImg;
}


-(UILabel *)costLb{
    if (!_costLb) {
        _costLb = [UILabel new];
        [self.contentView addSubview:_costLb];
        _costLb.font = [UIFont systemFontOfSize:12];
        _costLb.textColor = [UIColor lightGrayColor];
        [_costLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.costImg.mas_right).mas_equalTo(5);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(35);
        }];
    }
    return _costLb;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
