//
//  Data.m
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Movie.h"

@implementation Data
@synthesize movieArray;


+ (Data *)sharedInstance
{
    // the instance of this class is stored here
    static Data *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) 
    {
        myInstance  = [[[self class] alloc] init];
    }

    // return the instance of this class
    return myInstance;
}


-(id) init 
{
	if (self=[super init]) {

        movieArray = [NSMutableArray arrayWithObjects:
                      
                      [[Movie alloc] initWithName:@"Pride & Prejudice" Year:@"2005" Link:@"http://www.imdb.com/title/tt0414387/" Rating:@"7.8" Img:@"pride.jpg" Favorite:NO Tag: 0],
                      
                      [[Movie alloc] initWithName:@"Avatar" Year:@"2009" Link:@"http://www.imdb.com/title/tt0499549/" Rating:@"8.0" Img:@"avatar.jpg" Favorite:NO Tag: 1],
                      
                      [[Movie alloc] initWithName:@"Before Sunset" Year:@"2004" Link:@"http://www.imdb.com/title/tt0381681/" Rating:@"8.0" Img:@"beforesunset.jpg" Favorite:NO Tag: 2],
                      
                      [[Movie alloc] initWithName:@"Departures" Year:@"2008" Link:@"http://www.imdb.com/title/tt1069238/" Rating:@"8.1" Img:@"departures.jpg" Favorite:NO Tag: 3],
                      
                      [[Movie alloc] initWithName:@"When Harry met Sally" Year:@"1989" Link:@"http://www.imdb.com/title/tt0098635/" Rating:@"7.6" Img:@"harrysally.jpg" Favorite:NO Tag: 4],
                      
                      [[Movie alloc] initWithName:@"You've Got Mail" Year:@"1998" Link:@"http://www.imdb.com/title/tt0128853/" Rating:@"6.3" Img:@"mail.jpg" Favorite:NO Tag: 5],
                      
                      [[Movie alloc] initWithName:@"Persuasion" Year:@"1995" Link:@"http://www.imdb.com/title/tt0114117/" Rating:@"7.6" Img:@"persuasion.jpg" Favorite:NO Tag: 6],
                      
                      [[Movie alloc] initWithName:@"Sense and Sensibility" Year:@"1995" Link:@"http://www.imdb.com/title/tt0114388/" Rating:@"7.7" Img:@"sense.jpg" Favorite:NO Tag: 7],
                      
                      [[Movie alloc] initWithName:@"Sleepless in Seattle" Year:@"1993" Link:@"http://www.imdb.com/title/tt0108160/" Rating:@"6.7" Img:@"sleepless.jpg" Favorite:NO Tag: 8],
                      
                      
                      [[Movie alloc] initWithName:@"Before Sunrise" Year:@"1995" Link:@"http://www.imdb.com/title/tt0112471/" Rating:@"8.0" Img:@"beforesunrise.jpg" Favorite:NO Tag: 9],
                      
                      nil];
        
        favoriteMovieArray = [[NSMutableArray alloc] init];
	}
    
	return self;
}
#pragma mark access to app delegate etc.
+ (AppDelegate *) sharedAppDelegate; {
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}
@end
