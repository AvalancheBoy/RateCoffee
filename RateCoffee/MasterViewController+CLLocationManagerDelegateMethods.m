//
//  MasterViewController+CLLocationManagerDelegateMethods.m
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MasterViewController+CLLocationManagerDelegateMethods.h"

#define kCLIENTID @"C2DGI1H4J0D0T0BLX4ABVHQARUVTG2OBGE5X53RW0SMSCFSV"
#define kCLIENTSECRET @"HIDBAZOJRYF2TB20344RZG1RCYFZX1XNTNDVW0FPRW1152B3"

@implementation MasterViewController (CLLocationManagerDelegateMethods)

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    NSLog(@"here at did update location");
    
    CLLocation *currentLocation = [locations lastObject];
    
    CLLocationCoordinate2D coordinate;
    
    if (currentLocation != nil) {
        
        NSLog(@"here at setting coordinate: %f, %f", currentLocation.coordinate.latitude,
              currentLocation.coordinate.longitude);
        
        coordinate.latitude = currentLocation.coordinate.latitude;
        coordinate.longitude = currentLocation.coordinate.longitude;
        
        self.currentLongitude = coordinate.longitude;
        self.currentLatitude = coordinate.latitude;
        
        [sharedDelegate.locationModel setUserLatitude:coordinate.latitude];
        [sharedDelegate.locationModel setUserLongitude:coordinate.longitude];
        
        [self loadVenues];
        
    }
    
}

- (void)loadVenues
{
    
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    NSLog(@"here at load venues");
    
    // NSString *latLon = @"37.33,-122.03"; // approximate latLon of The Mothership (a.k.a Apple headquarters)
    
    NSString *latLon = [NSString stringWithFormat:@"%f,%f", self.currentLatitude, self.currentLongitude];
    
    NSLog(@"the lat lon is: %@", latLon);
    
    NSString *clientID = kCLIENTID;
    NSString *clientSecret = kCLIENTSECRET;
    
    NSDictionary *queryParams = @{@"ll" : latLon,
                                  @"client_id" : clientID,
                                  @"client_secret" : clientSecret,
                                  @"categoryId" : @"4bf58dd8d48988d1e0931735",
                                  @"v" : @"20140118"};
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/v2/venues/search"
                                           parameters:queryParams
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  self.venues= mappingResult.array;
                                                  [self.tableView reloadData];
                                                  
                                                  [sharedDelegate.mainModel setArrayOfVenues:self.venues];
                                                  
                                                  self.mapButton.enabled = YES;
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];
    
    
    
}

@end
