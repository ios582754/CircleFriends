//
//  ViewController.m
//  CircleOfFriends
//
//  Created by apple on 17/5/28.
//  Copyright © 2017年 pxymac. All rights reserved.
//

#import "ViewController.h"
#import "SDTimeLineTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gotoCircle:(id)sender {
    SDTimeLineTableViewController *timeVC = [SDTimeLineTableViewController new];
    [self.navigationController pushViewController:timeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
