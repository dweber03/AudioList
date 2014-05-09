//
//  ALASong.h
//  AudioList
//
//  Created by Derek Weber on 5/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALAArtist.h"
#import "ALAAlbum.h"

@interface ALASong : NSDictionary

@property (nonatomic) ALAArtist * artist;
@property (nonatomic) ALAAlbum * album;


@end
