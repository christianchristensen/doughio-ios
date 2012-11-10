//
//  DIOFrontViewController.m
//  DoughIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import "DIOFrontViewController.h"
#import "DIOFront.h"

@interface DIOFrontViewController ()

@end

@implementation DIOFrontViewController
NSArray *fronts;

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
  
    fronts = [NSArray arrayWithObjects:
           [[DIOFront alloc] initWithImageName:@"success_kid" topLabel:@"monkey" bottomLabel:@"farts"],
            [[DIOFront alloc] initWithImageName:@"success_kid" topLabel:@"something" bottomLabel:@"butt"],
            nil];
  int loc = arc4random() % [fronts count];

  DIOFront *currentFront = [fronts objectAtIndex:loc];
  self.imageView.image = currentFront.image;
  self.topLabel.text = currentFront.topLabel;
  self.bottomLabel.text = currentFront.bottomLabel;
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if (![defaults objectForKey:kUserPhoneNumberKey]) {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Phone Number"
                                                    message:@"Hey! Give me your number beautiful"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
  }
  
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIAlertViewDelegate

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
  NSString *inputText = [[alertView textFieldAtIndex:0] text];
  if( [inputText length] >= 10 )
  {
    return YES;
  }
  else
  {
    return NO;
  }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *phoneNum = [[alertView textFieldAtIndex:0] text];
  [defaults setObject:phoneNum forKey:kUserPhoneNumberKey];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
  
}

@end
