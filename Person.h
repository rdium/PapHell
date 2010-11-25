

#import <CoreData/CoreData.h>

@class Photo;

@interface Person :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSSet* owns;

@end


@interface Person (CoreDataGeneratedAccessors)
- (void)addOwnsObject:(Photo *)value;
- (void)removeOwnsObject:(Photo *)value;
- (void)addOwns:(NSSet *)value;
- (void)removeOwns:(NSSet *)value;

@end

