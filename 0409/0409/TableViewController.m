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
    
  //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView:) name:@"reloadViewNotification" object:nil];
    
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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

    
    
    
  //  UILabel *label4 = (UILabel *)[cell viewWithTag:1];
  //  label4.text = _listData[indexPath.row][@"huhkjh"];
    
    return  cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
