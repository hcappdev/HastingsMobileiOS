//
//  EventInfoTableViewCell.h
//  HC Mobile
//
//  Created by Checkout on 7/26/14.
//  Copyright (c) 2014 Hastings College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"

@interface EventInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UILabel *eventLocation;
@property (weak, nonatomic) IBOutlet UILabel *eventTime;

-(void) bindCellDetails:(EventInfoModel *) EventDetailInfo;

@end
