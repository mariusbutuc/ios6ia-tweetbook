//
//  IAStreamViewController.h
//  TweetBook
//
//  Created by Marius Butuc on 13-06-21.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface IAStreamViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ACAccount *account;

- (IBAction)postToStream:(id)sender;

@end
