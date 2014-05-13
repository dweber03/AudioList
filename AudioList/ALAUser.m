//
//  ALAUser.m
//  AudioList
//
//  Created by Derek Weber on 5/12/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#define USER_NAME @"derekw310"
#import "ALAUser.h"
#import "ALASongData.h"

@implementation ALAUser

//(id) = wildcard Use (id) in case you want to subclass ALATrack

+ (id)newUser

{
    return [[ALAUser alloc]init];
}

+(id)newUserWithUsername:(NSString *)username
{
    NSArray * users = [[ALASongData mainData] allUsers];
    
    for (ALAUser * user in users) {
        NSString * currentUserName = user[@"username"];
        
        if ([currentUserName isEqualToString:username]) {
            
            ALAUser * newUser = [[ALAUser alloc] init];
            newUser[USER_NAME] = username;
            return newUser;
            
        }
    }
    
    return [[ALAUser alloc]init];
}

@end
