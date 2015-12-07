//
//  NovelTableViewCell.m
//  BaseProject
//
//  Created by apple-jd17 on 15/12/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NovelTableViewCell.h"

@implementation NovelTableViewCell



-(UIView *)containView{
    if (!_containView) {
        _containView = [UIView new];
        [self.contentView addSubview:_containView];
        [_containView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.top.mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.right.mas_equalTo(-8);
        }];
        [_containView addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        [_containView addSubview:self.rightLine];
        [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.mas_equalTo(0);
            make.width.mas_equalTo(1);
        }];
        [_containView addSubview:self.topLine];
        [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        
        _containView.backgroundColor = kRGBColor(250, 253, 250);
    }
    return _containView;
}

-(TRImageView *)imageIV{
    if (!_imageIV) {
        _imageIV = [[TRImageView alloc]init];
        [self.containView addSubview:_imageIV];
        [_imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(70);
        }];
        
    }
    return _imageIV;
}

/** containView上边缘那条灰色的线 */
-(UIView *)topLine{
    if (!_topLine) {
        _topLine = [UIView new];
        _topLine.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _topLine;
}

/** containView右边缘那条线 */
-(UIView *)rightLine{
    if (!_rightLine) {
        _rightLine = [UIView new];
        _rightLine.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _rightLine;
}

/** containView中下边缘那条线 */
-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}


-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]init];
        [self.containView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(self.imageIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            //make.height.mas_equalTo(20);
        }];
    }
    return _nameLb;
}

-(UILabel *)descLb{
    if (!_descLb) {
        _descLb = [[UILabel alloc]init];
        [self.containView addSubview:_descLb];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.font = [UIFont systemFontOfSize:12];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(0);
            make.left.mas_equalTo(self.imageIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(40);
        }];
    }
    return _descLb;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
