//
//  ViewController.m
//  DrawingPad
//
//  Created by Sukman Har on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ColorButton.h"
#import "BrushButton.h"
#import "StickerButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController
float startX = 0;
float startY = 0;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    toggleColor = NO;
    toggleBrush = NO;
    toggleSticker = NO;
    
    currentBrushSize = 1;
    currentColor = [UIColor blackColor];
    
    // mainview - self.view
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    colorScroll = [[UIScrollView alloc] 
                            initWithFrame:CGRectMake(0, 40, 40, 400)];
    
    brushSizeScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 500, 40, 400)];
    
    stickerScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(650, 40, 100, 900)];
    
    [self.view addSubview:colorScroll];
	[self.view addSubview:brushSizeScroll];
    [self.view addSubview:stickerScroll];
    
    NSLog(@"%f%f", stickerScroll.center.x, stickerScroll.center.y);
    
    colorScroll.pagingEnabled = YES;
    colorScroll.delegate = self;
    
    brushSizeScroll.pagingEnabled = YES;
    brushSizeScroll.delegate = self;
    
    stickerScroll.pagingEnabled = YES;
    stickerScroll.delegate = self;
    
    colors = [[NSArray alloc]initWithObjects:
              [UIColor blackColor],
              [UIColor darkGrayColor],
              [UIColor lightGrayColor],
              [UIColor grayColor],
              [UIColor redColor],
              [UIColor greenColor],
              [UIColor blueColor],
              [UIColor cyanColor],
              [UIColor yellowColor],
              [UIColor magentaColor],
              [UIColor orangeColor],
              [UIColor purpleColor],
              [UIColor brownColor],nil ];
    
    brushSizes = [[NSArray alloc] initWithObjects:
                  [NSNumber numberWithFloat:2],
                  [NSNumber numberWithFloat:5],
                  [NSNumber numberWithFloat:8],
                  [NSNumber numberWithFloat:10],
                  [NSNumber numberWithFloat:12],
                  [NSNumber numberWithFloat:15],
                  [NSNumber numberWithFloat:20],
                  [NSNumber numberWithFloat:25],
                  [NSNumber numberWithFloat:30],
                  [NSNumber numberWithFloat:40],
                  nil];
    
    
    for (int i=0; i < [colors count]; i++) 
    {
        ColorButton *btnColor = [[ColorButton alloc] initWithFrame:CGRectMake(0, 40 * i, 40, 40) color:[colors objectAtIndex:i]];
        
        [btnColor addTarget:self action:@selector(selectColor:) forControlEvents:UIControlEventTouchDown];
        
        [colorScroll addSubview:btnColor];
    }
    
    colorScroll.contentSize = CGSizeMake(40, 40* [colors count]);
    

    for (int i=0; i < [brushSizes count]; i++)
    {
        BrushButton *btnBrush = [[BrushButton alloc] initWithFrame:CGRectMake(0,40 * i, 40, 40) brushSize:[[brushSizes objectAtIndex:i]floatValue]];
        
        [btnBrush addTarget:self action:@selector(selectBrushSize:)forControlEvents:UIControlEventTouchDown];
        
        [brushSizeScroll addSubview:btnBrush];
    }
    
    brushSizeScroll.contentSize = CGSizeMake(40, 40 * [brushSizes count]);


    for (int i=0; i < 12; i++) 
    {
        StickerButton *btnSticker = [[StickerButton alloc] initWithFrame:CGRectMake(0, 100*i, 100, 100) index:i];
        
        [btnSticker addTarget:self action:@selector(selectSticker:) forControlEvents:UIControlEventTouchDown];
        
        NSString *imgName = [NSString stringWithFormat:@"kitty%i.jpg", i];
        UIImage *img = [UIImage imageNamed:imgName];
        
        [btnSticker setImage:img forState:UIControlStateNormal];
        
        [stickerScroll addSubview:btnSticker];
    }
    
    stickerScroll.contentSize = CGSizeMake(100, 100 * 12);
    
    // add toggle button //
    UIButton *colorToggleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ;
    
    colorToggleBtn.frame = CGRectMake(10, 10, 24, 24);
    [colorToggleBtn setImage:[UIImage imageNamed:@"toggle.jpg"]forState:UIControlStateNormal];
    
    [colorToggleBtn addTarget:self action:@selector(toggleColor) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:colorToggleBtn];
    
    UIButton *brushToggleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ;
    
    brushToggleBtn.frame = CGRectMake(10, 470, 24, 24);
    [brushToggleBtn setImage:[UIImage imageNamed:@"toggle.jpg"]forState:UIControlStateNormal];
    
    [brushToggleBtn addTarget:self action:@selector(toggleBrush) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:brushToggleBtn];
    
    UIButton *stickerToggleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ;
    
    stickerToggleBtn.frame = CGRectMake(680, 10, 24, 24);
    [stickerToggleBtn setImage:[UIImage imageNamed:@"toggle.jpg"]forState:UIControlStateNormal];
    
    [stickerToggleBtn addTarget:self action:@selector(toggleSticker) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:stickerToggleBtn];

    // clear image //
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    clearBtn.frame = CGRectMake(10, 920, 120, 40);
    [clearBtn setTitle:@"Clear Drawing" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearDrawing) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:clearBtn];
    
    // save //
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveBtn.frame = CGRectMake(180, 920, 120, 40);
    [saveBtn setTitle:@"Save Drawing" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveDrawing) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:saveBtn];
    
    
    // load //
    UIButton *loadBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadBtn.frame = CGRectMake(330, 920, 120, 40);
    [loadBtn setTitle:@"Load Drawing" forState:UIControlStateNormal];
    [loadBtn addTarget:self action:@selector(loadDrawing) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loadBtn];

    // trash //
    trashiv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trash.jpg"]];
    trashiv.frame = CGRectMake(500, 910, 50, 50);
    [self.view addSubview:trashiv];

    // Add drawing layer (remove this view when clear button is click
    drawImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 0, self.view.bounds.size.width - 110, self.view.bounds.size.height-100)];
    drawImageView.backgroundColor = [UIColor clearColor];
    //drawImageView.userInteractionEnabled = YES;
    [self.view addSubview:drawImageView];

}


-(void)saveDrawing
{
    UIGraphicsBeginImageContext(drawImageView.bounds.size);
    [drawImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (viewImage  != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent: 
                          [NSString stringWithString: @"drawing.png"] ];
        NSData* data = UIImagePNGRepresentation(viewImage);
        [data writeToFile:path atomically:YES];
        
        NSLog(@"%@", path); 
    }
}

-(void)loadDrawing
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent: 
                      [NSString stringWithString: @"drawing.png"] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    
    drawImageView.image = image;
}


-(void)clearDrawing
{
    [drawImageView removeFromSuperview];
    
    // re-create //
    drawImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 0, self.view.bounds.size.width - 110, self.view.bounds.size.height-100)];
    drawImageView.backgroundColor = [UIColor clearColor];
    //drawImageView.userInteractionEnabled = YES;
    [self.view addSubview:drawImageView];
}

-(void)toggleColor
{
    [UIView beginAnimations:@"toggleColor" context:nil];
    [UIView setAnimationDuration:0.5];
    
    // Do Animation
    if (toggleColor == YES) {
        
        colorScroll.center = CGPointMake(20, 240);
        toggleColor = NO;
    }
    else 
    {
        colorScroll.center = CGPointMake(20, -240);        
        toggleColor = YES; 
    }
    
    [UIView commitAnimations];

}

-(void)toggleBrush
{
    [UIView beginAnimations:@"toggleBrush" context:nil];
    [UIView setAnimationDuration:0.5];
    
    // Do Animation
    if (toggleBrush == YES) {
        
        brushSizeScroll.center = CGPointMake(20, 700);
        toggleBrush = NO;
    }
    else 
    {
        brushSizeScroll.center = CGPointMake(20, 1400);
        toggleBrush = YES; 
    }
    
    [UIView commitAnimations];
}

-(void)toggleSticker
{
    [UIView beginAnimations:@"toggleSticker" context:nil];
    [UIView setAnimationDuration:0.5];
    
    // Do Animation
    if (toggleSticker == YES) {
        
        stickerScroll.center = CGPointMake(700, 490);
        toggleSticker = NO;
    }
    else 
    {
        stickerScroll.center = CGPointMake(700, -490);
        toggleSticker = YES; 
    }
    
    [UIView commitAnimations];
}

-(void)selectColor:(ColorButton *)button
{
    currentColor = button.color ;
}

-(void)selectBrushSize:(BrushButton *)button
{
    currentBrushSize = button.brushSize;
}

-(void)selectSticker:(StickerButton *)button
{
    // add sticker to the frame middle //
    NSString *imgName = [NSString stringWithFormat:@"kitty%i.jpg", button.index];
    UIImage *img = [UIImage imageNamed:imgName];
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    //iv.frame = CGRectMake(drawImageView.center.x, drawImageView.center.y, 100, 100);
    iv.frame = CGRectMake(arc4random() % 600, arc4random() % 800, 100, 100);
    iv.userInteractionEnabled = YES;
    [self.view addSubview:iv];
}

// Touching
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	
	// Retrieve the touch point
	CGPoint pt = [[touches anyObject] locationInView:drawImageView];
	//CGPoint pt = [touch locationInView:self.view];
	
    startPoint = pt;
    lastPoint = [touch locationInView:drawImageView];
    
    
    
	UIView * tempView = [touch view];
    
    if ( tempView == self.view )
    {
        NSLog(@"self");
    }
    
  
    
    
    if (tempView.superview == self.view)
    {
        NSLog(@"image");
    }
    
    // Get startin point offset based on center of object
    startX = pt.x - tempView.center.x;        
    startY = pt.y - tempView.center.y;
    
    // Adjust the point
    pt.x = pt.x - startX;
    pt.y = pt.y - startY;
    
	// Set views center point
	tempView.center = pt;

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];	
    
    //CGPoint currentPoint = [touch locationInView:drawImageView];
    CGPoint currentPoint = [touch locationInView:drawImageView];
    
    UIView *tempView = [touch view];
    
    if ( tempView.superview == self.view) 
    {
        currentPoint.x = currentPoint.x - startX;
        currentPoint.y = currentPoint.y - startY;
        tempView.center = currentPoint;

        return;
    }
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [drawImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    
    // Set stroke size ,line color, cap style
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), currentBrushSize);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), currentColor.CGColor);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineJoinRound);//kCGLineCapRound
    
    
    // Begin & Move Line 
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    
    // add stroke
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    drawImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch *myTouch = [touches anyObject];
	CGPoint touchCenterPoint = [myTouch locationInView:drawImageView];
	UIView *tempView = [myTouch view];
	
	if ( tempView.superview == self.view) 
    {
        touchCenterPoint.x = touchCenterPoint.x - startX;
        touchCenterPoint.y = touchCenterPoint.y - startY;
        tempView.center = touchCenterPoint;  
        
        if( CGRectIntersectsRect(tempView.frame, trashiv.frame))
        {
            [tempView removeFromSuperview];
        }
    }
    

}


@end
