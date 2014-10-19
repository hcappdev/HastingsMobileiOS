//
//  EventDetailViewTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/18/14.
//
//

#import "EventDetailViewTableViewController.h"
#import  "EventInfoModel.h"
#import "CalendarTableViewController.h"
#import "EventInfoTableViewController.h"

@interface EventDetailViewTableViewController ()

@end

@implementation EventDetailViewTableViewController

-(id)initWithEventModel:(CalendarModel *) calendarModel{
    
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        
        self.calendarModel = calendarModel;
    }
    return self;
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"EventTableViewCell";
    
    EventModel * item               = [self.calendarModel.eventModels objectAtIndex:indexPath.row];
    EventTableViewCell *cell        = (EventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell                        = [[[NSBundle mainBundle] loadNibNamed:@"EventTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell bindCellDetails:item];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.calendarModel.eventModels.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EventModel *eventInfoModelList                          = [self.calendarModel.eventModels objectAtIndex:indexPath.row];
    
    EventInfoTableViewController *detailInfoViewController  = [[EventInfoTableViewController alloc] initWithEventInfoModel:eventInfoModelList];
    
    [self.navigationController pushViewController:detailInfoViewController animated:YES];
}
    
    
    

@end
