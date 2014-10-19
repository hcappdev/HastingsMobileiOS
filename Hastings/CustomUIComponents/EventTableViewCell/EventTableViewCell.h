//
//  EventTableViewCell.h
//  Hastings
//
//  Created by Creighton Leif on 7/22/14.
//
//

#import <UIKit/UIKit.h>
#import "EventModel.h"
#import "CalendarTableViewCell.h"
#import "EventInfoModel.h"

@interface EventTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *eventTitle;

-(void) bindCellDetails:(EventModel *) EventDetailInfo;

@end
