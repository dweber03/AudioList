//
//  ALASongData.h
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALATrack.h"
#import "ALAUser.h"
#import "ALAPlaylist.h"

@interface ALASongData : NSObject

+(ALASongData *)mainData;

-(void)addNewTrack:(ALATrack *)track;
-(NSArray *)allTracks;

-(void)addNewUser: (ALAUser *)user;
-(NSArray *)allUsers;

-(void)addNewPlaylist: (ALAPlaylist *)playlist;
-(NSArray *)allPlaylists;



@end
