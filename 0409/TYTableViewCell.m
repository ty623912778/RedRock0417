//
//  TYTableViewCell.m
//  0409
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYTableViewCell.h"

@implementation TYTableViewCell

@synthesize UserIDString;
@synthesize CDateString;
@synthesize ContentString;
@synthesize imageString;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setUserIDString:(NSString *)p{
    if (![p isEqualToString:UserIDString]) {
        UserIDString = [p copy];
        self.UserID.text = UserIDString;
    }
}
-(void)setCDateString:(NSString *)M{
    if (![M isEqualToString:CDateString]) {
        CDateString=[M copy];
        self.CDate.text=CDateString;
    }
}

-(void)setContentString:(NSString *)E {
    if (![E isEqualToString:ContentString]) {
        ContentString=[E copy];
        self.Content.text=ContentString;
    }
}


@end
