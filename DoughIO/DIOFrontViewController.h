//
//  DIOFrontViewController.h
//  DoughIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kUserPhoneNumberKey @"userPhoneNumber"

@interface DIOFrontViewController : UIViewController <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) IBOutlet UILabel *bottomLabel;


@end
