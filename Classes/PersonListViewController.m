

#import "PersonListViewController.h"
#import "PhotoListViewController.h"


@implementation PersonListViewController

-(IBAction)viewPhListJosh:(id)sender {
	
	PhotoListViewController *photoList = [[PhotoListViewController alloc] initWithNibName:@"PhotoListViewController" bundle:[NSBundle mainBundle]];
	
	photoList.title = @"Josh's Photos";
	
	[self.navigationController pushViewController:photoList animated:YES];
	
	[photoList release];
	
	
}


-(IBAction)viewPhListAl:(id)sender {
	
	PhotoListViewController *photoList = [[PhotoListViewController alloc] initWithNibName:@"PhotoListViewController" bundle:[NSBundle mainBundle]];
	
	photoList.title = @"Al's Photos";
	
	[self.navigationController pushViewController:photoList animated:YES];
	
	[photoList release];
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	
	
	
		
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)viewDidUnload
{
	[super viewDidUnload];
		
	[joshPhList release];
	joshPhList = nil;
	
	[alPhList release];
	alPhList = nil;
	
		
}

- (void) dealloc
{
	[joshPhList release];
	[alPhList release];
	
	[super dealloc];
	
}
 
@end
