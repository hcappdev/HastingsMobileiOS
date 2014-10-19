//
//  CalendarModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/17/14.
//
//

#import <Foundation/Foundation.h>
#import "EventModel.h"
@interface CalendarModel : NSObject



@property   (nonatomic, copy)   NSString          *eventName;
@property   (nonatomic, copy)   NSString          *eventWeek;
@property   (nonatomic, retain) NSMutableArray    *eventModels;

@end
