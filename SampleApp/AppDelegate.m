//
//  AppDelegate.m
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <KiiSDK/Kii.h>

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "GroupViewController.h"
#import "Settings.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize loginViewController = _loginViewController;
@synthesize groupViewController = _groupViewController;

- (void) setupKiiSDK
{
    [Kii beginWithID:APP_ID andKey:APP_KEY andCustomURL:SERVER_URL];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupKiiSDK];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.groupViewController = [[GroupViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.groupViewController];    
    self.loginViewController = [[LoginViewController alloc] initWithNextViewController:navigationController];
    self.window.rootViewController = self.loginViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
