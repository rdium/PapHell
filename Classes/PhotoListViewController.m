
#import "PhotoListViewController.h"
#import "PhotoDetailViewController.h"


@implementation PhotoListViewController


-(IBAction)viewPhListJosh1:(id)sender {
	
	PhotoDetailViewController *photoDetailVC = [[PhotoDetailViewController alloc] initWithNibName:@"PhotoDetailViewController" bundle:[NSBundle mainBundle]];
	
	photoDetailVC.title = @"Urban Disaster";
	
	[photoDetailVC setIndexArray:0];
	
	[self.navigationController pushViewController:photoDetailVC animated:YES];
	
	[photoDetailVC release];
	
	
}

-(IBAction)viewPhListJosh2:(id)sender {
	
	PhotoDetailViewController *photoDetailVC = [[PhotoDetailViewController alloc] initWithNibName:@"PhotoDetailViewController" bundle:[NSBundle mainBundle]];
	
	photoDetailVC.title = @"Concrete Pitwater";
	
	[photoDetailVC setIndexArray:1];
	
	
	
	[self.navigationController pushViewController:photoDetailVC animated:YES];
	
	[photoDetailVC release];
	
	
}

-(IBAction)viewPhListAl:(id)sender {
	

	
	
	PhotoDetailViewController *photoDetailVC = [[PhotoDetailViewController alloc] initWithNibName:@"PhotoDetailViewController" bundle:[NSBundle mainBundle]];
	
	photoDetailVC.title = @"Autumn Leaves";
	
	[photoDetailVC setIndexArray:2];
			
	[self.navigationController pushViewController:photoDetailVC animated:YES];
	
	[photoDetailVC release];
	
	
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
	
	if (self.title == @"Josh's Photos") {
		
		
		photoImgAl1.hidden = YES;
		
		photoNameAl1.hidden = YES;
		
		AlName1.hidden = YES;
		
		photoDetailAl1.hidden = YES;
		
	}
	
	if (self.title == @"Al's Photos") {
		
		
		photoImgJosh1.hidden = YES;
		
		photoNameJosh1.hidden = YES;
		
		JoshName1.hidden = YES;
		
		photoDetailJosh1.hidden = YES;
		
		
		photoImgJosh2.hidden = YES;
		
		photoNameJosh2.hidden = YES;
		
		JoshName2.hidden = YES;
		
		photoDetailJosh2.hidden = YES;
		
	}
	
		
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
	
	[photoImgJosh1 release];
	photoImgJosh1 = nil;
	[photoImgJosh2  release];
	photoImgJosh2 = nil;
	[photoImgAl1  release];	
	photoImgAl1 = nil;
	[photoNameJosh1  release];
	photoNameJosh1 = nil;
	[photoNameJosh2  release];
	photoNameJosh2  = nil;
	[photoNameAl1  release];
	photoNameAl1  = nil;
	[JoshName1  release];
	JoshName1 = nil;
	[JoshName2  release];
	JoshName2 = nil;
	[AlName1  release];	
	AlName1 = nil;
	[photoDetailJosh1  release]; 
	photoDetailJosh1 = nil;
	[photoDetailJosh2  release];
	photoDetailJosh2 = nil;
	[photoDetailAl1  release];
	photoDetailAl1  = nil;	
}


- (void)dealloc {
	
	[photoImgJosh1 release];
	[photoImgJosh2  release];
	[photoImgAl1  release];	
	[photoNameJosh1  release];
	[photoNameJosh2  release];
	[photoNameAl1  release];
	[JoshName1  release];
	[JoshName2  release];
	[AlName1  release];	
	[photoDetailJosh1  release]; 
	[photoDetailJosh2  release];
	[photoDetailAl1  release];
	
    [super dealloc];
}


@end
