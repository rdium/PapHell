

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "FFetcher.h"
#import "Person.h"
#import "Photo.h"
#import "PhotoDetailViewController.h"


@interface PhotoListTableController : UITableViewController {
	
	NSManagedObjectContext *filkrContext;
	NSFetchedResultsController *filkrFetchedResultsController;
	
	Person *person;
	
	PhotoDetailViewController *selPhotoView;
}

@property (nonatomic, retain) NSManagedObjectContext *filkrContext;
@property (nonatomic, retain) Person *person;

@end
