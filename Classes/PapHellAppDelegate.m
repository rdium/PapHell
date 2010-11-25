#import "PapHellAppDelegate.h"

#import "PersonListTableController.h"
#import "PhotoListTableController.h"

#import "FFetcher.h"

#import "Person.h"
#import "Photo.h"

@implementation PapHellAppDelegate

@synthesize window;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    
	
	filkrFetcher = [FFetcher sharedInstance];
	
	//Check if you have CoreData DB to work with already, if not this process gets data from the plist and sticks it in the existing model.
	
	if (![filkrFetcher databaseExists]) 
		
	{
		[self populateCoreDataStorage];
		
	}
	else {
		
	filkrContext = [filkrFetcher managedObjectContext];
	}
	
	tab = [[UITabBarController alloc] init];
	
	nC1 =[[UINavigationController alloc] init];
	
	PersonListTableController *pTable = [[PersonListTableController alloc] initWithStyle:UITableViewStylePlain];
	
	pTable.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1] autorelease];
	
	// REQUIRED?
	//pTable.managedObjectContext = filkrContext;
	
	
	[nC1 pushViewController:pTable animated:NO];	
	
	[pTable release];
	
	nC2 =[[UINavigationController alloc] init];
	
	PhotoListTableController *phTable = [[PhotoListTableController alloc] initWithStyle:UITableViewStylePlain];
	
	phTable.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:2] autorelease];
	
	[nC2 pushViewController:phTable animated:NO];	
	
	[phTable release];
	
	
	NSArray *nCArray = [NSArray arrayWithObjects:nC1,nC2,nil];
	
	[tab setViewControllers:nCArray];
	
	[nC1 release];
	[nC2 release];
	
	[window addSubview:tab.view];
	
	
    [window makeKeyAndVisible];
	
	return YES;
}

-(void)populateCoreDataStorage
{ 
	//Check if you have CoreData DB to work with already, if not this process gets data from the plist and sticks it in the existing model.
	
	NSLog(@"No data in DB yet!");
	
	//Look in the documents directory for the plist file.
	NSString *plistPath;
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
															  NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"FakeData.plist"];
	
	//If the file isn't in the documents directory(a new/edited plist?) take a look in the existing bundle. 
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
		plistPath = [[NSBundle mainBundle] pathForResource:@"FakeData" ofType:@"plist"];
		
	}
	//Stick the plist into an array.
	NSArray *plistData = [NSArray arrayWithContentsOfFile:plistPath];		
	NSLog(@"NewArray:%@",plistData);
	
	filkrContext = [filkrFetcher managedObjectContext];
	
	//Create a new instance of the Photo and Person Entities to  entity.
	
	NSEnumerator *enumr = [plistData objectEnumerator];
	id curr = [enumr nextObject];
	NSMutableArray *names = [[NSMutableArray alloc] init];
	
	NSLog(@"NextObject in array enumeration:%@",curr);
	
	while (curr != nil)
		
	{
		
		Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:filkrContext];
		
		[photo setPath:[curr objectForKey:@"path"]];
		
		[photo setName:[curr objectForKey:@"name"]];
		
		
		
		//See if the name has already been set for a Person object...
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ IN %@", [curr objectForKey:@"user"], names];
		BOOL doesExist = [predicate evaluateWithObject:curr];
		
		if (doesExist == NO)
			
		{	
			Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:filkrContext];
			
			
			[person setUser:[curr objectForKey:@"user"]];
			
			
			[person addOwnsObject:photo];
			[photo setBelongs:person];
			
			NSLog(@"Person OBJECT: %@", person);
			[names addObject:[curr objectForKey:@"user"]];
			
		} else 
			
		{
			NSArray *objectArray = [filkrFetcher fetchManagedObjectsForEntity:@"Person" withPredicate:predicate];
			Person *person = [objectArray objectAtIndex:0];
			
			[photo setBelongs:person];
			NSLog(@"Person OBJECT which has a photo already: %@", person);
			//REQUIRED: Also require establishing the reciprocal relationship for Person entity?
			[objectArray release];
		}
		curr = [enumr nextObject];
	}
	[names release];
	
}




 //applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 
- (void)applicationWillTerminate:(UIApplication *)application 
{
    if (filkrContext != nil) 
	{
		if ([filkrContext hasChanges] == YES)
		{
			NSError *error = nil;
			BOOL isSaved = [filkrContext save:&error];
			NSLog(@"isSaved? %@", (isSaved ? @"YES":@"NO") );
			
			if (isSaved == NO)
			{
				NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
				abort();				
			}
		}
    }
}


#pragma mark -
#pragma mark Application's Documents directory


 //Returns the path to the application's Documents directory.
 
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	
	
	[filkrFetcher release];
    [filkrContext release];
	
	
	[tab release];
	
	
    [window release];
    [super dealloc];
}


@end