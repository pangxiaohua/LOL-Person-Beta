//
//  LatestViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LolNetManager.h"
@interface LatestViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


//区分
-(id)initWithLolListType:(LolListType)type;
@property(nonatomic)LolListType type;

//头部滚动栏，图片数组
@property(nonatomic,strong)NSArray *headImageURLs;

-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)descForRow:(NSInteger)row;
/** 视频地址，传入详情页 添加点击方法 */
-(NSString *)videoURlForRow:(NSInteger)row;


@property(nonatomic)NSInteger page;

-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

-(NSString *)IDForRow:(NSInteger)row;

@end
