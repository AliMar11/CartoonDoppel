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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   // ALMEndViewController *endVC = segue.destinationViewController;
   // NSIndexPath *indexP = self.topFive.firstObject;
   // ALMCharacter *firstPlace = self.topFive[indexP];
   // endVC.theOne = firstPlace;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
