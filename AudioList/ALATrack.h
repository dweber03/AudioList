//
//  ALASong.h
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALAArtist;
@class ALAPlaylist;


@interface ALATrack : NSDictionary

@property (nonatomic) ALAArtist * user;
@property (nonatomic) ALAPlaylist * playlist;


@end
