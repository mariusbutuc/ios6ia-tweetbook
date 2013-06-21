//
//  IAAccountsViewController.h
//  TweetBook
//
//  Created by Marius Butuc on 13-06-18.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface IAAccountsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *accounts;

@end
