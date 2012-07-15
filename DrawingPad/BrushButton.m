//
//  BrushButton.m
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BrushButton.h"

@implementation BrushButton
@synthesize brushSize;

- (id)initWithFrame:(CGRect)frame brushSize:(float)selectedBrushSize
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        brushSize = selectedBrushSize;
    }
    
    return self;    
}


-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    //CGRect rectangle = CGRectMake(0,0,brushSize,brushSize);
    CGRect rectangle = CGRectMake(20 - brushSize/2,20- brushSize/2,brushSize ,brushSize);
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextFillPath(context);    
}


@end
