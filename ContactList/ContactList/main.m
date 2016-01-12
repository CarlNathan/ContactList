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
             
             
             NSString *userCommand = [inputController inputForPrompt:@"What would you like to do? Create new contact - type: new List all contacts - type: list Quit - type: quit"];
             
             if ([userCommand isEqualToString:@"quit"] || [userCommand isEqualToString:@"Quit"]) {
                 
                 NSLog(@"Thanks, see you next time!");
                 return 0;
             
             }else if ([userCommand isEqualToString:@"new"] || [userCommand isEqualToString:@"New"]){
                 NSString *newName = [inputController inputForPrompt:@"please enter the contacts name"];
                 NSString *newEmail = [inputController inputForPrompt:@"please enter the contacts Email"];
                 Contact *newContact = [[Contact alloc] init];
                 newContact.name = newName;
                 newContact.email = newEmail;
                 [contactList addContact:newContact];

             
             }else if ([userCommand isEqualToString:@"list"] || [userCommand isEqualToString:@"List"]){
                 [contactList listContacts];
             
             }else{
                
                 NSLog(@"Your command was not understood.  Please try again");
             }
             
         }
         
         
    
         
    }
    return 0;
}
