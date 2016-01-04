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

/**
 * Demonstrates how to test a ViewController
 * @SeeAlso http://www.slideshare.net/bgesiak/everything-you-never-wanted
 */

@interface VCTestingTests : XCTestCase
@property ViewController *vc;
@end

@implementation VCTestingTests

- (void)setUp {
    [super setUp];
    NSLog(@"================ setUp ================");
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _vc = [sb instantiateInitialViewController];
}
- (void)testDidLoad {
    /// Either `[_vc view]` or `[UIApplication sharedApplication].keyWindow.rootViewController = _vc;` makes _vc to load views
    [_vc view];
//    [UIApplication sharedApplication].keyWindow.rootViewController = _vc;
    NSString *s =_vc.label.text;
    XCTAssert([s isEqualToString:@"load"], @"%@",s);

}
- (void)testDidAppear {
    UIViewController *v = [UIViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:v];

    /// actually starting to load views here
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    
    /// try to call viewDidAppear
    XCTestExpectation *ex = [self expectationWithDescription:@"try to call viewDidAppear:"];
    [nav presentViewController:_vc animated:NO completion:^{
        NSLog(@"================= Presented =================");
        NSString *s =_vc.label.text;
        XCTAssert([s isEqualToString:@"appear"], @"%@",s);
        [ex fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:nil];
}
- (void)testTap {
    /// load views
    [_vc view];
    /// send action to button
    [_vc.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    NSString *s =_vc.label.text;
    XCTAssert([s isEqualToString:@"tap"], @"%@",s);
}

@end
