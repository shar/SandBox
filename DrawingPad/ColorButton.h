//
//  ColorButton.h
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorButton : UIButton
{
    UIColor *color;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)selectedColor;

@property(nonatomic, retain) UIColor *color;

@end
