//
//  TYTableViewCell.m
//  0409
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYTableViewCell.h"

@implementation TYTableViewCell

@synthesize UserIDString;
@synthesize ContentString;
@synthesize CDateString;
@synthesize imageString;



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setUserIDString:(NSString *)U{
    if (![U isEqualToString:UserIDString]) {
        UserIDString = [U copy];
        self.UserID.text = UserIDString;
    }
}
-(void)setContentString:(NSString *)C{
    if (![C isEqualToString:ContentString]) {
        ContentString=[C copy];
        self.Content.text=ContentString;
    }
}

-(void)setCDateString:(NSString *)D {
    if (![D isEqualToString:CDateString]) {
        CDateString=[D copy];
        self.CDate.text=CDateString;
    }
}




@end
