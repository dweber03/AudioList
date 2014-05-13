//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#define CLIENT_ID @"client_id=65db70dfcdaab4cf033f9a4003a341e1"
#define USER_NAME @"derekw310"
#define SC_API @"https://api.soundcloud.com"


#import "ALASoundCloudRequest.h"
#import "ALASongData.h"


@implementation ALASoundCloudRequest

+ (void)updateData
{
    NSString * urlString = [NSString stringWithFormat:@"%@/users/%@/playlists.json?%@",SC_API,USER_NAME,CLIENT_ID];
    NSLog(@"Connecting to %@", urlString);
    NSURL * requestURL = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray * scInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary * playlistInfo in scInfo)
        {
            ALAPlaylist * playlist = [ALAPlaylist newPlaylist];
            playlist[@"title"] = playlistInfo[@"title"];
            [[ALASongData mainData] addNewPlaylist:playlist];
            
            for (NSDictionary * trackInfo in playlistInfo[@"tracks"])
            {
                if(![trackInfo[@"streamable"] boolValue]) continue;
                ALATrack * track = [ALATrack newTrack];
                track.playlist = playlist;
                track[@"title"] = trackInfo[@"title"];
                track[@"url"] = trackInfo[@"stream_url"];
                [playlist.tracks addObject:track];
                
                [[ALASongData mainData] addNewTrack:track];
                
                ALAUser * user = [ALAUser newUser];
                NSDictionary * userInfo = trackInfo [@"user"];
                user[@"username"] = userInfo[@"username"];
                user[@"avatar_url"] = userInfo[@"avatar_url"];
                track.user = user;
                [[ALASongData mainData] addNewUser:user];
            }
        }
        
        NSNotificationCenter * nCenter = [NSNotificationCenter defaultCenter];
        
        [nCenter postNotificationName:@"dataUpdated" object:nil];
        
        NSLog(@"all tracks %@, all users %@, all playlists %@" ,
              [[ALASongData mainData]allTracks],
              [[ALASongData mainData]allUsers],
              [[ALASongData mainData]allPlaylists]);
    }];
}

@end
