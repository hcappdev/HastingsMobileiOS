//
//  ContactsTableViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "ContactsTableViewController.h"
#import "IIViewDeckController.h"
#import "ContactsModel.h"
#import "ContactsTableViewCell.h"

#import "GAIDictionaryBuilder.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

@synthesize contactInfo = _contactInfo;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Campus Contacts";
    
    self.contactInfo = [[NSMutableArray alloc] init];
    [self getContactInfo];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ContactsTableViewCell";
    
    ContactsModel * item = [self.contactInfo objectAtIndex:indexPath.row];
    ContactsTableViewCell *cell = (ContactsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ContactsTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    [cell bindCellDetails:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactsModel * contactItem = [self.contactInfo objectAtIndex:indexPath.row];
    NSString * phoneNumber      = [@"tel://" stringByAppendingString: contactItem.contactNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

-(NSMutableArray *) getContactInfo{
    NSMutableArray * contactInfo    = [[NSMutableArray alloc] init];
    
    NSString *urlString             = @"https://dl.dropboxusercontent.com/s/cs6lh1ucca4xcq1/contact-info.json";
    NSURL *url                      = [NSURL URLWithString:urlString];
    NSData *eventData               = [NSData dataWithContentsOfURL:url];
    id response                     = [NSJSONSerialization JSONObjectWithData:eventData options:NSJSONReadingMutableContainers error: nil];
    NSDictionary *results           = response;
    NSDictionary *contactList       = [results objectForKey:@"Contacts"];

    for (NSDictionary * contacts in contactList) {
        
        ContactsModel * contactInfo     = [[ContactsModel alloc] init];
        
        contactInfo.contactName     = [contacts objectForKey:@"contact_name"];
        contactInfo.contactNumber   = [contacts objectForKey:@"contact_number"];
        
        [self.contactInfo addObject:contactInfo];
        
    }
    return contactInfo;
}

//google analytics
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    id<GAITracker> tracker  = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Campus Contacts"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
}

@end
