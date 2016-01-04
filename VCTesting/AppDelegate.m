//
//  AppDelegate.m
//  VCTesting
//
//  Created by toshi0383 on 2015/08/24.
//  Copyright (c) 2015年 toshi0383. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


static BOOL isRunningTests(void)
{
    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
    NSString* injectBundle = environment[@"XCInjectBundle"];
    return [[injectBundle pathExtension] isEqualToString:@"xctest"];
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    /// Detect if Running test or not
    /// @SeeAlso https://www.objc.io/issues/1-view-controllers/testing-view-controllers/
    if (isRunningTests()) {
        return YES;
    }
    assert(NO);
    return YES;
}

@end
