//
//  Contact.h
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic)NSString *name;
@property(nonatomic)NSString *email;
@property(nonatomic)NSMutableDictionary *phoneNumbers;
@property(nonatomic)BOOL hasPhoneNumber;

-(instancetype)init;



@end
