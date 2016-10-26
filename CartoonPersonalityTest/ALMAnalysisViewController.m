//
//  ALMAnalysisViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMAnalysisViewController.h"

@interface ALMAnalysisViewController ()

@end

@implementation ALMAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //here's where we write logic to figure out the top 5 characters by highest score. Present the last 4. Pass the 1st to the final VC.
    
    //how do we want to deal with the collectionView? Make this it's delegate or give it it's own collectonVC??
    
    //-- activate a cool loading indicator for 4 seconds, then set up the collectionView.
    //activate button to find out who's your dupple!
    //segue to final VC
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   // ALMEndViewController *endVC = segue.destinationViewController;
   // NSIndexPath *indexP = self.topFive.firstObject;
   // ALMCharacter *firstPlace = self.topFive[indexP];
   // endVC.theOne = firstPlace;
}

@end
