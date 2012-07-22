//
//  MovieWebView.h
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieWebViewController.h"
#import "Movie.h"

@interface MovieWebView : UIView
{
    Movie *selectedMovie;
    MovieWebViewController *moviemvc;
}

- (id)initWithFrame:(CGRect)frame Movie: (Movie *) m Controller: (MovieWebViewController *) mvc;

@end
