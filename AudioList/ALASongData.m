//
//  ALASongData.m
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALASongData.h"

@implementation ALASongData
{
    NSMutableArray * tracks;
    NSMutableArray * users;
    NSMutableArray * playlists;
}

+(ALASongData *)mainData
{
    static dispatch_once_t create;
    static ALASongData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[ALASongData alloc]init];
    });
    
    return singleton;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        tracks = [@[] mutableCopy];
        users = [@[] mutableCopy];
        playlists = [@[] mutableCopy];
    }
    return self;
}

-(void)addNewTrack:(ALATrack *)track
{
    [tracks addObject:track];
}

- (NSArray *)allTracks
{
    return [tracks copy];
}

-(void)addNewUser:(ALAUser *)user
{
    [users addObject:user];
}

- (NSArray *)allUsers
{
    return [users copy];
}

-(void)addNewPlaylist:(ALAPlaylist *)playlist
{
    [playlists addObject:playlist];
}

-(NSArray *)allPlaylists
{
    return [playlists copy];
}

@end
