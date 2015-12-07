//
//  LatestViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestViewModel.h"

@implementation LatestViewModel


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(LolDataModel *)lolDataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}


-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self lolDataModelForRow:row].picUrl];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].desc;
}

-(NSString *)videoURlForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].videoUrl;
}

//网络请求
-(void)getDataCompleteHandle:(void(^)(NSError *error))complete{
    
    [LolNetManager getLolListType:_type page:_page complettionHandle:^(LolModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        complete(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataCompleteHandle:complete];
}

-(void)getMoreDataCompleteHandle:(void (^)(NSError *))complete{
    _page +=1;
    [self getDataCompleteHandle:complete];
}


-(id)initWithLolListType:(LolListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

-(NSString *)IDForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].dataIdentifier;
}


@end
