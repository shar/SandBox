//
//  MovieWebViewController.h
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieWebViewController : UIViewController
{
    Movie *selectedMovie;
}

- (id)initWithMovie: (Movie *) m;
@end
