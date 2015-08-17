//
//  LocationModel.m
//  RateCoffee
//
//  Created by Adam Smith on 13/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel


@synthesize userLatitude;
@synthesize userLongitude;

-(id) init{
    
    
    
    return self;
    
}


-(void) setUserLatitude:(float)thisUserLatitude{
    
    userLatitude = thisUserLatitude;
}

-(float) getUserLatitude{
    
    return userLatitude;
    
}

-(void) setUserLongitude:(float)thisUserLongitude{
    
    userLongitude = thisUserLongitude;
}

-(float) getUserLongitude{
    
    return userLongitude;
    
}

@end
