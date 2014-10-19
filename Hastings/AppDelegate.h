//
//  AppDelegate.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "MenuViewController.h"
#import "HomeViewController.h"
#import "AboutViewController.h"
#import "AthleticsViewController.h"
#import "BroncoBoardViewController.h"
#import "ContactsTableViewController.h"
#import "MapViewController.h"
#import "CalendarTableViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) UIViewController *menuViewController;
@property (retain, nonatomic) UIViewController *rootViewController;


@end
