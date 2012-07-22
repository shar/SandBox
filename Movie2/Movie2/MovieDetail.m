//
//  MovieDetail.m
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieDetail.h"
#import "MovieDetailViewController.h"
#import "Movie.h"

@implementation MovieDetail

- (id)initWithFrame:(CGRect)frame Movie: (Movie *) m Controller: (MovieDetailViewController *) mvc
{
    self = [super initWithFrame:frame];
    
    if (self) 
    {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        selectedMovie = m;
        moviemvc = mvc;
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", m.Img]]];
        
        iv.frame = CGRectMake(40, 50, 214, 317);
        
        UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 400, 80, 40)];
        lb1.text = @"Name: ";
        
        UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 450, 80, 40)];
        lb2.text = @"Year: ";
        
        UILabel *lb3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 500, 80, 40)];
        lb3.text = @"Ratings: ";

        
        UILabel *lbName = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 200, 40)];
        lbName.text = [NSString stringWithFormat:@"%@", selectedMovie.Name];
        
        UILabel *lbYear = [[UILabel alloc] initWithFrame:CGRectMake(100, 450, 200, 40)];
        lbYear.text = [NSString stringWithFormat:@"%@", selectedMovie.Year];
        
        UILabel *lbRating = [[UILabel alloc] initWithFrame:CGRectMake(100, 500, 100, 40)];
        lbRating.text = [NSString stringWithFormat:@"%@", selectedMovie.Rating];

        [self addSubview:lb1];
        [self addSubview:lb2];
        [self addSubview:lb3];
        
        [self addSubview:lbName];
        [self addSubview:lbYear];
        [self addSubview:lbRating];
        
        [self addSubview:iv];
        
        UIButton *btnIMDB = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
        btnIMDB.frame = CGRectMake(40, 550, 200, 40);
        [btnIMDB setTitle:@"Load IMDB Page" forState:UIControlStateNormal];
        
        [btnIMDB addTarget: moviemvc
                   action: @selector(loadMovieWebView)
         forControlEvents: UIControlEventTouchUpInside
         ];

		[self addSubview: btnIMDB];
        
        //Create the segmented control.
        
		NSArray *items = [NSArray arrayWithObjects:
                          @"Yes",
                          @"No",
                          nil
                          ];
        
        UILabel *lb4 = [[UILabel alloc] initWithFrame:CGRectMake(50, 620, 500, 40)];
        lb4.text = @"Is this one of your favorite movie?";
        
        [self addSubview:lb4];
        
		UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems: items];
        
        [control addTarget: moviemvc
                    action: @selector(valueChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        
        control.center = CGPointMake(100, 700);
        
        if (selectedMovie.Favorite) 
        {
            control.selectedSegmentIndex = 0;
        }
        else 
        {
            control.selectedSegmentIndex = 1;
        }
        
        [self addSubview:control];
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
