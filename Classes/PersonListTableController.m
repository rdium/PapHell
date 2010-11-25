
#import "PersonListTableController.h"


@implementation PersonListTableController

@synthesize filkrContext;
@synthesize filkrFetchedResultsController;

//Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
-(id)initWithStyle :(UITableViewStyle)style 
{
    if (self = [super initWithStyle:style]) 
	{
		filkrFetcher = [FFetcher sharedInstance];
		filkrContext = [filkrFetcher managedObjectContext];
		filkrFetchedResultsController = [filkrFetcher fetchedResultsControllerForEntity:@"Person" withPredicate:nil];
		
		
	}    return self;
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
    // Set the title.
    self.title = @"Photos";
	
	NSError *error;
	[filkrFetchedResultsController performFetch:&error];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView :(UITableView *)tableView 
{
	NSInteger size = 0;
	size = [[filkrFetchedResultsController sections] count];
	
	if (size == 0) {
		size = 1;
	}
    return size;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
	{
		
		NSArray *sections = [filkrFetchedResultsController sections];
		NSInteger counter = 0;
		
		if ([sections count])
		{
			id <NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
			counter = [sectionInfo numberOfObjects];
		}
		
		
		return counter;
	
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
	
	{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	
		Person *person = (Person *)[filkrFetchedResultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = [person user];
    
    //IF i wanted to select which image to display...
	/*
	 NSSet *photos = [person photos];
	 NSEnumerator *enumr = [photos objectEnumerator];
	 Photo *image = [enumr nextObject];
	 
	 NSLog(@"Person Name: %@", [person userName]);	 
	 while (image != nil) 
	 {		
	 NSLog(@"Do something with Person Image: %@", [image imageURL]);	
	 image = [enumr nextObject];
	 } */
	
	//More elegant way of the above enumeration, but with a random selection...
	NSSet *photoSet = [person owns];
	Photo *image = [photoSet anyObject];
	cell.imageView.image = [UIImage imageNamed:[image path]];
		
		NSLog(@"Image name:%@",[image path]);
	
    [image release];	
    return [cell autorelease];
	
}


#pragma mark -
#pragma mark Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	photoList = [[PhotoListTableController alloc] initWithStyle :UITableViewStylePlain];
	Person *person = [filkrFetchedResultsController objectAtIndexPath:indexPath];
	
	[photoList setPerson :person];
	[photoList setTitle :[[person user] stringByAppendingString:@"'s Photos"]];
	
	[self.navigationController pushViewController:photoList animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	
}


- (void)dealloc {
	
	[filkrContext release];
	
	[photoList release];
	
	[super dealloc];
}


@end

