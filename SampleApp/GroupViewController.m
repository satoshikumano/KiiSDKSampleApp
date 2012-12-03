//
//  GroupViewController.m
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroupViewController.h"

static const CGFloat toolbarHeight = 40;
static const CGFloat listHeight = 420;

@implementation GroupViewController

@synthesize toolbar;
@synthesize groupListController;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.groupListController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        self.groupListController.tableView.dataSource = self;
        self.groupListController.tableView.delegate = self;
        self.groupListController.title = @"Group";
        
        self.toolbar = [[UIToolbar alloc] init];
        self.toolbar.barStyle = UIBarStyleBlack;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addGroup:)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.rightBarButtonItem = addButton;

    CGFloat width = self.view.frame.size.width;
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    self.groupListController.view.frame = CGRectMake(0, 0, width, listHeight);
    self.toolbar.frame = CGRectMake(0, listHeight - navigationBarHeight, width, toolbarHeight);

    [self.view addSubview:self.groupListController.view];    
    [self.view addSubview:self.toolbar];
}

#pragma mark - TableView data dource

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - Kii platform

- (void)addGroup:(id)sender
{
    // show alert to get the name of new group
}

- (void)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"Back");}];
}

#pragma mark - Others

// This application doesn't support view rotation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
