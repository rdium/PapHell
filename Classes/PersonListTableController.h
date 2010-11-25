

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "FFetcher.h"
#import "PhotoListTableController.h"
#import "Person.h"
#import "Photo.h"


@interface PersonListTableController : UITableViewController {
		
	FFetcher *filkrFetcher;
	
	NSManagedObjectContext *filkrContext;

	NSFetchedResultsController *filkrFetchedResultsController;
	
	PhotoListTableController *photoList;
	
}

@property (nonatomic, retain) NSManagedObjectContext *filkrContext;
@property (nonatomic, retain) NSFetchedResultsController *filkrFetchedResultsController;

@end
