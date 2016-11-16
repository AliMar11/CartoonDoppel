//
//  ALMAnalysisViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
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

//Here we do the work of comparing player.traits with dupple.traits and setting the images of lower 4, then passing the #1 match to as 'topDog' to nextVC.
                [ALMAnalysis dataAnalysis: self.topPlayerTraits : self.duppleListWithTraits withCompletion:^(NSArray *topFiveHanchos)
                 {
                     [self.characterTwo setImage: [topFiveHanchos[1]mugshot]];
                     self.characterTwo.layer.cornerRadius = 10;
                     self.characterTwo.clipsToBounds = YES;
                     
                     [self.characterThree setImage: [topFiveHanchos[2]mugshot]];
                     self.characterThree.layer.cornerRadius = 10;
                     self.characterThree.clipsToBounds = YES;
                     
                     [self.characterFour setImage: [topFiveHanchos[3]mugshot]];
                     self.characterFour.layer.cornerRadius = 10;
                     self.characterFour.clipsToBounds = YES;
                     
                     [self.characterFive setImage: [topFiveHanchos[4]mugshot]];
                     self.characterFive.layer.cornerRadius = 10;
                     self.characterFive.clipsToBounds = YES;

                     self.topMatch = topFiveHanchos[0];
                     
                     NSLog(@"LIKENESS OF TOP 4%d\n%d\n%d\n%d\n%d",[topFiveHanchos[0]likeness], [topFiveHanchos[1]likeness], [topFiveHanchos[2]likeness], [topFiveHanchos[3]likeness], [topFiveHanchos[4]likeness]);
                
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
