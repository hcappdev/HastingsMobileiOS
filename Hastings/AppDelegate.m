//
//  AppDelegate.m
//  Hastings
//
//  Created by Creighton Leif  on 7/2/14.
//
//

#import "AppDelegate.h"
#import "GAIDictionaryBuilder.h"
#import "GAI.h"

@implementation AppDelegate

@synthesize menuViewController = _menuViewController;

- (IIViewDeckController*) initializeMainViewControllers {
    
    UIViewController *menuViewController      = [[MenuViewController alloc] init];
    UIViewController *rootViewController      = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    IIViewDeckController* deckController      = [[IIViewDeckController alloc] initWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:rootViewController]
                                                                                        leftViewController:menuViewController];
    
    return deckController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window                             = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    IIViewDeckController* deckController    = [self initializeMainViewControllers];
    
    self.menuViewController                 = deckController.leftController;
    self.rootViewController                 = deckController.centerController;
    
    self.window.rootViewController          = deckController;
    [self.window makeKeyAndVisible];
    
    return YES;
    
    //google analytics
    [GAI sharedInstance].trackUncaughtExceptions    = YES;
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    [GAI sharedInstance].dispatchInterval           = 20;
    id<GAITracker> tracker                          = [[GAI sharedInstance] trackerWithTrackingId:@"UA-53195499-1"];
    
    [tracker set:kGAIScreenName value:@"App Opened"];
    [tracker send: [[GAIDictionaryBuilder createAppView] build]];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
