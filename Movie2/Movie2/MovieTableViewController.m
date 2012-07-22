//
//  MovieTableViewController.m
//  Movie2
//
//  Created by Sukman Har on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Movie.h"
#import "MovieDetailViewController.h"
#import "Data.h"

@implementation MovieTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    
    
    if (self) 
    {
        // setting the data //
        
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.parentViewController.navigationController.navigationBarHidden = YES;
    self.title =@"Movie List";
    
    movieArray = [Data sharedInstance].movieArray;
    /*
    movieArray = [NSMutableArray arrayWithObjects:
                  
                  [[Movie alloc] initWithName:@"Pride & Prejudice" Year:@"2005" Link:@"http://www.imdb.com/title/tt0414387/" Rating:@"7.8" Img:@"pride.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Avatar" Year:@"2009" Link:@"http://www.imdb.com/title/tt0499549/" Rating:@"8.0" Img:@"avatar.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Before Sunset" Year:@"2004" Link:@"http://www.imdb.com/title/tt0381681/" Rating:@"8.0" Img:@"beforesunset.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Departures" Year:@"2008" Link:@"http://www.imdb.com/title/tt1069238/" Rating:@"8.1" Img:@"departures.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"When Harry met Sally" Year:@"1989" Link:@"http://www.imdb.com/title/tt0098635/" Rating:@"7.6" Img:@"harrysally.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"You've Got Mail" Year:@"1998" Link:@"http://www.imdb.com/title/tt0128853/" Rating:@"6.3" Img:@"mail.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Persuasion" Year:@"1995" Link:@"http://www.imdb.com/title/tt0114117/" Rating:@"7.6" Img:@"persuasion.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Sense and Sensibility" Year:@"1995" Link:@"http://www.imdb.com/title/tt0114388/" Rating:@"7.7" Img:@"sense.jpg" Favorite:NO],
                  
                  [[Movie alloc] initWithName:@"Sleepless in Seattle" Year:@"1993" Link:@"http://www.imdb.com/title/tt0108160/" Rating:@"6.7" Img:@"sleepless.jpg" Favorite:NO],
                  
                  
                  [[Movie alloc] initWithName:@"Before Sunrise" Year:@"1995" Link:@"http://www.imdb.com/title/tt0112471/" Rating:@"8.0" Img:@"beforesunrise.jpg" Favorite:NO],
                  
                  nil];
    
    NSLog(@"%i", [movieArray count]);
    */
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.parentViewController.navigationController.navigationBarHidden = NO;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [movieArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Movie";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Movie *m = [movieArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = m.Name;
	NSString *fileName = m.Img;
	cell.imageView.image = [UIImage imageNamed: fileName];	
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    Movie *m = [movieArray objectAtIndex:indexPath.row];
    
    MovieDetailViewController *detailViewController = [[MovieDetailViewController alloc] initWithMovie:m];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
