//
//  Venue.h
//  RateCoffee
//
//  Created by Adam Smith on 09/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Location;


@interface Venue : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Location *location;

@end