//
//  DIOFront.h
//  DoughIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIOFront : NSObject
@property (nonatomic, copy) UIImage* image;
@property (nonatomic, copy) NSString* topLabel;
@property (nonatomic, copy) NSString* bottomLabel;

- (id)initWithImageName:(NSString *)imageName topLabel:(NSString*)topLabel bottomLabel:(NSString *)bottomLabel;
@end
