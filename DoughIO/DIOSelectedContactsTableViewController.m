//
//  DIOSelectedContactsTableViewController.m
//  DIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import "DIOSelectedContactsTableViewController.h"
#import "DIOPerson.h"

@interface DIOSelectedContactsTableViewController ()

@end

@implementation DIOSelectedContactsTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)ABPeoplePickerNavigationController:(ABPeoplePickerNavigationController*)peopleNavController didFinishAddingPerson:(DIOPerson *)contact {
  int newRowIndex = [self.people count];
  [self.people addObject:contact];
  NSLog(@"%@", self.people);
  
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
  NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
  [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
  
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)configureCell:(UITableViewCell *)cell withPerson:(DIOPerson *)person
{
  UILabel *firstNameLabel = (UILabel *)[cell viewWithTag:1];
  UILabel *lastNameLabel = (UILabel *)[cell viewWithTag:2];
  UILabel *phoneLabel = (UILabel*)[cell viewWithTag:3];
  firstNameLabel.text = person.fName;
  lastNameLabel.text = person.lName;
  phoneLabel.text = person.phoneNumber;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  [self.navigationController setNavigationBarHidden:NO];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
  if ([self.people count] == 0) {
   self.people = [[NSMutableArray alloc] initWithCapacity:30];
  }
  NSLog(@"%@", self.people);
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"personCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
  [self configureCell:cell withPerson:[self.people objectAtIndex:indexPath.row]];
  
  NSLog(@"%@", self.people);
   
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Action Callbacks
- (IBAction)addContacts
{
  ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
  picker.peoplePickerDelegate = self;
	// Display only a person's phone, email, and birthdate
	NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
                             [NSNumber numberWithInt:kABPersonEmailProperty],
                             [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
	
	
	picker.displayedProperties = displayedItems;
	// Show the picker
	[self presentViewController:picker animated:YES completion:nil];
}


#pragma mark ABPeoplePickerNavigationControllerDelegate methods
// Displays the information of a selected person
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
	return YES;
}


// Does not allow users to perform default actions such as dialing a phone number, when they select a person property.
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                                identifier:(ABMultiValueIdentifier)identifier
{
  if (property == kABPersonPhoneProperty) {
    ABMultiValueRef multi = ABRecordCopyValue(person, property);
     // Set up an NSArray and copy the values in.
    NSArray *theArray = (__bridge id)ABMultiValueCopyArrayOfAllValues(multi);
    NSString *phone = [theArray objectAtIndex:identifier];
    NSLog(@"%@", phone);
    //Get Fname / Lname.
    NSString *fName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *lName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    DIOPerson *contact = [[DIOPerson alloc] initWithFirstName:fName lastName:lName phoneNum:phone];
    NSLog(@"%@", contact);
    
    //[self.people addObject:contact];
    //NSLog(@"%@", self.people);
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self ABPeoplePickerNavigationController:peoplePicker didFinishAddingPerson:contact];
    return NO;
  }
  return YES;
}


// Dismisses the people picker and shows the application when users tap Cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;
{
	//[self dismissModalViewControllerAnimated:YES];
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
