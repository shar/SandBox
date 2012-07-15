//
//  ViewController.h
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIColor * currentColor;
    float currentBrushSize;
    
    BOOL toggleColor; 
    BOOL toggleBrush;
    BOOL toggleSticker;
    
    CGPoint lastPoint;
    CGPoint startPoint;
    
    UIScrollView * colorScroll;
    UIScrollView * brushSizeScroll;
    UIScrollView * stickerScroll;
    
    UIImageView * drawImageView;

    NSArray *colors;
    NSArray *brushSizes;
    NSArray *images;
    
    UIImageView *trashiv;
}
@end
