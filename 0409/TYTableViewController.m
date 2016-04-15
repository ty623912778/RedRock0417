//
//  TYTableViewController.m
//  0409
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TYTableViewController.h"
#import "TYTableViewCell.h"

@interface TYTableViewController ()



@end

@implementation TYTableViewController

@synthesize list=_list;
@synthesize dataList;



- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"Property List" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
    for (int i=0; i<[dictionary count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%i", i+1];
        NSDictionary *tmpDic = [dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
    }
    self.dataList = [tmpDataArray copy];
    

    
    
    
     self.clearsSelectionOnViewWillAppear = NO;
    
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.list=nil;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];

}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableIdentifierOne=@"TableIdentifierOne";
    
    static BOOL nibsRegistered=NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"TextCellTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:TableIdentifierOne];
        nibsRegistered=YES;
    }
    
    tableView.contentInset=UIEdgeInsetsMake(15, 0, 0, 0);
    
    TYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifierOne];
    
    NSUInteger row=[indexPath row];
    NSDictionary *rowDate=[self.dataList objectAtIndex:row];
    //    UIColor *altCellColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    //
    //    cell.backgroundColor = altCellColor;
    //    altCellColor = [UIColor colorWithWhite:1.0 alpha:0.0];  半透明的tableview
    //    cell.textLabel.backgroundColor = altCellColor;
    //    cell.detailTextLabel.backgroundColor = altCellColor;
    
    
    cell.UserIDString=[rowDate objectForKey:@"UserID"];
    cell.ContentString = [rowDate objectForKey:@"Content"];
    cell.CDateString = [rowDate objectForKey:@"CDate"];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}



@end
