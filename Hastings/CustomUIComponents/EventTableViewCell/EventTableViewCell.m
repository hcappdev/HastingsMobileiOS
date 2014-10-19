//
//  EventTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/22/14.
//
//

#import "EventTableViewCell.h"


@implementation EventTableViewCell

@synthesize eventTitle      = _eventTitle;

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

}

-(void) bindCellDetails:(EventModel *) EventDetailInfo {
    
    self.eventTitle.text    = EventDetailInfo.eventDay;
}

@end
