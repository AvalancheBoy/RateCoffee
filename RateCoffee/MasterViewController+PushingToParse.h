//
//  MasterViewController+PushingToParse.h
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MasterViewController.h"
#import <Parse/Parse.h>
#import "Venue.h"

@interface MasterViewController (PushingToParse) <RatingsDelegate>


-(void) searchForTheUserRatingForThisVenue: (int)theRating : (BOOL)updateTheRating;

-(void) searchForTheGroupRatingForThisVenue;

@end
