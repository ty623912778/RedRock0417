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
    NSURL *plistURL = [bundle URLForResource:@"TYList" withExtension:@"plist"];
    
    //NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *array = [NSArray arrayWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] initWithArray:array];
  for (int i=0; i<[tmpDataArray count]; i++) {
//        NSString *key = [[NSString alloc] initWithFormat:@"%i", i+1];
//        NSDictionary *tmpDic = [dictionary objectForKey:key];
//        [tmpDataArray addObject:tmpDic];
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableIdentifierOne=@"TableIdentifierOne";
    
    static BOOL nibsRegistered=NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"TYTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:TableIdentifierOne];
        nibsRegistered=YES;
    }
    
    tableView.contentInset=UIEdgeInsetsMake(15, 0, 0, 0);
    
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
