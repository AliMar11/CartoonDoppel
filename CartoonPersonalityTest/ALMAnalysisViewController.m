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
    [ALMAnalysis sortUserTraits: self.playerTraits withCompletion:^(NSMutableDictionary *topPlayerTraits)
     {
         self.topPlayerTraits = topPlayerTraits;
         
    [ALMCharacter populateCharacterListWithCompletion:^(NSMutableArray *characterList)
    {
        [ALMAnalysis characterSort: characterList withCompletion: ^(NSMutableDictionary *sortedDupple)
        {
            self.duppleListWithTraits =  sortedDupple;
            
            [ALMAnalysis dataAnalysis: self.topPlayerTraits : self.duppleListWithTraits withCompletion:^(NSArray *topFiveHanchos)
             {
                 
                 //Here we do the work of comparing player.traits with dupple.traits and post image of lower 4, give topDog to nextVC.
            
             }];

       
        }];
        
   
    }];
         
         
     }];
    
    //self.characterTwo.image = [UIImage imageNamed: topFiveHanchos[1].mugshot];
    
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
