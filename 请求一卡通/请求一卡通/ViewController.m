//
//  ViewController.m
//  请求一卡通
//
//  Created by mac on 16/4/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)
touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self get];
}

- (void)get
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://219.153.62.77/oracle_ykt0529.php?"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"UsrID=1640332&page=1" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    
    //http://219.153.62.77/oracle_ykt0529.php?UsrID=1640332&page=1
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
