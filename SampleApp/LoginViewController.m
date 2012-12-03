//
//  LoginViewController.m
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <KiiSDK/KiiUser.h>

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize loginFormController;
@synthesize loginButton;
@synthesize registerButton;
@synthesize labelText;
@synthesize textFieldMapping;
@synthesize identifierField;
@synthesize passwordField;
@synthesize nextViewController = _nextViewController;

static CGRect labelFrame;
static CGRect textFieldFrame;

- (id)init
{
    self = [super init];
    if (self) {
        labelFrame = CGRectMake(10, 6, 100, 30);
        textFieldFrame = CGRectMake(110, 10, 150, 30);    
        
        self.loginFormController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.loginFormController.tableView.dataSource = self;
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [self.loginButton sizeToFit];
        [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        
        self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.registerButton setTitle:@"Registration" forState:UIControlStateNormal];
        [self.registerButton sizeToFit];
        [self.registerButton addTarget:self action:@selector(register:) forControlEvents:UIControlEventTouchUpInside];
        
        self.identifierField = [[UITextField alloc] initWithFrame:textFieldFrame];
        self.identifierField.delegate = self;
        self.identifierField.returnKeyType = UIReturnKeyDone;
        
        self.passwordField = [[UITextField alloc] initWithFrame:textFieldFrame];
        self.passwordField.delegate = self;
        self.passwordField.returnKeyType = UIReturnKeyDone;
        
        self.labelText = [NSArray arrayWithObjects:@"Your ID", @"Password", nil];        
        self.textFieldMapping = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects:self.identifierField, self.passwordField, nil] 
                                                       forKeys:self.labelText];
    }
    return self;
}

- (id)initWithNextViewController:(UIViewController *)nextViewController
{
    self = [self init];
    if (self) {
        self.nextViewController = nextViewController;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginFormController.view.frame = CGRectMake(
                                                     0, 
                                                     20, 
                                                     self.view.bounds.size.width, 
                                                     self.view.bounds.size.height - 20);
    CGPoint mainCenterPoint = self.loginFormController.view.center;

    self.registerButton.center = mainCenterPoint;
    self.loginButton.center = CGPointMake(
                                          mainCenterPoint.x, 
                                          mainCenterPoint.y + self.registerButton.frame.size.height + 5);
    
    [self.loginFormController.view addSubview:self.registerButton];    
    [self.loginFormController.view addSubview:self.loginButton];
    [self.view addSubview:self.loginFormController.view];
}


#pragma mark - TableView data dource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.text = [self.labelText objectAtIndex:[indexPath row]];

        UITextField *field = [self.textFieldMapping objectForKey:label.text];
                
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:field];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [labelText count];
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - AlertView delegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{    
    self.nextViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:self.nextViewController animated:YES completion:^{NSLog(@"Go next page from login page.");}];
}

#pragma mark - Kii platform

- (void)login:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"Login";
    alert.delegate = nil;
    [alert addButtonWithTitle:@"OK"];    

    NSError *error = nil;
    // TODO: Use non blocking method
    [KiiUser authenticateSynchronous:self.identifierField.text withPassword:self.passwordField.text andError:&error];
    
    if (error != nil) {
        alert.message = [error description];
    } else {
        alert.message = @"Login Successful";
        alert.delegate = self;
    }
    [alert show];
}

- (void)register:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"Login";
    alert.delegate = nil;
    [alert addButtonWithTitle:@"OK"];    
    
    NSError *error = nil;
    // TODO: Use non blocking method
    KiiUser *user = [KiiUser userWithUsername:identifierField.text andPassword:self.passwordField.text];
    [user performRegistrationSynchronous:&error];
    
    if (error != nil) {
        alert.message = [error description];
    } else {
        alert.message = @"Registration Successful";
        alert.delegate = self;
    }
    [alert show];    
}

#pragma mark - Others

// This application doesn't support view rotation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
