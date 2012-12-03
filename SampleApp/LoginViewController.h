//
//  LoginViewController.h
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UINavigationController<UITableViewDataSource, UITextFieldDelegate, UIAlertViewDelegate>

- (id)initWithNextViewController:(UIViewController *)nextViewController;

@property (strong, nonatomic) UITableViewController *loginFormController;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;           
@property (strong, nonatomic) NSArray *labelText;
@property (strong, nonatomic) NSDictionary *textFieldMapping;
@property (strong, nonatomic) UITextField *identifierField;
@property (strong, nonatomic) UITextField *passwordField;
@property (strong, nonatomic) UIViewController *nextViewController;

@end
