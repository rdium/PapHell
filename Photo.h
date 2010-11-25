

#import <CoreData/CoreData.h>


@interface Photo :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject * belongs;

@end



