//
//  TYTableViewController.h
//  0409
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *dataList;

@end
