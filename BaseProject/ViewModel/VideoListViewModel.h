//
//  VideoListViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"

@interface VideoListViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;



-(id)initWithCatId:(NSString *)catId CatworDid:(NSString *)catworDid;
@property(nonatomic,strong)NSString *catId;
//-(id)initWithCatId:(NSString *)catId;
@property(nonatomic,strong)NSString *catworDid;

-(NSURL *)roomIconURLWithRow:(NSInteger)row;
-(NSString *)roomTitleWithRow:(NSInteger)row;
-(NSString *)roomDescWithRow:(NSInteger)row;

//以下是根据Model层来确定的属性和方法
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))completionHandle;
-(void)getMoreDataCompletionHandle:(void(^)(NSError *error))completionHandle;

@property(nonatomic)NSInteger page;

/** 推出下一个界面要用到播放地址 */
-(NSString *)videoForWithRow:(NSInteger)row;


@end
