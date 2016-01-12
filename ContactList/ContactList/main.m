//
//  main.m
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactList.h"
#import "InputController.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
     {
         InputController *inputController = [[InputController alloc] init];
         ContactList *contactList = [[ContactList alloc] initWithMe];
         while (YES) {
             
             
             NSString *userCommand = [inputController inputForPrompt:@"What would you like to do? Create new contact - type: new, List all contacts - type: list, Quit - type: quit, Show contact details - type: show, Search the list - type: find, Print recent history - type: history"];
             
             if ([[userCommand lowercaseString] isEqualToString:@"quit"]) {
                 
                 NSLog(@"Thanks, see you next time!");
                 return 0;
             
             }else if ([[userCommand lowercaseString] isEqualToString:@"new"]){
                 
                 NSString *newEmail = [inputController inputForPrompt:@"please enter the contact's Email"];
                 if ([contactList isDuplicate:newEmail]){
                     Contact *duplicateContact = [contactList findDuplicate:newEmail];
                     NSLog(@"A user with that email already exists!");
                     NSLog(@"Name: %@ - Email: %@", duplicateContact.name, duplicateContact.email);
                     
                     continue;
                 }
                 
                 NSString *newName = [inputController inputForPrompt:@"please enter the contacts name"];
                 
                 Contact *newContact = [[Contact alloc] init];
                 newContact.name = newName;
                 newContact.email = newEmail;
                 while (YES) {
                     NSString *addNumbers = [inputController inputForPrompt:@"Add phone numbers? Y/N"];
                     if ([[addNumbers lowercaseString] isEqualToString:@"y"] || [[addNumbers lowercaseString] isEqualToString:@"yes"]) {
                         newContact.hasPhoneNumber = YES;
                         newContact.phoneNumbers = [inputController addPhoneNumbers];
                         break;
                     } else if ([[addNumbers lowercaseString] isEqualToString:@"n"] || [[addNumbers lowercaseString] isEqualToString:@"no"]) {
                         break;
                     } else {
                         continue;
                     }
                 }

                 [contactList addContact:newContact];

             
             }else if ([[userCommand lowercaseString] isEqualToString:@"list"]){
                 
                 [contactList listContacts];
             
             }else if ([[userCommand lowercaseString] isEqualToString:@"show"]){
                 
                 NSString *userInput = [inputController inputForPrompt:@"Please enter the id number of the contact"];
                 NSInteger userIndex = [userInput integerValue];
                 [contactList showContactDetails:userIndex];
                 
                 
             }else if ([[userCommand lowercaseString] isEqualToString:@"find"]){
                 
                 NSString *userInput = [inputController inputForPrompt:@"Please enter your search term"];
                 NSArray *searchResults = [contactList find:userInput];
                 for (Contact *contact in searchResults) {
                     NSLog(@"Name: %@ - Email: %@", contact.name, contact.email);
                 }
                 if ([searchResults count] == 0) {
                     NSLog(@"No results were found");
                 }
                 
             
             }else if ([[userCommand lowercaseString] isEqualToString:@"history"]){
                 
                 [inputController printRecentHistory];
                 
             }else{
                
                 NSLog(@"Your command was not understood.  Please try again");
             }
             
         }
         
         
    
         
    }
    return 0;
}


