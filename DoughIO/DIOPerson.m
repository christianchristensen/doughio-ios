//
//  DIOPerson.m
//  DIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import "DIOPerson.h"

@implementation DIOPerson
- (id)initWithFirstName:(NSString *)fName lastName:(NSString *)lName phoneNum:(NSString *)phoneNum
{
  if (self = [super init]) {
    self.fName = fName;
    self.lName = lName;
    self.phoneNumber = phoneNum;
  }
  return self;
}

@end
