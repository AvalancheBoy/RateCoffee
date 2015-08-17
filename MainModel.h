//
//  MainModel.h
//  RateCoffee
//
//  Created by Adam Smith on 13/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject


@property (strong, nonatomic) NSArray *arrayOfVenues;
@property (nonatomic) int currentUserRatingRetrieved;
@property (nonatomic) int currentGroupRatingRetrieved;

-(void) setArrayOfVenues:(NSArray *)thisArrayOfVenues;

-(NSArray*) getArrayOfVenues;

-(void) setCurrentUserRatingRetrieved:(int)thisCurrentUserRatingRetrieved;

-(int) getCurrentUserRatingRetrieved;

-(void) setCurrentGroupRatingRetrieved:(int)thisCurrentGroupRatingRetrieved;

-(int) getCurrentGroupRatingRetrieved;

@end
