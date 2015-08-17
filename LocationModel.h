//
//  LocationModel.h
//  RateCoffee
//
//  Created by Adam Smith on 13/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationModel : NSObject

@property (nonatomic) float userLatitude;
@property (nonatomic) float userLongitude;

-(void) setUserLatitude:(float)thisUserLatitude;

-(float) getUserLatitude;

-(void) setUserLongitude:(float)thisUserLongitude;

-(float) getUserLongitude;
    
@end
