//
//  ContactList.h
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property(nonatomic) NSMutableArray *contacts;

-(instancetype)initWithMe;

-(void)addContact:(Contact *)newContact;

-(void)listContacts;

@end
