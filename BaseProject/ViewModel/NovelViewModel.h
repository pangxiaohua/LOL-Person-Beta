//
//  NovelViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NovelNetManager.h"

@interface NovelViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;

-(NSString *)titleForRow:(NSInteger)row;

-(NSString *)descForRow:(NSInteger)row;

-(NSURL *)picUrlForRow:(NSInteger)row;

/** 刷新，没有加载更多 */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

/** 有头部刷新 */
@property(nonatomic)NSInteger page;
@end
