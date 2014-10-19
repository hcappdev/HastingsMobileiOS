//
//  CalendarTableViewCell.h
//  Hastings
//
//  Created by Creighton Leif on 7/17/14.
//
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarTableViewCell : UITableViewCell

-(void) bindCellDetails:(CalendarModel *) eventInfo;

@property (strong, nonatomic) IBOutlet UILabel *eventName;
@property (strong, nonatomic) IBOutlet UILabel *eventWeek;

@end
