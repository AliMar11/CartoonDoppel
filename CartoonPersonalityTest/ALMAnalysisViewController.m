//
//  ALMAnalysisViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

//added name in textView and animated button for EndVC
#import <QuartzCore/QuartzCore.h>
#import "ALMAnalysisViewController.h"
#import "ALMCharacter.h"
#import "ALMAnalysis.h"
#import "ALMBackgroundLayer.h"

@interface ALMAnalysisViewController ()
@property (weak, nonatomic) IBOutlet UIButton *finallyButton;
@property (weak, nonatomic) IBOutlet UIImageView *characterTwo;
@property (weak, nonatomic) IBOutlet UIImageView *characterThree;
@property (weak, nonatomic) IBOutlet UIImageView *characterFour;
@property (weak, nonatomic) IBOutlet UIImageView *characterFive;
@property (weak, nonatomic) IBOutlet UIStackView *doppelStackView;

@end

//TODO: ANIMATE THIS PAGE
@implementation ALMAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"\n\n 1 RUNNERUPS SETUP METHOD CALLED \n\n");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    NSLog(@" 2 VIEW WILL APPEAR");
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
    self.finallyButton.layer.cornerRadius = 6;
    self.finallyButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.finallyButton.clipsToBounds = YES;
    
    self.characterTwo.alpha = 0;
    self.characterThree.alpha = 0;
    self.characterFour.alpha = 0;
    self.characterFive.alpha = 0;
    
    self.finallyButton.hidden = YES;
    
    [self introduceRunnerUpsWithCompletion: nil];
    
    NSLog(@" 3 VIEW WILL APPEAR");
}

-(void)introduceRunnerUpsWithCompletion:(void(^)())completion
{
    NSLog(@"\n\n 4 TEXT INTRO\n\n");

    NSString *topFourIntro = [NSString stringWithFormat: @"%@, answers have been analyzed... some honrable mentions are:", self.playerTraits.userName];
    
    UITextView *topFourView = [[UITextView alloc]init];
    [self.view insertSubview: topFourView atIndex: 0];

    topFourView.hidden = YES;
    topFourView.text = topFourIntro;
    topFourView.backgroundColor = [UIColor clearColor];
    topFourView.layer.shadowColor = [UIColor clearColor].CGColor;
    [topFourView setFont: [UIFont fontWithName: @"Verdana-Bold" size: 15]];

    CGFloat textViewX =  (self.view.frame.origin.x) + 30;
    CGFloat textViewY =  (self.view.frame.origin.y) + 25;
    CGFloat textViewWidth = CGRectGetWidth(self.view.bounds) / 1.1;
    CGFloat textViewheight = CGRectGetHeight(self.view.bounds) / 3;
    
    CGRect textViewFrame = CGRectMake(textViewX, textViewY, textViewWidth, textViewheight);
    topFourView.frame = textViewFrame;
    
    NSLog(@"\n\n 5 MESSAGE CONSTRAINTS SET, ABOUT TO CALL TRANSITION \n\n");

                             [UIView transitionWithView: topFourView
                                               duration: 3.5f
                                                options: UIViewAnimationOptionCurveEaseInOut |
                              UIViewAnimationOptionTransitionCrossDissolve
                                             animations: ^{
                                                 NSLog(@"\n\n 6 TRANSITION CALLED\n\n");

                                                 topFourView.alpha = 1;
                                                 topFourView.hidden = NO;
                                                 topFourView.alpha = 0;
                                             
                                                 NSLog(@"\n\n 7 TRANSITION FINISHED\n\n");
                                             }
                                             completion:^(BOOL finished)
                              
                                            {
                                              NSLog(@"\n\n 8 COMPLETION FOR MESSAGE \n\n");
                                              [self presentRunnerUps];
                                              
                                              NSLog(@"\n\n 9STACK VIEW FOR RUNNERUP ABOUT TO BE CALLED\n\n");
                                              
                                      
                                          }];

    
// NSString *topDoppelIntro = @"your cartoon doppel is...";
}

-(void)presentRunnerUps
{
    NSLog(@"\n\n 10 STACK VIEW SHOW METHOD CALLED\n\n");

    //TODO break up the sizable code below
    [ALMAnalysis sortUserTraits: self.playerTraits withCompletion:^(NSArray *sortedTraitsArray)
     {
         self.topPlayerTraits = sortedTraitsArray;
         
         [ALMCharacter populateCharacterListWithCompletion:^(NSMutableArray *characterList)
          {
              [ALMAnalysis characterSort: characterList withCompletion: ^(NSArray * orderedDoppelTraits)
               {
                   self.doppelListWithTraits =  orderedDoppelTraits;
                   
//Here we do the work of comparing player.traits with doppel.traits and setting the images of lower 4 of top 5 matches, then passing the #1 match to as 'topDog' to nextVC.
                 
                   [ALMAnalysis dataAnalysis: self.topPlayerTraits : self.doppelListWithTraits withCompletion:^(NSArray *topFiveHanchos)
                    {
                        NSLog(@"\n\n 11 STACK VIEW\n\n");

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
                        
                        [UIView transitionWithView: self.doppelStackView
                                          duration:1.5f
                                           options: UIViewAnimationOptionCurveLinear
                         
                                        animations:^{
                                          
                                            NSLog(@"\n\n 12 STACKVIEW ANIMATION START\n\n");

                                            self.characterTwo.alpha = 1;
                                            self.characterThree.alpha = 1;
                                            self.characterFour.alpha = 1;
                                            self.characterFive.alpha = 1;
                                            
                                            NSLog(@"\n\n 13 STACK VIEW ANIMATION END\n\n");
                                        }
                         
                                        completion:^(BOOL finished)
                                         {
                                             
                                             NSLog(@"\n\n 14 STACKIEW COMPLETION CALLED\n\n");

                                             self.topMatch = topFiveHanchos[0];
                                             
                                             [UIView animateWithDuration: 1 animations:
                                              ^{
                                                 self.finallyButton.hidden = NO;

                                             }];

                                         }];
                        
                        // NSLog(@"LIKENESS OF TOP 4%d\n%d\n%d\n%d\n%d",[topFiveHanchos[0]likeness], [topFiveHanchos[1]likeness], [topFiveHanchos[2]likeness], [topFiveHanchos[3]likeness], [topFiveHanchos[4]likeness]);
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
