//
//  TYTableViewCell.h
//  请求一卡通
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *shijian;
@property (weak, nonatomic) IBOutlet UILabel *jine;
@property (weak, nonatomic) IBOutlet UILabel *yue;
@property (weak, nonatomic) IBOutlet UILabel *xingming;
@property (weak, nonatomic) IBOutlet UILabel *didian;
@property (weak, nonatomic) IBOutlet UILabel *xiaofeiji;

@property(copy,nonatomic) NSString * sj;
@property(copy,nonatomic) NSString * je;
@property(copy,nonatomic) NSString * ye;
@property(copy,nonatomic) NSString * xm;
@property(copy,nonatomic) NSString * sh;
@property(copy,nonatomic) NSString * sb;

@end
