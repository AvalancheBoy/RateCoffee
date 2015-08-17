//
//  MasterViewController.h
//  RateCoffee
//
//  Created by Adam Smith on 09/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RatingsViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) RatingsViewController *ratingsVC;
@property (nonatomic) double currentLongitude;
@property (nonatomic) double currentLatitude;
@property (nonatomic, strong) NSArray *venues;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *mapButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *logOutButton;
@property (nonatomic) int currentUserRating;
@property (nonatomic) NSString *currentVenue;
@property (nonatomic) int currentGroupRating;

@end

