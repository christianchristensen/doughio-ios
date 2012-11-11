//
//  DIOMainWebViewController.h
//  DoughIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIOMainWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
@property (nonatomic, copy) NSArray *contacts;
@property (nonatomic, copy) NSString *ownNumber;
@end
