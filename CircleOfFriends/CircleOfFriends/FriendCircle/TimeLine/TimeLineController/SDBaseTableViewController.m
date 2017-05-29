//
//  SDBaseTableViewController.m
//  GSD_WeiXin(wechat)
//
//  Created by aier on 16/2/10.
//  Copyright © 2016年 GSD. All rights reserved.
//




#import "SDBaseTableViewController.h"

@interface SDBaseTableViewController ()

@end

@implementation SDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
