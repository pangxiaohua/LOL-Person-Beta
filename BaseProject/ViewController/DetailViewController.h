//
//  DetailViewController.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/31.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

-(id)initWithID:(NSString *)ID;
@property(nonatomic,strong)NSString *vidoURL;

@end
