//
//  MapViewController.m
//  RateCoffee
//
//  Created by Adam Smith on 13/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

    _mapView.delegate = self;
    
    [self createVenueLocationPins];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) createVenueLocationPins{
    
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    CLLocationCoordinate2D coordinate;

    NSArray *arrayOfVenues = [sharedDelegate.mainModel getArrayOfVenues];
    
    NSLog(@"number of venues is %d", [arrayOfVenues count]);
    
    for (id aVenue in arrayOfVenues) {
        
        
        self.theCurrentVenue = aVenue;
    
        coordinate.latitude = self.theCurrentVenue.location.lat.floatValue;
        
        coordinate.longitude = self.theCurrentVenue.location.lng.floatValue;
        
        
        MKPointAnnotation *annotation =
        [[MKPointAnnotation alloc]init];
        annotation.coordinate = coordinate;
        annotation.title = self.theCurrentVenue.name;
        [_mapView addAnnotation:annotation];
        
    }

    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = [sharedDelegate.locationModel getUserLatitude];
    location.longitude = [sharedDelegate.locationModel getUserLongitude];
    
    CLLocationCoordinate2D userCoordinate;
    
    MKPointAnnotation *annotation =
    [[MKPointAnnotation alloc]init];
    
    annotation.coordinate = userCoordinate;
    userCoordinate.latitude = location.latitude;
    userCoordinate.longitude = location.longitude;
    annotation.title = @"You Are Here";
    [_mapView addAnnotation:annotation];
    
    NSLog(@"here at user location: %f, %f", userCoordinate.latitude,
          userCoordinate.longitude);
    
    region.span = span;
    region.center = location;
    [_mapView setRegion:region animated:YES];
}



@end
