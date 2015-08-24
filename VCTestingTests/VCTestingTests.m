//
//  VCTestingTests.m
//  VCTestingTests
//
//  Created by toshi0383 on 2015/08/24.
//  Copyright (c) 2015年 toshi0383. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface VCTestingTests : XCTestCase
@property ViewController *vc;
@end

@implementation VCTestingTests

- (void)setUp {
    [super setUp];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _vc = [sb instantiateInitialViewController];
    // Either `[_vc view]` or `[UIApplication sharedApplication].keyWindow.rootViewController = _vc;` makes _vc to load views
    [_vc view];
//    [UIApplication sharedApplication].keyWindow.rootViewController = _vc;
}
- (void)present {
    UIViewController *v = [UIViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:v];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    [nav presentViewController:_vc animated:NO completion:^{
        NSLog(@"presented");
    }];
}

- (void)testExample {
    // This is an example of a functional test case.
    NSString *s =_vc.label.text;
    XCTAssert([s isEqualToString:@"load"], @"%@",s);
    [self present];
    XCTAssert([s isEqualToString:@"appear"], @"%@",s);
}
- (void)testTap {
    [_vc.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    NSString *s =_vc.label.text;
    XCTAssert([s isEqualToString:@"tap"], @"%@",s);
}

@end
