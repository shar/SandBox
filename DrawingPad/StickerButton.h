//
//  StickerButton.h
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StickerButton : UIButton
{
    int index;
}

- (id)initWithFrame:(CGRect)frame index:(int)selectedIndex;

@property int index;
@end
