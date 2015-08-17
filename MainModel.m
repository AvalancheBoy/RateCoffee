//
//  MainModel.m
//  RateCoffee
//
//  Created by Adam Smith on 13/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

@synthesize arrayOfVenues;
@synthesize currentUserRatingRetrieved;
@synthesize currentGroupRatingRetrieved;


-(id) init{
    
    arrayOfVenues = [[NSArray alloc] init];
    
    return self;
    
}

-(void) setCurrentUserRatingRetrieved:(int)thisCurrentUserRatingRetrieved{
    
    currentUserRatingRetrieved = thisCurrentUserRatingRetrieved;
}

-(int) getCurrentUserRatingRetrieved{
    
    return currentUserRatingRetrieved;
    
}

-(void) setCurrentGroupRatingRetrieved:(int)thisCurrentGroupRatingRetrieved{
    
    currentGroupRatingRetrieved = thisCurrentGroupRatingRetrieved;
}

-(int) getCurrentGroupRatingRetrieved{
    
    return currentGroupRatingRetrieved;
    
}

-(void) setArrayOfVenues:(NSArray *)thisArrayOfVenues{
    
    arrayOfVenues = thisArrayOfVenues;
}

-(NSArray*) getArrayOfVenues{
    
    
    return arrayOfVenues;
}

@end
