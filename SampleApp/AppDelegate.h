//
//  AppDelegate.h
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;
@class GroupViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *loginViewController;
@property (strong, nonatomic) GroupViewController *groupViewController;

@end
