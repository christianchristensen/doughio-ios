//
//  DIOPerson.h
//  DIO
//
//  Created by Maksim Pecherskiy on 11/10/12.
//  Copyright (c) 2012 MandC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIOPerson : NSObject
@property (nonatomic, copy) NSString* phoneNumber;
@property (nonatomic, copy) NSString* fName;
@property (nonatomic, copy) NSString* lName;

- (id)initWithFirstName:(NSString *)fName lastName:(NSString *)lName phoneNum:(NSString *)phoneNum;
@end
