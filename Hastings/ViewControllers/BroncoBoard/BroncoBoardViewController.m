//
//  BroncoBoardViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "BroncoBoardViewController.h"
#import "IIViewDeckController.h"

@interface BroncoBoardViewController ()

@end

@implementation BroncoBoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClicked)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Broncoboard";
    [self loadInitialView];

}

-(void)loadInitialView{
    
    NSString *fullURL = @"http://broncoboard.hastings.edu";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_BBWebView loadRequest:requestObj];
}

-(void)buttonItemClicked{
    
    [self loadInitialView];
}

//google analytics
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.screenName = @"Broncoboard";
}

@end
