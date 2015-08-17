//
//  MasterViewController+PushingToParse.m
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MasterViewController+PushingToParse.h"
#import "AppDelegate.h"

@implementation MasterViewController (PushingToParse)

-(void) searchForTheUserRatingForThisVenue: (int)theRating : (BOOL)updateTheRating{
    
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Rating"];
    
    [query whereKey:@"venue" equalTo:self.currentVenue];
    [query whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *ratings, NSError *error) {
        if (!error) {
            
            NSLog(@"Successfully retrieved %d scores.", ratings.count);
            
            if(updateTheRating == YES){
                
            [self checkIfTheRatingExistsIfNotThenStore:ratings:theRating];
            
            [self loopThroughTheRatingsChangingThem:ratings :theRating];
                
                
                
            } else{
                
                if(ratings.count > 0){
                
                   [sharedDelegate.mainModel setCurrentUserRatingRetrieved:[[ratings[0] objectForKey:@"rating"] integerValue]];
                    
                    
                } else{
                    
                    [sharedDelegate.mainModel setCurrentUserRatingRetrieved:0];
                    
                }
                
                
                [self presentViewController:self.ratingsVC animated:NO completion:nil];
                
                
            }
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void) createOrUpdateTheNewRatingForThisUser: (int)theRating :(PFObject*)rating{
    
    rating[@"username"] = [[PFUser currentUser] username];
    rating[@"venue"] = self.currentVenue;
    rating[@"rating"] = [NSString stringWithFormat:@"%d", theRating];
    
    [rating saveInBackground];
    
}

-(void) checkIfTheRatingExistsIfNotThenStore: (NSArray*) theRatings :(int)theRating{
    
        if(theRatings.count == 0){
            
            NSLog(@"here at there is no rating currently for this venue so creating");
    
            PFObject *rating = [PFObject objectWithClassName:@"Rating"];
        
            [self createOrUpdateTheNewRatingForThisUser:theRating :rating];
            
        }

}

-(void) loopThroughTheRatingsChangingThem: (NSArray*) theRatings :(int)theRating{
    
    NSLog(@"here at looping through the ratings: %d", [theRatings count]);
    
    for (PFObject *rating in theRatings) {
        
        PFQuery *query = [PFQuery queryWithClassName:@"Rating"];
        
        NSLog(@"here at there is a current rating for this venue so updating");
      
        [query getObjectInBackgroundWithId:rating.objectId
                                     block:^(PFObject *rating, NSError *error) {
                                         
                                         [self createOrUpdateTheNewRatingForThisUser:theRating :rating];
                                         
                                     }];
       
    }
    
}


-(void)updateParseWithNewRating: (int)theRating{
    
    NSLog(@"here at the delegate method: %@, %d", self.currentVenue, theRating);
    
    [self searchForTheUserRatingForThisVenue:theRating :YES];
    
    
}


-(void) searchForTheGroupRatingForThisVenue{
    
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Rating"];
    
    [query whereKey:@"venue" equalTo:self.currentVenue];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *ratings, NSError *error) {
        if (!error) {
            
            NSLog(@"Successfully retrieved %d scores for group.", ratings.count);
            
                if(ratings.count > 0){
                    
                    [self findTheAverageRatingForThisVenue:ratings];
                    
                } else{
                    
                    [sharedDelegate.mainModel setCurrentGroupRatingRetrieved:0];
                    
                }
                
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void) findTheAverageRatingForThisVenue: (NSArray*)theGroupOfRatings{
    
    AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    int theRunningTotal = 0;
    
    [sharedDelegate.mainModel setCurrentGroupRatingRetrieved:[[theGroupOfRatings[0] objectForKey:@"rating"] integerValue]];
    
    for (int i=0; i<theGroupOfRatings.count; i++) {
        
        theRunningTotal = theRunningTotal + [[theGroupOfRatings[i] objectForKey:@"rating"] integerValue];
        
    }

    
    theRunningTotal = ceil(theRunningTotal / theGroupOfRatings.count);
    
    
    NSLog(@"the running total is: %d", theRunningTotal);
    
    [sharedDelegate.mainModel setCurrentGroupRatingRetrieved:theRunningTotal];
   
}

@end
