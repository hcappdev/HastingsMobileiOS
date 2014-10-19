//
//  CalendarTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "CalendarTableViewController.h"
#import "IIViewDeckController.h"
#import "EventModel.h"
#import "EventInfoModel.h"

#import "GAIDictionaryBuilder.h"


@interface CalendarTableViewController ()

@end

@implementation CalendarTableViewController

@synthesize eventInfo   = _eventInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *menuButton     = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    UIBarButtonItem *refreshButton  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClicked)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    self.title = @"Campus Events";
    
    [self loadInitialView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{ 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CalendarTableViewCell";
 
    CalendarModel * calendarItem = [self.eventInfo objectAtIndex:indexPath.row];
    CalendarTableViewCell *cell = (CalendarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
    if(cell == nil){
 
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CalendarTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell bindCellDetails:calendarItem];
 
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendarModel *model = [self.eventInfo objectAtIndex:indexPath.row];
    
    EventDetailViewTableViewController *detailViewController = [[EventDetailViewTableViewController alloc] initWithEventModel:model];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}


-(NSMutableArray *) getEventInfo{
    
    NSString *urlString             = @"https://dl.dropboxusercontent.com/s/5vfwlsep6axr823/campus_events.json";
    NSURL *url                      = [NSURL URLWithString:urlString];
    NSData *eventData               = [NSData dataWithContentsOfURL:url];
    
    id response                     = [NSJSONSerialization JSONObjectWithData:eventData options:NSJSONReadingMutableContainers error: nil];
    NSDictionary *results           = response;

    NSMutableArray *allEventsList   = [[NSMutableArray alloc] init];
    NSDictionary *calendarList      = [results objectForKey:@"Events"];
    
    NSArray *eventInfoList          = [[NSArray alloc] init];
    
    for (NSDictionary *calendarItem in calendarList) {
        
        CalendarModel *mainCalendarItem = [[CalendarModel alloc] init];
        mainCalendarItem.eventModels    = [[NSMutableArray alloc] init];
        
        mainCalendarItem.eventName          = [calendarItem valueForKey:@"event"];
        mainCalendarItem.eventWeek          = [calendarItem valueForKey:@"event_week"];
        
        eventInfoList                       = [calendarItem valueForKey:@"event_info"];
        
        for (NSDictionary *eventInfoItem in eventInfoList) {
            
            EventModel *eventModel              = [[EventModel alloc] init];
            eventModel.eventInfoModelList       = [[NSMutableArray alloc] init];
           
            eventModel.eventDay                 = [eventInfoItem valueForKey:@"event_day"];
            NSDictionary *eventsOfDayList       = [eventInfoItem objectForKey:@"events_of_day"];
            
            for (NSDictionary *eventOfDayItem in eventsOfDayList) {
                
                EventInfoModel * eventInfoModel = [[EventInfoModel alloc] init];
                
                eventInfoModel.eventTitle       = [eventOfDayItem valueForKey:@"event_title"];
                eventInfoModel.eventLocation    = [eventOfDayItem valueForKey:@"event_location"];
                eventInfoModel.eventTime        = [eventOfDayItem valueForKey:@"event_time"];
                
                [eventModel.eventInfoModelList addObject:eventInfoModel];
            }
            
            [mainCalendarItem.eventModels addObject:eventModel];
        }
        
        [allEventsList addObject:mainCalendarItem];
        
    }
    
    return allEventsList;
}

-(void)loadInitialView{

    self.eventInfo = [[NSMutableArray alloc] init];
    self.eventInfo = [self getEventInfo];
    [self.tableView reloadData];
}

//add spinner UX
-(void)buttonItemClicked{
    [self loadInitialView];
}

//google analytics
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    id<GAITracker> tracker  = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Campus Events"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}
@end
