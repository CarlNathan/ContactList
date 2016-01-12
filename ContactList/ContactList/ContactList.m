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
        if (contact.hasPhoneNumber) {
            NSLog(@"%@", contact.phoneNumbers);
        }
    }
}

-(void)showContactDetails:(NSInteger)userIndex{

    if (userIndex > 0 && userIndex < [self.contacts count] +1) {
        Contact *contact = [self.contacts objectAtIndex:userIndex -1];
        NSLog(@"Name: %@", contact.name);
        NSLog(@"Email: %@", contact.email);
    }else{
        NSLog(@"Sorry, the user could not be found");
    }
    
}

-(NSArray *)find:(NSString *)searchTerm{
   
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    
    for (Contact *contact in self.contacts) {
        if ([[contact.name lowercaseString] containsString:[searchTerm lowercaseString]]) {
            [searchResults addObject:contact];
            
        }else if ([[contact.email lowercaseString] containsString:[searchTerm lowercaseString]]){
            [searchResults addObject:contact];
        }
    }
    return [searchResults copy];
}

-(Contact *)findDuplicate:(NSString *)newEmail{
    Contact *duplicateContact = [[Contact alloc] init];
    
    for (Contact *contact in self.contacts) {
        if([[contact.email lowercaseString] isEqualToString:[newEmail lowercaseString]]){
            duplicateContact = contact;
        }
    }
    return duplicateContact;
}
-(BOOL)isDuplicate:(NSString *)newEmail{
    
    
    for (Contact *contact in self.contacts) {
        if([[contact.email lowercaseString] isEqualToString:[newEmail lowercaseString]]){
            return YES;
        }
    }
    return NO;
}


@end
