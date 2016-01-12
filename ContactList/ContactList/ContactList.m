//
//  ContactList.m
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

-(instancetype)initWithMe{
    _contacts = [[NSMutableArray alloc] init];
    Contact *me = [[Contact alloc] init];
    me.name = @"Nate";
    me.email = @"my.email";
    [_contacts addObject:me];
    return self;
}

-(void)addContact:(Contact *)newContact{
    [self.contacts addObject:newContact];
}

-(void)listContacts{
    for (Contact *contact in self.contacts) {
        NSLog(@"%lu: %@ - Email: %@", [self.contacts indexOfObject:contact]+1,contact.name, contact.email);
    }
}

@end
