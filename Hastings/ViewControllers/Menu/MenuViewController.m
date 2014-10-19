//
//  MenuViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "MenuViewController.h"
#import "IIViewDeckController.h"

@implementation MenuViewController

@synthesize homeViewController          = _homeViewController;
@synthesize aboutViewController         = _aboutViewController;
@synthesize athleticsViewController     = _athleticsViewController;
@synthesize mapViewController           = _mapViewController;
@synthesize broncoBoardViewController   = _broncoBoardViewController;
@synthesize contactsTableViewController = _contactsTableViewController;
@synthesize sodexoViewController        = _sodexoViewController;
@synthesize twitterViewController       = _twitterViewController;
@synthesize calendarTableViewController = _calendarTableViewController;


- (void) initViewControllers{

    self.homeViewController             = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.aboutViewController            = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    self.athleticsViewController        = [[AthleticsViewController alloc] initWithNibName:@"AthleticsViewController" bundle:nil];
    self.broncoBoardViewController      = [[BroncoBoardViewController alloc] initWithNibName:@"BroncoBoardViewController" bundle:nil];
    self.mapViewController              = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    self.contactsTableViewController    = [[ContactsTableViewController alloc] initWithNibName:@"ContactsTableViewController" bundle:nil];
    self.sodexoViewController           = [[SodexoViewController alloc] initWithNibName:@"SodexoViewController" bundle:nil];
    self.twitterViewController          = [[TwitterViewController alloc] initWithNibName:@"TwitterViewController" bundle:nil];
    self.calendarTableViewController    = [[CalendarTableViewController alloc] initWithNibName:@"CalendarTableViewController" bundle:nil];
}

#pragma mark - Display methods

- (void) displayHomeViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];;
}

- (void) displayAboutViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewController];
}

- (void) displayAthleticsViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.athleticsViewController];
}

- (void) displayMapViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.mapViewController];
}

- (void) displayBroncoBoardViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.broncoBoardViewController];
}

- (void) displayContactsViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.contactsTableViewController];
}
- (void) displaySodexoViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.sodexoViewController];
}
- (void) displayTwitterViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.twitterViewController];
}

- (void) displayCalendarViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.calendarTableViewController];
}

- (void) viewDidLoad{
    
    [self initViewControllers];
}

- (void) closeMenu{
    
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        
        [NSThread sleepForTimeInterval:(300+arc4random()%700)/1000000.0];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
            
        case 0:
            break;
            
        case 1:
            [self displayHomeViewController];
            break;
            
        case 2:
            [self displayAthleticsViewController];
            break;
            
        case 3:
            [self displayMapViewController];
            break;
            
        case 4:
            [self displayBroncoBoardViewController];
            break;
            
        case 5:
            [self displaySodexoViewController];
            break;
            
        case 6:
            [self displayCalendarViewController];
            break;
            
        case 7:
            [self displayTwitterViewController];
            break;
            
        case 8:
            [self displayContactsViewController];
            break;
            
        case 9:
            [self displayAboutViewController];
            break;
            
        default:
            break;
    }
    [self closeMenu];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] init];
    }
    
    switch ( indexPath.row )
    {
        case 0:
            break;
            
        case 1:
            cell.textLabel.text = @"Home";
            break;
            
        case 2:
            cell.textLabel.text = @"Athletics";
            break;
            
        case 3:
            cell.textLabel.text = @"Campus Map";
            break;
            
        case 4:
            cell.textLabel.text = @"Broncoboard";
            break;
            
        case 5:
            cell.textLabel.text = @"Dining Hall";
            break;
            
        case 6:
            cell.textLabel.text = @"Campus Events";
            break;
            
        case 7:
            cell.textLabel.text = @"Twitter";
            break;
            
        case 8:
            cell.textLabel.text = @"Campus Contacts";
            break;
            
        case 9:
            cell.textLabel.text = @"About";
            break;
        
        default:
            cell.textLabel.text = @"Hastings";
            break;

    }
    return cell;
}

@end
