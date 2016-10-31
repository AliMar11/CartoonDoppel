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
    
    
    NSMutableArray *topArray = [[NSMutableArray alloc]init];
    
    
//MAKESHIFT START!!
//    [ALMCharacter populateCharacterListWithCompletion:^(NSArray *characterList)
//     {
//         self.finallyButton.titleLabel.text = @"These are you possible duples";
//         NSLog(@"\n\nLE LIST:%lu\n\n", characterList.count);
//         
//         int r = (arc4random() % 9) + 1;
//         [self.characterTwo setImage: [characterList[r] mugshot] ];
//        // [characterList delete: [characterList indexOfObject: self.characterTwo.image]];
//         
//         int re = (arc4random() % 9) + 1;
//         [self.characterThree setImage: [characterList[re] mugshot] ];
//       //  [characterList delete: [[characterList[re] mugshot.[characterList.re].object]]];
//
//         int ra =(arc4random() % 9) + 1;
//         [self.characterFour setImage: [characterList[ra] mugshot] ];
//        // [characterList delete: [characterList[ra] mugshot]];
//
//         
//         int rr = (arc4random() % 9) + 1;
//         [self.characterFive setImage: [characterList[rr] mugshot] ];
//         
//          // NSArray *topArray = [[NSArray alloc]initWithObjects: @[characterList[r], characterList[re], characterList[ra], characterList[rr]]];
//         [topArray addObject:characterList[r]];
//         [topArray addObject:characterList[ra]];
//         [topArray addObject:characterList[rr]];
//         [topArray addObject:characterList[re]];
//
//         
//         int finalRan =(arc4random() % 3) + 1;
//        
//         self.topMatch = topArray[finalRan];
//         
//     }];
    
//MAKESHIFT END!!

    [ALMAnalysis dataAnalysis: self.playerTraits withCompletion:^(NSArray *topFive)
    {
        NSLog(@"\n\nWHAT IS TOPFIVE???-->%@", topFive);
        // set the 4 UIImageViews with the 4 images
        self.topMatch = topFive[0];
        
  /*
        //place each character picture in each image view.
        self.characterTwo.image = [UIImage: [UIImage imageNamed: topFive[1].picture]];
        self.characterTwo.image = [UIImage: [UIImage imageNamed: topFive[2].picture]];
        self.characterTwo.image = [UIImage: [UIImage imageNamed: topFive[3].picture]];
        self.characterTwo.image = [UIImage: [UIImage imageNamed: topFive[4].picture]];

        //Do we want to remove the topDog here or no?
  */      
    }];
    

    
//    [ALMCharacter populateCharacterListWithCompletion:^{
//        
//    }];
//    
//    [ALMCharacter dataAnalysis: self.playerTraits : self.duppleCharacters withCompletion:^
//    {
//        NSLog(@"analysis method");
//    }];

    
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
    ALMEndViewController *endVC = segue.destinationViewController;
    ALMCharacter *firstPlace = self.topMatch;
    endVC.theOne = firstPlace;
}
     
@end
