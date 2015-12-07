//
//  ReallyShowCell.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface ReallyShowCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageIV;


@property (weak, nonatomic) IBOutlet UILabel *nameLb;

@property (weak, nonatomic) IBOutlet UIImageView *sexIV;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLb;

@property (weak, nonatomic) IBOutlet UIImageView *picIV;

@property (weak, nonatomic) IBOutlet UILabel *descLb;

@property (weak, nonatomic) IBOutlet UILabel *commentLb;

@property (weak, nonatomic) IBOutlet UILabel *goodLb;

@end
