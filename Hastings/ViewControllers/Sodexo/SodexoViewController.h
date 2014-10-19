//
//  SodexoViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>
#import "SodexoTableViewCell.h"
#import "NutritionViewController.h"

#import "GAITrackedViewController.h"

@interface SodexoViewController : GAITrackedViewController <NSXMLParserDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) NSMutableArray *allMenuItems;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mealSegment;
@property (strong, nonatomic) IBOutlet UITableView *mealTableView;
@property BOOL didRetrieveItems;

@end
