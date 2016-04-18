//
//  TYTableViewController.m
//  请求一卡通
//
//  Created by mac on 16/4/18.
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
    NSURL *plistURL = [bundle URLForResource:@"card" withExtension:@"plist"];
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
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifierOne];
    
    NSUInteger row=[indexPath row];
    NSDictionary *rowDate=[self.dataList objectAtIndex:row];
    
    cell.xingming.text=[rowDate objectForKey:@"xm"];
    cell.shijian.text = [rowDate objectForKey:@"sj"];
    cell.xiaofeiji.text = [rowDate objectForKey:@"sb"];
    cell.didian.text=[rowDate objectForKey:@"sh"];
    cell.jine.text = [rowDate objectForKey:@"je"];
    cell.yue.text = [rowDate objectForKey:@"ye"];
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}



@end
