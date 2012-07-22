//
//  Movie.h
//  Movie2
//
//  Created by Sukman Har on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
{
    NSString *Name;
    NSString *Year;
    NSString *Link;
    NSString *Rating;
    NSString *Img;
    int Tag;
    
    BOOL Favorite;
}

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *Year;
@property (nonatomic, copy) NSString *Link;
@property (nonatomic, copy) NSString *Rating;
@property (nonatomic, copy) NSString *Img;
@property  BOOL Favorite;
@property  int Tag;


-(id)initWithName: (NSString *) name 
             Year: (NSString *) year 
             Link: (NSString *) link 
           Rating: (NSString *) rating
              Img: (NSString *) img
         Favorite: (BOOL) favorite
              Tag: (int) tag
;
@end
