//
//  IAAccountsViewController.m
//  TweetBook
//
//  Created by Marius Butuc on 13-06-18.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import "IAAccountsViewController.h"

@interface IAAccountsViewController ()

@end

@implementation IAAccountsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.accounts = [[NSMutableArray alloc] init];
    
    [self retrieveAccounts:ACAccountTypeIdentifierTwitter options:nil];
    
    NSDictionary *fbOptions = @{ ACFacebookAppIdKey: @"19831117", ACFacebookPermissionsKey: @[@"email", @"user_about_me"] };
    
    [self retrieveAccounts:ACAccountTypeIdentifierFacebook options:fbOptions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.accounts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"accountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    ACAccount *account = self.accounts[indexPath.row];
    if ([account.accountType.identifier isEqualToString:ACAccountTypeIdentifierTwitter])
        cell.textLabel.text = account.accountDescription;
    else
        cell.textLabel.text = account.username;

    
    return cell;
}

-(void)retrieveAccounts:(NSString *)identifier options:(NSDictionary *)options
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:identifier];
    
    [accountStore requestAccessToAccountsWithType:accountType options:options completion:^(BOOL granted, NSError *error)
    {
        if (granted)
        {
            [self.accounts addObjectsFromArray:[accountStore accountsWithAccountType:accountType]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
             }];
}

@end
