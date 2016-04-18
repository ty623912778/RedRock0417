//
//  TYTableViewCell.m
//  请求一卡通
//
//  Created by mac on 16/4/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYTableViewCell.h"

@implementation TYTableViewCell

@synthesize sj;
@synthesize je;
@synthesize ye;
@synthesize xm;
@synthesize sh;
@synthesize sb;

- (void)awakeFromNib {
    // Initialization code
}
-(void)setsj:(NSString *)s{
    if (![s isEqualToString:sj]) {
        sj = [s copy];
        self.shijian.text = sj;
    }
}

-(void)setje:(NSString *)j{
    if (![j isEqualToString:je]) {
        je = [j copy];
        self.jine.text = je;
    }
}

-(void)setye:(NSString *)y{
    if (![y isEqualToString:ye]) {
        ye = [y copy];
        self.yue.text = ye;
    }
}

-(void)setxm:(NSString *)x{
    if (![x isEqualToString:xm]) {
        xm = [x copy];
        self.xingming.text = xm;
    }
}

-(void)setsh:(NSString *)di{
    if (![di isEqualToString:sh]) {
        sh = [di copy];
        self.didian.text = sh;
    }
}

-(void)setsb:(NSString *)b{
    if (![b isEqualToString:sb]) {
        sb = [b copy];
        self.xiaofeiji.text = sb;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
