//
//  ALAPlaylist.h
//  AudioList
//
//  Created by Derek Weber on 5/12/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALADictionary.h"

@interface ALAPlaylist : ALADictionary

+(id)newPlaylist;

@property(nonatomic) NSMutableArray * tracks;

@end
