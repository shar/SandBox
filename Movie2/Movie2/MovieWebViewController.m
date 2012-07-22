//
//  MovieWebViewController.m
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieWebViewController.h"
#import "Movie.h"
#import "MovieWebView.h"

@implementation MovieWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMovie: (Movie *) m
{
    self = [super initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    if ( self )
    {
        selectedMovie = m;
        
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@", selectedMovie.Link]];
    
    NSData *data = [NSData dataWithContentsOfURL: url];
    
    if (data == nil) 
    {
        NSLog(@"could not load URL %@", url);
        return;
    }
    
    UIWebView *webView =
    [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
    webView.scalesPageToFit = NO;	
    webView.contentMode = UIViewContentModeRedraw;
    
    [webView loadData: data
             MIMEType: @"text/html"
     textEncodingName: @"NSUTF8StringEncoding"
              baseURL: url
     ];
    
    webView.alpha = 0;
    self.view = webView;
 
}
*/

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[MovieWebView alloc] initWithFrame: frame Movie:selectedMovie Controller:self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
