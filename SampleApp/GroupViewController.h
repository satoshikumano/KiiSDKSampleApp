//
//  GroupViewController.h
//  SampleApp
//
//  Created by Tatsuro Fujii on 12/10/04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic) UITableViewController *groupListController;

@end
