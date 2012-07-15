//
//  ColorButton.m
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton

@synthesize color;

- (id)initWithFrame:(CGRect)frame color:(UIColor *)selectedColor
{
    self = [super initWithFrame:frame];

    if (self) 
    {
        color = selectedColor;
    }
    
    return self;    
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGRect rectangle = CGRectMake(0,0,40,40);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextFillPath(context);    
}
@end
