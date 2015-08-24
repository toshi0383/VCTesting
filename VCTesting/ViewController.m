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
    _label.text = @"load";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _label.text = @"willAppear";
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _label.text = @"willLayoutSubviews";
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _label.text = @"didLayoutSubviews";
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    _label.text = @"didDisappear";
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _label.text = @"appear";
}

- (IBAction)tap:(id)sender {
    _label.text = @"tap";
}

@end
