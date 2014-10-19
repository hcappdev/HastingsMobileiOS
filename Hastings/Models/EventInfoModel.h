//
//  EventInfoModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/21/14.
//
//

#import <Foundation/Foundation.h>
#import "EventInfoModel.h"

@interface EventInfoModel : NSObject

@property (nonatomic, copy) NSString    *eventTitle;
@property (nonatomic, copy) NSString    *eventLocation;
@property (nonatomic, copy) NSString    *eventTime;

@end
