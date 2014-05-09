//
//  ALATableViewCell.m
//  AudioList
//
//  Created by Derek Weber on 5/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALATableViewCell.h"
#import "ALAAudioData.h"


@implementation ALATableViewCell

{
    UIImage * albumImage;
    UILabel * albumName;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    
    NSDictionary * albumInfo = [[ALAAudioData mainData] allListItems][index];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

@end
