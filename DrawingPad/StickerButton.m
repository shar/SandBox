//
//  StickerButton.m
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StickerButton.h"

@implementation StickerButton
@synthesize index;

- (id)initWithFrame:(CGRect)frame index:(int)selectedIndex
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        index = selectedIndex;
    }
    
    return self;    
}



@end
