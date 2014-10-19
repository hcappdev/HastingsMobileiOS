//
//  EventModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/21/14.
//
//

#import <Foundation/Foundation.h>
#import "EventInfoModel.h"


@interface EventModel : NSObject

@property   (nonatomic, copy)   NSString        *eventDay;
@property   (nonatomic, retain) EventInfoModel  *eventInfoModel;
@property   (nonatomic, retain) NSMutableArray  *eventInfoModelList;

@end
