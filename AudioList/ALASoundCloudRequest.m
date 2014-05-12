//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#define CLIENT_ID @"65db70dfcdaab4cf033f9a4003a341e1" 
#define YOUR_USER_NAME @"derekw310"

#import "ALASoundCloudRequest.h"
#import "ALASong.h"
#import "ALAPlaylist.h"
#import "ALAArtist.h"

@implementation ALASoundCloudRequest


+(NSDictionary *) getSoundCloudData
{
    NSString * soundCloudString = [NSString stringWithFormat:@"https://api.soundcloud.com/users/%@/playlists.json?client_id=%@",YOUR_USER_NAME, CLIENT_ID];
    
    NSLog(@"connecting to %@", soundCloudString);
    
    NSURL * soundCloudURL = [NSURL URLWithString:soundCloudString];
    NSURLRequest * request = [NSURLRequest requestWithURL:soundCloudURL];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jSonError = nil;

    NSArray * soundCloudData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jSonError];

    
    for (NSDictionary * playListJSON in soundCloudData)
    
    {
        ALAPlaylist * playlist = [[ALAPlaylist alloc] init];
        ALAArtist * user = [[ALAArtist alloc]init];
        
    
        // playlist name
        NSString * playListName = playListJSON[@"title"];
        NSLog(@"playlist name : %@", playListName);
        // user
        NSDictionary * userJSON = playListJSON[@"user"];
        NSString * userName = userJSON[@"username"];
        NSLog(@"userName name : %@", userName);
        //track data
        NSArray * tracksJSON = playListJSON[@"tracks"];
        
        
        for (NSDictionary * track in tracksJSON)
        {
            NSString * currentTrack = track[@"title"];
            NSLog(@"currentTrack name : %@", currentTrack);

        }
    
    }
    
    
    
    
    
    
//    
//    NSArray * tracks = soundCloudData[@"tracks"];
//    NSDictionary * firstTrack = tracks[0];
////    NSString * title = firstTrack[@"title"];
//    
//
//    NSLog(@"%d", (int)[tracks count]);
//    NSLog(@"First Track data: %@", firstTrack);
    return @{};
    
}
@end
