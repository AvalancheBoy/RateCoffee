//
//  RatingsViewController.m
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "RatingsViewController.h"

@implementation RatingsViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    
     AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    [super viewDidLoad];
    
    [self updateTheRatings:[sharedDelegate.mainModel getCurrentUserRatingRetrieved]];
    
    [self updateTheGroupRatings:[sharedDelegate.mainModel getCurrentGroupRatingRetrieved]];

    
}

- (void)viewDidAppear:(BOOL)animated{
    
     AppDelegate *sharedDelegate = [AppDelegate appDelegate];
    
    [super viewDidAppear:animated];
    
    [self updateTheRatings:[sharedDelegate.mainModel getCurrentUserRatingRetrieved]];
    
    [self updateTheGroupRatings:[sharedDelegate.mainModel getCurrentGroupRatingRetrieved]];
    
    
}

- (IBAction)userRatingButtonPressed:(id)sender {
    
     NSLog(@"user rating button pressed");
    
    [self updateTheRatings:[sender tag]];
    
    [self.ratingsDelegate updateParseWithNewRating: [sender tag]];

}

-(void) updateTheRatings: (int)switchCaseValue{
    
    NSLog(@"here at case value is: %d", switchCaseValue);
    
    [self.userStarRatingButton1 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.userStarRatingButton2 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.userStarRatingButton3 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.userStarRatingButton4 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.userStarRatingButton5 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    
    switch (switchCaseValue) {
        case 5:
            [self.userStarRatingButton5 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 4:
            [self.userStarRatingButton4 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 3:
            [self.userStarRatingButton3 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 2:
            [self.userStarRatingButton2 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 1:
            [self.userStarRatingButton1 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
            
        default:
            break;
    }
    
}

-(void) updateTheGroupRatings: (int)switchCaseValue{
    
    NSLog(@"here at case value is: %d", switchCaseValue);
    
    [self.groupStarRatingButton1 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.groupStarRatingButton2 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.groupStarRatingButton3 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.groupStarRatingButton4 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    [self.groupStarRatingButton5 setImage:[UIImage imageNamed:@"star empty.png"] forState:UIControlStateNormal];
    
    switch (switchCaseValue) {
        case 5:
            [self.groupStarRatingButton5 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 4:
            [self.groupStarRatingButton4 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 3:
            [self.groupStarRatingButton3 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 2:
            [self.groupStarRatingButton2 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
        case 1:
            [self.groupStarRatingButton1 setImage:[UIImage imageNamed:@"star full.png"] forState:UIControlStateNormal];
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
