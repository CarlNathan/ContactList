//
//  InputController.m
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "InputController.h"


@implementation InputController

-(instancetype)init{
    self = [super init];
    if (self){
        _history = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString{
    
    
    NSLog(@"%@", promptString);
    char userCommand[255];
    scanf("%s",userCommand);
    
    NSString *responseString = [NSString stringWithUTF8String:userCommand];
    [self.history addObject:responseString];
    return responseString;
}

- (void)printRecentHistory {
    NSInteger historyCount = [self.history count];
    if (historyCount < 4) {
        NSLog(@"%@", self.history);
    } else {
        NSRange recent = NSMakeRange([self.history count] - 4, 3);
        NSArray *recentHistory = [self.history subarrayWithRange:recent];
        NSLog(@"%@", recentHistory);
    }
}

-(NSMutableDictionary *)addPhoneNumbers{
    NSMutableDictionary *phoneNumbers = [[NSMutableDictionary alloc]init];
    NSString *key = [self inputForPrompt:@"Enter the phone type"];
    NSString *number = [self inputForPrompt:@"Enter the phone number."];
    [phoneNumbers setObject:number forKey:key];
    
    while (YES) {
        NSString *addAnother = [self inputForPrompt:@"Add another? Y/N"];
        if ([[addAnother lowercaseString] isEqualToString:@"y"] || [[addAnother lowercaseString] isEqualToString:@"yes"]) {
            NSString *key = [self inputForPrompt:@"Enter the phone type"];
            NSString *number = [self inputForPrompt:@"Enter the phone number."];
            [phoneNumbers setObject:number forKey:key];
            continue;
        } else if ([[addAnother lowercaseString] isEqualToString:@"n"] || [[addAnother lowercaseString] isEqualToString:@"no"]) {
            break;
        } else {
            continue;
        }
    }
    return phoneNumbers;
}

@end
