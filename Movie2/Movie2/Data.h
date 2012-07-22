//
//  Data.h
//  Movie2
//
//  Created by Sukman Har on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "AppDelegate.h"

@interface Data : NSObject
{
    // global variables here
    NSMutableArray *movieArray;
    NSMutableArray *favoriteMovieArray;
}

@property(nonatomic,retain) NSMutableArray *movieArray;
@property(nonatomic,retain) NSMutableArray *favoriteMovieArray;

// message from which our instance is obtained
+ (Data *)sharedInstance;

+ (AppDelegate *) sharedAppDelegate;
@end
