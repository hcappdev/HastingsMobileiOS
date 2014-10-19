//
//  MenuViewController.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//


#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "AboutViewController.h"
#import "AthleticsViewController.h"
#import "BroncoBoardViewController.h"
#import "MapViewController.h"
#import "ContactsTableViewController.h"
#import "SodexoViewController.h"
#import "TwitterViewController.h"
#import "CalendarTableViewController.h"

@interface MenuViewController : UITableViewController

@property (strong, nonatomic) HomeViewController            *homeViewController;
@property (strong, nonatomic) AboutViewController           *aboutViewController;
@property (strong, nonatomic) BroncoBoardViewController     *broncoBoardViewController;
@property (strong, nonatomic) MapViewController             *mapViewController;
@property (strong, nonatomic) AthleticsViewController       *athleticsViewController;
@property (strong, nonatomic) ContactsTableViewController   *contactsTableViewController;
@property (strong, nonatomic) SodexoViewController          *sodexoViewController;
@property (strong, nonatomic) TwitterViewController         *twitterViewController;
@property (strong, nonatomic) CalendarTableViewController   *calendarTableViewController;

@end
