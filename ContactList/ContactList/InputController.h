//
//  InputController.h
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactList.h"
#import "InputController.h"

@interface InputController : NSObject

@property(nonatomic)NSMutableArray *history;

-(instancetype)init;

-(NSString *)inputForPrompt:(NSString *)promptString;

-(void)printRecentHistory;

-(NSMutableDictionary *)addPhoneNumbers;

@end
