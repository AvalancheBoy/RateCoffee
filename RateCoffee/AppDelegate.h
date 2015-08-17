//
//  AppDelegate.h
//  RateCoffee
//
//  Created by Adam Smith on 09/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"
#import "LocationModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainModel *mainModel;
@property (strong, nonatomic) LocationModel *locationModel;

+ (AppDelegate *)appDelegate;

@end


