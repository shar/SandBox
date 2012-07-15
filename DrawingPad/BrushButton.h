//
//  BrushButton.h
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrushButton : UIButton
{
    float brushSize;
}

- (id)initWithFrame:(CGRect)frame brushSize:(float)selectedBrushSize;

@property float brushSize;
@end
