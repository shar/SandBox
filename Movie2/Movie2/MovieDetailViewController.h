//
//  MovieDetailViewController.h
//  Movie2
//
//  Created by Sukman Har on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailViewController : UIViewController
{
    Movie *selectedMovie;
}

- (id)initWithMovie: (Movie *) m;

@end


