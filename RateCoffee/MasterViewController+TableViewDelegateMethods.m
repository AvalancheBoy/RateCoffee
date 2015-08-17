//
//  MasterViewController+TableViewDelegateMethods.m
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "MasterViewController+TableViewDelegateMethods.h"

@implementation MasterViewController (TableViewDelegateMethods)



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Venue *venue = self.venues[indexPath.row];
    
    cell.textLabel.text = venue.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0fm", venue.location.distance.floatValue];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"here at did select row: %ld, current venue is: %@", (long)[indexPath row], [[self.venues objectAtIndex:[indexPath row]] name]);
    
    self.currentVenue = [[self.venues objectAtIndex:[indexPath row]] name];
    
    self.ratingsVC.modalPresentationStyle = UIModalPresentationPopover;
    
    self.ratingsVC.ratingsDelegate = self;
    
    
    UIPopoverPresentationController *popPC = self.ratingsVC.popoverPresentationController;
    popPC.delegate = self;
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[tableView cellForRowAtIndexPath:indexPath];
   
    popPC.sourceRect = [cell bounds];
    popPC.sourceView = cell;
    
    popPC.permittedArrowDirections =
    UIPopoverArrowDirectionDown | UIPopoverArrowDirectionUp;

    [self searchForTheGroupRatingForThisVenue];
    
    [self searchForTheUserRatingForThisVenue:0 :NO];
   
    
    
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}



@end