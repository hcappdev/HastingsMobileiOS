//
//  EventInfoTableViewController.h
//  HC Mobile
//
//  Created by Checkout on 7/26/14.
//  Copyright (c) 2014 Hastings College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventInfoModel.h"
#import "EventModel.h"


@interface EventInfoTableViewController : UITableViewController

@property (retain, nonatomic) EventModel        *eventModel;

-(id)initWithEventInfoModel:(EventModel *) eventInfoModel;

@end
