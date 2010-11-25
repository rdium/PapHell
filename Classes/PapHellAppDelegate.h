

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class FFetcher;

@interface PapHellAppDelegate : NSObject <UIApplicationDelegate> {
	
	FFetcher *filkrFetcher;
	NSManagedObjectContext *filkrContext;
	
	UITabBarController *tab;
	UINavigationController *nC1;
	UINavigationController *nC2;
	
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


-(void)populateCoreDataStorage;

-(NSString *)applicationDocumentsDirectory;



@end



