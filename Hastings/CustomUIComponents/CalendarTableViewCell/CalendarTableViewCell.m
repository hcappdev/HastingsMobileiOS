//
//  CalendarTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/17/14.
//
//

#import "CalendarTableViewCell.h"
#import "EventModel.h"

@implementation CalendarTableViewCell

@synthesize eventName   = _eventName;

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

-(void) bindCellDetails:(CalendarModel *) eventInfo {
    
    self.eventName.text     = eventInfo.eventName;
    self.eventWeek.text     = eventInfo.eventWeek;
}

@end
