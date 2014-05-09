//
//  ALAAudioData.h
//  AudioList
//
//  Created by Derek Weber on 5/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALAAudioData : NSObject

+ (ALAAudioData *)mainData;

-(void)newAudioItem:(NSDictionary *)listItem;

-(NSArray *)allListItems;

@end
