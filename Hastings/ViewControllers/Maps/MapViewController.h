//
//  MapViewController.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"

#import "GAITrackedViewController.h"

@interface MapViewController : GAITrackedViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *mapData;

@end
