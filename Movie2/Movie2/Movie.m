//
//  Movie.m
//  Movie2
//
//  Created by Sukman Har on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Movie.h"

@implementation Movie

@synthesize Name;
@synthesize Year;
@synthesize Link;
@synthesize Rating;
@synthesize Img;
@synthesize Favorite;
@synthesize Tag;

-(id)initWithName: (NSString *) name 
             Year: (NSString *) year 
             Link: (NSString *) link 
           Rating: (NSString *) rating
              Img: (NSString *) img
         Favorite: (BOOL) favorite
              Tag: (int) tag

{
    Name = name;
    Year = year;
    Link = link;
    Rating = rating;
    Img = img;
    Favorite = favorite;
    Tag = tag;
    
    return self;
}
@end
