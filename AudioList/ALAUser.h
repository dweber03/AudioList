//
//  ALAUser.h
//  AudioList
//
//  Created by Derek Weber on 5/12/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALADictionary.h"

@class ALATrack;
@class ALAPlaylist;

@interface ALAUser : ALADictionary

// newUserWithUsername class method that takes in a username parameter
+(id)newUserWithUsername:(NSString *)username;

+ (id)newUser;

@property(nonatomic) ALATrack * track;
@property(nonatomic) ALAPlaylist * playlist;

@end
