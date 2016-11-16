//
//  ALMAnalysisViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMAnalysisViewController.h"
#import "ALMCharacter.h"
#import "ALMAnalysis.h"

@interface ALMAnalysisViewController ()
@property (weak, nonatomic) IBOutlet UIButton *finallyButton;
@property (weak, nonatomic) IBOutlet UIImageView *characterTwo;
@property (weak, nonatomic) IBOutlet UIImageView *characterThree;
@property (weak, nonatomic) IBOutlet UIImageView *characterFour;
@property (weak, nonatomic) IBOutlet UIImageView *characterFive;

@end

@implementation ALMAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//TODO break up the sizable code below
    [ALMAnalysis sortUserTraits: self.playerTraits withCompletion:^(NSArray *sortedTraitsArray)
     {
         self.topPlayerTraits = sortedTraitsArray;
         
        [ALMCharacter populateCharacterListWithCompletion:^(NSMutableArray *characterList)
        {
            [ALMAnalysis characterSort: characterList withCompletion: ^(NSArray * orderedDuppleTraits)
            {
                self.duppleListWithTraits =  orderedDuppleTraits;
                
                [ALMAnalysis dataAnalysis: self.topPlayerTraits : self.duppleListWithTraits withCompletion:^(NSArray *topFiveHanchos)
                 {
                     [self.characterTwo setImage: [topFiveHanchos[1]mugshot]];
                     [self.characterThree setImage: [topFiveHanchos[2]mugshot]];
                     [self.characterFour setImage: [topFiveHanchos[3]mugshot]];
                     [self.characterFive setImage: [topFiveHanchos[4]mugshot]];
                    //Here we do the work of comparing player.traits with dupple.traits and post image of lower 4, give topDog to nextVC.
                     self.topMatch = topFiveHanchos[0];
                
                 }];
            }];
        }];
     }];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ALMEndViewController *endVC = segue.destinationViewController;
    ALMCharacter *firstPlace = self.topMatch;
    endVC.theOne = firstPlace;
}
     
@end
