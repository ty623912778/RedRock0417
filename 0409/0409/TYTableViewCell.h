//
//  TYTableViewCell.h
//  0409
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *UserID;
@property (weak, nonatomic) IBOutlet UILabel *Content;
@property (weak, nonatomic) IBOutlet UILabel *CDate;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@property(copy,nonatomic) NSString * UserIDString;
@property(copy,nonatomic) NSString * ContentString;
@property(copy,nonatomic) NSString * CDateString;
@property(copy,nonatomic) NSString * imageString;


@end
