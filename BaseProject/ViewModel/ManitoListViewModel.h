//
//  ManitoListViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ManitoNetManager.h"

@interface ManitoListViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 头像 */
-(NSURL *)urlForRow:(NSInteger)row;
/** 名字 */
-(NSString *)nameForRow:(NSInteger)row;
/** 段位 */
-(NSString *)positionForRow:(NSInteger)row;
/** 胜点 */
-(NSString *)pointForRow:(NSInteger)row;
/** 刷新 ,由于是一次性加载完成，所以没有更多加载方法 */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
/** 为防止重复刷新,添加一个page做判断 */
@property(nonatomic)NSInteger page;

@end
