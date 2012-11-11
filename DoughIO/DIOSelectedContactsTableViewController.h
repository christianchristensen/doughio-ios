//
//  DIOSelectedContactsTableViewController.h
//  DIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "DIOFrontViewController.h"
@class DIOPerson;

@interface DIOSelectedContactsTableViewController : UITableViewController <ABPeoplePickerNavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray *people;

- (IBAction)addContacts;
- (void)ABPeoplePickerNavigationController:(ABPeoplePickerNavigationController*)peopleNavController didFinishAddingPerson:(DIOPerson *)contact;
@end
