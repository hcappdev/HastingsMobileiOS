//
//  SodexoViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "SodexoViewController.h"
#import "IIViewDeckController.h"

@interface SodexoViewController ()


@end



@implementation SodexoViewController

@synthesize mealSegment         = _mealSegment;
@synthesize mealTableView       = _mealTableView;
@synthesize allMenuItems        = _allMenuItems;
@synthesize didRetrieveItems    = _didRetrieveItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mealTableView.delegate     = self;
    self.mealTableView.dataSource   = self;
    self.didRetrieveItems = false;
    
    [self.mealSegment addTarget:self action:@selector(selectMeal:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(populateMenuItems)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Dining Hall";
    
    self.menuItems = [[NSMutableArray alloc] init];
    self.allMenuItems = [[NSMutableArray alloc] init];
    [self populateMenuItems];
    if (!self.didRetrieveItems) {
        UIAlertView *alert      = [[UIAlertView alloc] initWithTitle:@"No Menu Today" message:@"There is no menu for today" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.menuItems.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"SodexoTableViewCell";
    
    SodexoModel * item = [self.menuItems objectAtIndex:indexPath.row];
    SodexoTableViewCell *cell = (SodexoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SodexoTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    [cell bindCellDetails:item];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SodexoModel *model = [self.menuItems objectAtIndex:indexPath.row];
    NutritionViewController *detailViewController = [[NutritionViewController alloc] initWithSodexoModel:model];

    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void) populateMenuItems{
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://forms.hastings.edu/Apps/menu.xml"]];
    [parser setDelegate:self];
    
    [parser parse];
    [self refreshTableView:self.mealSegment.selectedSegmentIndex];
    
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
    
    
    NSDateFormatter *df                 = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedCurrentDate      = [df stringFromDate:[NSDate date]];
    //NSString *testDate                  = @"2014-05-05";

    if ( [elementName isEqualToString:@"weeklymenu"]){

        SodexoModel * menuItem      = [[SodexoModel alloc] init];
        NSString *menuDate          = [attributeDict valueForKey:@"menudate"];
        
        if ([formattedCurrentDate isEqualToString:menuDate]) {
        menuItem.itemName           = [attributeDict valueForKey:@"item_name"];
        menuItem.itemDescription    = [attributeDict valueForKey:@"item_desc"];
        menuItem.calories           = [attributeDict valueForKey:@"calories"];
        menuItem.fat                = [attributeDict valueForKey:@"fat"];
        menuItem.saturatedFat       = [attributeDict valueForKey:@"satfat"];
        menuItem.sodium             = [attributeDict valueForKey:@"sodium"];
        menuItem.carbohydrates      = [attributeDict valueForKey:@"carbo"];
        menuItem.sugars             = [attributeDict valueForKey:@"sugars"];
        menuItem.proteins           = [attributeDict valueForKey:@"protein"];
        menuItem.mealType           = [attributeDict valueForKey:@"meal"];
        menuItem.day                = [attributeDict valueForKey:@"dayname"];
        menuItem.allergens          = [attributeDict valueForKey:@"allergens"];
        menuItem.serving            = [attributeDict valueForKey:@"serv_size"];
        menuItem.fatDV              = [attributeDict valueForKey:@"fat_pct_dv"];
        menuItem.calContentFat      = [attributeDict valueForKey:@"calfat"];
        menuItem.saturatedFatDV     = [attributeDict valueForKey:@"satfat_pct_dv"];
        menuItem.transFat           = [attributeDict valueForKey:@"transfat"];
        menuItem.cholesterol        = [attributeDict valueForKey:@"chol"];
        menuItem.cholesterolDV      = [attributeDict valueForKey:@"chol_pct_dv"];
        menuItem.carbohydratesDV    = [attributeDict valueForKey:@"carbo_pct_dv"];
        menuItem.fiber              = [attributeDict valueForKey:@"dfib"];
        menuItem.fiberDV            = [attributeDict valueForKey:@"dfib_pct_dv"];
        menuItem.vitaminA           = [attributeDict valueForKey:@"vita_pct_dv"];
        menuItem.vitaminC           = [attributeDict valueForKey:@"vitc_pct_dv"];
        menuItem.calcium            = [attributeDict valueForKey:@"calcium_pct_dv"];
        menuItem.ironDV             = [attributeDict valueForKey:@"iron_pct_dv"];
        menuItem.ingredients        = [attributeDict valueForKey:@"ingredient"];
        menuItem.menuDate           = [attributeDict valueForKey:@"menudate"];
        
        self.didRetrieveItems       = true;
        }

        [self.allMenuItems addObject:menuItem];
    }
}

-(void) selectMeal:(id) sender{
    UISegmentedControl * control = (UISegmentedControl *) sender;
    
    switch (control.selectedSegmentIndex) {
        case 0:
            [self filterBreakfast];
            break;
        case 1:
            [self filterLunch];
            break;
        case 2:
            [self filterDinner];
            break;
        default:
            break;
    }
}

-(NSMutableArray *) filterBreakfast{
    NSPredicate * filterPredicateMeal   = [NSPredicate predicateWithFormat:@"mealType==%@", @"Breakfast"];
    NSArray * filter                    = [self.allMenuItems filteredArrayUsingPredicate:filterPredicateMeal];
    self.menuItems                      = [NSMutableArray arrayWithArray:filter];
    [self.mealTableView reloadData];
    
    return nil;
}

-(NSMutableArray *) filterLunch{
    NSPredicate * filterPredicate   = [NSPredicate predicateWithFormat:@"mealType==%@", @"Lunch"];
    NSArray * filter                = [self.allMenuItems filteredArrayUsingPredicate:filterPredicate];
    self.menuItems                  = [NSMutableArray arrayWithArray:filter];
    [self.mealTableView reloadData];
    
    return nil;
}

-(NSMutableArray *) filterDinner{
    NSPredicate * filterPredicate   = [NSPredicate predicateWithFormat:@"mealType==%@", @"Dinner"];
    NSArray * filter                = [self.allMenuItems filteredArrayUsingPredicate:filterPredicate];
    self.menuItems                  = [NSMutableArray arrayWithArray:filter];
    [self.mealTableView reloadData];
    
    return nil;
}

-(void) refreshTableView:(int)selectedIndex {
    switch (selectedIndex) {
        case 0:
            [self filterBreakfast];
            break;
            
        case 1:
            [self filterLunch];
            break;
            
        case 2:
            [self filterDinner];
            break;
            
        default:
            break;
    }
}

//google analytics
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.screenName = @"Dining Hall";
}
@end
