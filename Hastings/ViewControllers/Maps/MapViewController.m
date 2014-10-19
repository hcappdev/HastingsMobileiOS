//
//  MapViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "IIViewDeckController.h"


@interface MapViewController ()

@end

//defined coordinates 40.593490, -98.370377
#define HC_LATITUDE 40.593490
#define HC_LONGGITUDE -98.369798
#define SPAN 0.0125f;
#define METERS_PER_MILE 1609.344

@implementation MapViewController
@synthesize mapView;
@synthesize mapData;

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
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClicked)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    [self loadInitialView];
    
}


- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[Annotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
        
        if (annotationView == nil) {
            
            annotationView                           = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"];
            annotationView.image                     = [UIImage imageNamed:@"map-marker.png"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            annotationView.enabled                   = YES;
            annotationView.canShowCallout            = YES;
            annotationView.rightCalloutAccessoryView = NO;
        }
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void) mapView:(MKMapView *) mapView didAddAnnotationViews:(NSArray *)views {
    
    for (MKAnnotationView *anotationView in views) {
        
        CGRect endFrame = anotationView.frame;
        
        anotationView.frame = CGRectMake(anotationView.frame.origin.x, anotationView.frame.origin.y - 230.0, anotationView.frame.size.width, anotationView.frame.size.height);
        
        [UIView animateWithDuration:0.45f delay:0.30f options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            [anotationView setFrame:endFrame];
        }
                         completion:^ (BOOL finished){

                         }];
    }
}

-(NSMutableArray*) getCampusLocations{

    NSMutableArray *returnLocationList  = [[NSMutableArray alloc] init];

    NSString *urlString                 = @"https://dl.dropboxusercontent.com/s/tggw69zw1olitc7/map-data.json";
    NSURL *url                          = [NSURL URLWithString:urlString];
    NSData *eventData                   = [NSData dataWithContentsOfURL:url];
    id response                         = [NSJSONSerialization JSONObjectWithData:eventData options:NSJSONReadingMutableContainers error: nil];
    NSDictionary *results               = response;

    NSDictionary *buildingList          = [results objectForKey:@"Locations"];
    
    for (NSDictionary *item in buildingList) {
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude     = [[item objectForKey:@"latitude"] doubleValue];
        coordinate.longitude    = [[item objectForKey:@"longitude"] doubleValue];

        Annotation *campusLocation   = [[Annotation alloc] init];
        
        campusLocation.title         = [item objectForKey:@"title"];
        campusLocation.subtitle      = [item objectForKey:@"snippet"];
        campusLocation.coordinate           = coordinate;
        
        [returnLocationList addObject:campusLocation];
   }

    return returnLocationList;
}

-(void)loadInitialView{
    
    self.title = @"Campus Map";
    self.mapView.delegate = self;
    
    MKCoordinateRegion hastingsCollegeRegion;
    
    CLLocationCoordinate2D center;
    center.latitude = HC_LATITUDE;
    center.longitude = HC_LONGGITUDE;
    
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN;
    span.longitudeDelta = SPAN;
    hastingsCollegeRegion.center = center;
    hastingsCollegeRegion.span = span;
    
    [mapView setRegion:hastingsCollegeRegion animated:YES];
    
    [self.mapView addAnnotations:[self getCampusLocations]];
}

-(void)buttonItemClicked{
    [self loadInitialView];
}

//google analytics
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.screenName = @"Campus Map";
}

@end
