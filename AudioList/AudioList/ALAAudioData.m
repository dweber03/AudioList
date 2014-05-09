//
//  ALAAudioData.m
//  AudioList
//
//  Created by Derek Weber on 5/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALAAudioData.h"

@interface ALAAudioData ()

@property (nonatomic) NSMutableArray * listItems;

@end

@implementation ALAAudioData


+ (ALAAudioData *)mainData;
{
    static dispatch_once_t create;
    static ALAAudioData * singleton = nil;
    dispatch_once(&create, ^{
        singleton = [[ALAAudioData alloc]init];
    });
    
    return singleton;
}

-(id)init
{
    self = [super init];
    if (self) {
        [self loadListItems];
    }
    return self;
}


- (NSMutableArray *)listItems
{
    if (_listItems == nil)
    {
        _listItems = [@[
                        @{@"name" : @"Eminem", @"album title" : @"name"}] mutableCopy];
        
    }
    return _listItems;
}

-(void)newAudioItem:(NSDictionary *)listItem
{
    [self.listItems addObject:listItem];
    
}


-(NSArray *)allListItems
{
    return [self.listItems copy];
    
}

-(void)loadListItems
{
    
}


@end
