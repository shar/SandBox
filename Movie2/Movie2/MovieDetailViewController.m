//
//  MovieDetailViewController.m
//  Movie2
//
//  Created by Sukman Har on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "Movie.h"
#import "MovieDetail.h"
#import "MovieWebViewController.h"
#import "Data.h"

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (id)initWithMovie: (Movie *) m
{
    self = [super initWithNibName:nil bundle:[NSBundle mainBundle]];
    
    if ( self )
    {
        selectedMovie = m;
        
        self.title = selectedMovie.Name;
        //self.tabBarItem.image = image;
    
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[MovieDetail alloc] initWithFrame: frame Movie:selectedMovie Controller:self];
}

- (void) loadMovieWebView
{
    MovieWebViewController *webvc = [[MovieWebViewController alloc] initWithMovie:selectedMovie];
    
	//Create a navigation controller to make the infoController's navigation item
	//(containing the Done button) visible.
	
    [[self navigationController] pushViewController:webvc animated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    
    //iv.backgroundColor = [UIColor greenColor];
    
    //NSLog (@"%@", selectedMovie.Img);    
}


- (void)viewDidUnload
{
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    //[self.parentViewController.navigationController setNavigationBarHidden:YES animated:NO];
    
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    //[self.parentViewController.navigationController setNavigationBarHidden:NO animated:NO];

    [super viewWillDisappear:animated];
}

- (void) valueChanged: (id) sender {
	UISegmentedControl *control = sender;

    Movie *updateMovie = [Movie alloc];
    
	switch (control.selectedSegmentIndex) 
    {
		case 0:	// Yes
            NSLog(@"yes");
            NSLog(@"%i%@", selectedMovie.Tag, selectedMovie.Name);
            [updateMovie initWithName:selectedMovie.Name Year:selectedMovie.Year Link:selectedMovie.Link Rating:selectedMovie.Rating Img:selectedMovie.Img Favorite:YES Tag:selectedMovie.Tag];
            
            
			break;
            
		case 1:	// No
            NSLog(@"no");
            [updateMovie initWithName:selectedMovie.Name Year:selectedMovie.Year Link:selectedMovie.Link Rating:selectedMovie.Rating Img:selectedMovie.Img Favorite:NO Tag:selectedMovie.Tag];

            break;
            
            
		default: // No - do nothing //
			break;
	}
    
    [[Data sharedInstance].movieArray replaceObjectAtIndex:selectedMovie.Tag withObject:updateMovie];
}

@end
