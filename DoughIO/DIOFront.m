//
//  DIOFront.m
//  DoughIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import "DIOFront.h"

@implementation DIOFront

- (id)initWithImageName:(NSString *)imageName topLabel:(NSString*)topLabel bottomLabel:(NSString *)bottomLabel
{
  if (self = [super init]) {
    self.image = [UIImage imageNamed:imageName];
    self.topLabel = topLabel;
    self.bottomLabel = bottomLabel;
  }
  return self;
}

@end
