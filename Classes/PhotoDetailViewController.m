
#import "PhotoDetailViewController.h"


@implementation PhotoDetailViewController

@synthesize indexArray;

- (void)foo:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Nothing to add" message:@"Sorry, try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		photoArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"joshPhoto1.jpg"],[UIImage imageNamed:@"joshPhoto2.jpg"],[UIImage imageNamed:@"alPhoto3.jpg"],nil];
		
		
    }
    return self;
}




/*
- (void)loadView 

{
	


self.view =photoView;

//The view controller now owns the view 
[photoView release];
	
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	photoView = [[UIImageView alloc]initWithImage:[photoArray objectAtIndex:indexArray]];
	
	self.view = photoView; 
	
	[photoView release];
	
	NSLog(@"%d", indexArray);
	
	
	UIBarButtonItem *fooButton = [[UIBarButtonItem alloc] initWithTitle:@"Foo"
																  style:UIBarButtonItemStyleBordered 
																 target:self 
																 action:@selector(foo:)]; 
	
	self.navigationItem.rightBarButtonItem = fooButton; 
	
	[fooButton release];
	
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

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[photoArray release];
    [super dealloc];
}


@end
