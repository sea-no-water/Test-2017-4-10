//
//  AppDelegate.m
//  Test
//
//  Created by pthk on 2017/4/8.
//  Copyright © 2017年 pthk. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    
    
    ViewController * vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    
    return YES;
}




@end
