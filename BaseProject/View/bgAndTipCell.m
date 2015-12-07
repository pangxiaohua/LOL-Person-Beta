//
//  bgAndTipCell.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "bgAndTipCell.h"

@implementation bgAndTipCell

-(UIView *)containView{
    if (!_containView) {
        _containView = [UIView new];
        _containView.backgroundColor = kRGBColor(43, 49, 56);
        [self.contentView addSubview:_containView];
        [_containView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 10, 5, 10));
            make.height.mas_greaterThanOrEqualTo(100);
        }];
        [_containView addSubview:self.lineV];
        [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(30);
            make.height.mas_equalTo(1);
        }];
    }
    return _containView;
}

//cell 31:36:42


-(UILabel *)tip{
    if (!_tip) {
        _tip = [UILabel new];
        _tip.font = [UIFont systemFontOfSize:17];
        _tip.textColor = [UIColor grayColor];
        [self.containView addSubview:_tip];
        [_tip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _tip;
}

-(UIView *)lineV{
    if (!_lineV) {
        _lineV = [UIView new];
        
        _lineV.backgroundColor = kRGBColor(37, 41, 48);
        
    }
    return _lineV;
}

-(UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.numberOfLines = 0;
        _contentLb.font = [UIFont systemFontOfSize:15];
        _contentLb.textColor = [UIColor whiteColor];
        
        [self.containView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(41, 10, 10, 10));
            
        }];
    }
    return _contentLb;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
