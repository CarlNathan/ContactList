//
//  Contact.m
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(instancetype)init{
    self = [super init];
    if (self) {
        _hasPhoneNumber = NO;
    }
    return self;
}

@end
