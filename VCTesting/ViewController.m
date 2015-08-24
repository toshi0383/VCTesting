//
//  ViewController.m
//  VCTesting
//
//  Created by toshi0383 on 2015/08/24.
//  Copyright (c) 2015年 toshi0383. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_button setTitle:@"load" forState:UIControlStateNormal];
    _label.text = @"load";
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _label.text = @"appear";
}

- (IBAction)tap:(id)sender {
    _label.text = @"tap";
}

@end
