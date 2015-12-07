//
//  GameViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "GameNetModel.h"

@interface GameViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 返回标题 */
-(NSString *)titleForRow:(NSInteger)row;

/** 返回详情 */
-(NSString *)descForRow:(NSInteger)row;

-(void)refreshDataCompletionHandle:(void(^)(NSError *error))complete;

-(void)getMoreDataWithMax_id:(NSString *)max_id CompleteHandle:(void(^)(NSError *error))complete;

//分页加载判断的是maxId
@property(nonatomic,strong)NSString *maxId;

@end
