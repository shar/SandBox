//
//  MovieDetail.h
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailViewController.h"
#import "Movie.h"

@interface MovieDetail : UIView
{
    Movie *selectedMovie;
    MovieDetailViewController *moviemvc;
}

- (id)initWithFrame:(CGRect)frame Movie: (Movie *) m Controller: (MovieDetailViewController *) mvc;
@end
