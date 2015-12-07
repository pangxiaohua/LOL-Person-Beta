//
//  HeroDetailCell.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailCell : UITableViewCell

/** 容器View */
@property(nonatomic,strong)UIView *containVI;
/** 生命值Lb,"生命值+551(96.0/每级)" */
@property(nonatomic,strong)UILabel *blood;
/** 生命回复Lb */
@property(nonatomic,strong)UILabel *blood_recovery;
/** 法力值 */
@property(nonatomic,strong)UILabel *mana;
/** 法力回复Lb */
@property(nonatomic,strong)UILabel *magic_recovery;
/** 攻击力Lb */
@property(nonatomic,strong)UILabel *attack;
/** 攻击速度Lb */
@property(nonatomic,strong)UILabel *attack_speed;
/** 射程Lb */
@property(nonatomic,strong)UILabel *range;
/** 护甲值Lb */
@property(nonatomic,strong)UILabel *armor;
/** 法术抗性Lb */
@property(nonatomic,strong)UILabel *magic_resistance;
/** 移动速度Lb */
@property(nonatomic,strong)UILabel *moving_speed;
/** 重写init方法用的字典 */
@property(nonatomic,strong)NSDictionary *dic;



@end
