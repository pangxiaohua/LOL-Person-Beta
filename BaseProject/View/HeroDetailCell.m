//
//  HeroDetailCell.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailCell.h"

@implementation HeroDetailCell


-(UIView *)containVI{
    if (!_containVI) {
        _containVI = [UIView new];
        _containVI.backgroundColor = kRGBColor(43, 49, 56);
        [self.contentView addSubview:_containVI];
        [_containVI mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        
    }
    return _containVI;
}

-(UILabel *)blood{
    if (!_blood) {
        _blood = [UILabel new];
        [self.containVI addSubview:_blood];
        _blood.font = [UIFont systemFontOfSize:10];
        _blood.textColor = [UIColor whiteColor];
        [_blood mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.width.mas_equalTo(140);
        }];
    }
    return _blood;
}
-(UILabel *)blood_recovery{
    if (!_blood_recovery) {
        _blood_recovery = [UILabel new];
        _blood_recovery.font = [UIFont systemFontOfSize:10];
        _blood_recovery.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_blood_recovery];
        [_blood_recovery mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.blood.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(140);
        }];
    }
    return _blood_recovery;
}

-(UILabel *)mana{
    if (!_mana) {
        _mana = [UILabel new];
        _mana.font = [UIFont systemFontOfSize:10];
        _mana.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_mana];
        [_mana mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.blood_recovery.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(140);
        }];
    }
    return _mana;
}

-(UILabel *)magic_recovery{
    if (!_magic_recovery) {
        _magic_recovery = [UILabel new];
        _magic_recovery.font = [UIFont systemFontOfSize:10];
        _magic_recovery.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_magic_recovery];
        [_magic_recovery mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.mana.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(140);
        }];
    }
    return _magic_recovery;
}

-(UILabel *)attack{
    if (!_attack) {
        _attack = [UILabel new];
        _attack.font = [UIFont systemFontOfSize:10];
        _attack.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_attack];
        [_attack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.magic_recovery.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(140);
        }];
    }
    return _attack;
}

-(UILabel *)attack_speed{
    if (!_attack_speed) {
        _attack_speed = [UILabel new];
        _attack_speed.font = [UIFont systemFontOfSize:10];
        _attack_speed.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_attack_speed];
        [_attack_speed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(140);
        }];
    }
    return _attack_speed;
}

-(UILabel *)range{
    if (!_range) {
        _range = [UILabel new];
        _range.font = [UIFont systemFontOfSize:10];
        _range.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_range];
        [_range mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(140);
            make.top.mas_equalTo(self.attack_speed.mas_bottom).mas_equalTo(5);
        }];
    }
    return _range;
}

-(UILabel *)armor{
    if (!_armor) {
        _armor = [UILabel new];
        _armor.font = [UIFont systemFontOfSize:10];
        _armor.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_armor];
        [_armor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(140);
            make.top.mas_equalTo(self.range.mas_bottom).mas_equalTo(5);
        }];
    }
    return _armor;
}

-(UILabel *)magic_resistance{
    if (!_magic_resistance) {
        _magic_resistance = [UILabel new];
        _magic_resistance.font = [UIFont systemFontOfSize:10];
        _magic_resistance.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_magic_resistance];
        [_magic_resistance mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(140);
            make.top.mas_equalTo(self.armor.mas_bottom).mas_equalTo(5);
        }];
    }
    return _magic_resistance;
}

-(UILabel *)moving_speed{
    if (!_moving_speed) {
        _moving_speed = [UILabel new];
        _moving_speed.font = [UIFont systemFontOfSize:10];
        _moving_speed.textColor = [UIColor whiteColor];
        [self.containVI addSubview:_moving_speed];
        [_moving_speed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(140);
            make.top.mas_equalTo(self.magic_resistance.mas_bottom).mas_equalTo(5);
             make.bottom.mas_equalTo(-10);
        }];
    }
    return _moving_speed;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
