//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#define CLIENT_ID @"65db70dfcdaab4cf033f9a4003a341e1" 

#import "ALASoundCloudRequest.h"

@implementation ALASoundCloudRequest


+(NSDictionary *) getSoundCloudData
{
    NSString * soundCloudString = [NSString stringWithFormat:@"http://api.soundcloud.com/playlists/4252210.json?client_id=%@", CLIENT_ID];
    NSURL * soundCloudURL = [NSURL URLWithString:soundCloudString];
    NSURLRequest * request = [NSURLRequest requestWithURL:soundCloudURL];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jSonError = nil;
    NSDictionary * soundCloudData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jSonError];
    NSArray * tracks = soundCloudData[@"tracks"];
    NSDictionary * firstTrack = tracks[0];

    NSLog(@"%d", (int)[tracks count]);
    NSLog(@"First Track data: %@", firstTrack);
    return @{};
    
}
@end
