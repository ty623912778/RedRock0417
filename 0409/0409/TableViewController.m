//
//  TableViewController.m
//  0409
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TableViewController.h"
#import "NotesXMLParser.h"

@interface TableViewController ()
@property(strong,nonatomic) NSMutableArray *listData;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"reloadViewNotification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self reloadView:note];
    }];
    
    
    NotesXMLParser *parser = [NotesXMLParser new];
    
    [parser start];
    NSLog(@"%@",_listData);
}

- (void)reloadView:(NSNotification *)notification
{
    _listData = [notification object];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tian" forIndexPath:indexPath];
    UILabel *label1 =(UILabel *)[cell viewWithTag:1];
      label1.text = _listData[indexPath.row][@"Content"];


    UILabel *label2 =(UILabel *)[cell viewWithTag:2];
     label2.text = _listData[indexPath.row][@"UserID"];

    UILabel *label3 = (UILabel *)[cell viewWithTag:3];
     label3.text = _listData[indexPath.row][@"CDate"];

    
    
    return  cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
