//
//  EventDetailViewTableViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/18/14.
//
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"
#import "EventTableViewCell.h"
#import "EventInfoModel.h"

@interface EventDetailViewTableViewController : UITableViewController

@property (retain, nonatomic) CalendarModel        *calendarModel;

-(id)initWithEventModel:(CalendarModel *) calendarModel;

@end
 