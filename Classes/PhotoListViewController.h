
#import <UIKit/UIKit.h>


@interface PhotoListViewController : UIViewController {

	
	IBOutlet UIImageView *photoImgJosh1;
	IBOutlet UIImageView *photoImgJosh2;
	IBOutlet UIImageView *photoImgAl1;
	
	IBOutlet UILabel *photoNameJosh1;
	IBOutlet UILabel *photoNameJosh2;
	IBOutlet UILabel *photoNameAl1;
	IBOutlet UILabel *JoshName1;
	IBOutlet UILabel *JoshName2;
	IBOutlet UILabel *AlName1;
	
	
	IBOutlet UIButton *photoDetailJosh1; 
	IBOutlet UIButton *photoDetailJosh2;
	IBOutlet UIButton *photoDetailAl1;
		
}

-(IBAction)viewPhListJosh1:(id)sender;

-(IBAction)viewPhListJosh2:(id)sender;

-(IBAction)viewPhListAl:(id)sender;


@end
