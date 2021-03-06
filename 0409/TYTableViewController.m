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
@property(assign,nonatomic) BOOL nibsRegistered;


@end

@implementation TYTableViewController
static NSString *TableIdentifierOne=@"TableIdentifierOne";
- (void)viewDidLoad {
    [super viewDidLoad];
    _nibsRegistered=NO;
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"TYList" withExtension:@"plist"];
    UINib *nib = [UINib nibWithNibName:@"TYTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:TableIdentifierOne];

    NSArray *array = [NSArray arrayWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] initWithArray:array];

    self.dataList = tmpDataArray;

     self.clearsSelectionOnViewWillAppear = NO;
    
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.list=nil;


}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifierOne];
    
    NSUInteger row=[indexPath row];
    NSDictionary *rowDate=[self.dataList objectAtIndex:row];
    
    cell.UserIDString=[rowDate objectForKey:@"UserIDString"];
    cell.CDateString = [rowDate objectForKey:@"CDateString"];
    cell.ContentString = [rowDate objectForKey:@"ContentString"];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}



@end
