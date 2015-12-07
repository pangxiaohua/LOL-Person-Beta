//
//  MoreViewController.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UICollectionViewController

@property(nonatomic)NSInteger dayAndNight;

@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSArray *arr2;

-(instancetype)initWithInteger:(NSInteger)interger;

@end
