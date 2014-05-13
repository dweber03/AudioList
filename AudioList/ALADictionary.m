//
//  ALADictionary.m
//  AudioList
//
//  Created by Derek Weber on 5/12/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALADictionary.h"

@implementation ALADictionary
{
    NSMutableDictionary * dict;
}

-(id)init
{
    self = [super init];
    if (self) {
        dict = [@{} mutableCopy];
    }
    return self;
}

-(id)objectForKey:(id)aKey
{
    return dict[aKey];
}

-(void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    dict[aKey] = anObject;
}

-(void)removeObjectForKey:(id)aKey
{
    [dict removeObjectForKey:aKey];
}

-(NSUInteger)count
{
    return [dict count];
}

- (NSEnumerator *)keyEnumerator
{
    return [dict keyEnumerator];
}


@end
