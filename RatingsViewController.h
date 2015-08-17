//
//  RatingsViewController.h
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol RatingsDelegate <NSObject>

-(void)updateParseWithNewRating:(int)theRating;

@end

@interface RatingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *userStarRatingButton1;
@property (strong, nonatomic) IBOutlet UIButton *userStarRatingButton2;
@property (strong, nonatomic) IBOutlet UIButton *userStarRatingButton3;
@property (strong, nonatomic) IBOutlet UIButton *userStarRatingButton4;
@property (strong, nonatomic) IBOutlet UIButton *userStarRatingButton5;

@property (weak, nonatomic) IBOutlet UIButton *groupStarRatingButton1;
@property (strong, nonatomic) IBOutlet UIButton *groupStarRatingButton2;
@property (strong, nonatomic) IBOutlet UIButton *groupStarRatingButton3;
@property (strong, nonatomic) IBOutlet UIButton *groupStarRatingButton4;
@property (strong, nonatomic) IBOutlet UIButton *groupStarRatingButton5;

@property (nonatomic, weak) id<RatingsDelegate> ratingsDelegate;

@property (nonatomic) int theRating;

@end
