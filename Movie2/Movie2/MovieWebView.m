//
//  MovieWebView.m
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieWebView.h"
#import "MovieWebViewController.h"
#import "Movie.h"

@implementation MovieWebView

- (id)initWithFrame:(CGRect)frame Movie: (Movie *) m Controller: (MovieWebViewController *) mvc
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        self.backgroundColor = [UIColor whiteColor];
        selectedMovie = m;
        moviemvc = mvc;
        
        UIWebView *webView =
		[[UIWebView alloc] initWithFrame: self.frame];

        NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@", selectedMovie.Link]];
        
        //webView.delegate= self;
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [self addSubview:webView];
         
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
