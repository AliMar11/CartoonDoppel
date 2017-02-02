//
//  ALMAnalysisViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMAnalysisViewController.h"
#import <QuartzCore/QuartzCore.h>
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

@implementation ALMAnalysisViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
    self.finallyButton.layer.cornerRadius = 6;
    self.finallyButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.finallyButton.clipsToBounds = YES;
    self.finallyButton.alpha = 0;

    self.characterTwo.alpha = 0;
    self.characterThree.alpha = 0;
    self.characterFour.alpha = 0;
    self.characterFive.alpha = 0;
    
    [self introduceRunnerUpsWithCompletion: nil];
}

-(void)introduceRunnerUpsWithCompletion:(void(^)())completion
{
    NSString *topFourIntro = [NSString stringWithFormat: @"%@, your choices have been analyzed... some honorable mentions are:", self.playerTraits.userName];
    
    UITextView *topFourView = [[UITextView alloc]init];
    [self.view insertSubview: topFourView atIndex: 0];
    
    topFourView.alpha = 0;
    topFourView.text = topFourIntro;
    topFourView.backgroundColor = [UIColor clearColor];
    topFourView.layer.shadowColor = [UIColor clearColor].CGColor;
    [topFourView setFont: [UIFont fontWithName: @"Verdana-Bold" size: 18]];
    
    CGFloat textViewX =  (self.view.frame.origin.x) + 35;
    CGFloat textViewY =  (self.view.frame.origin.y) + 25;
    CGFloat textViewWidth = CGRectGetWidth(self.view.bounds) / 1.1;
    CGFloat textViewheight = CGRectGetHeight(self.view.bounds) / 3;
    
    CGRect textViewFrame = CGRectMake(textViewX, textViewY, textViewWidth, textViewheight);
    topFourView.frame = textViewFrame;
    
    [UIView animateWithDuration: 2.0f
                          delay: 1.5f
                        options: UIViewAnimationOptionTransitionNone animations:
     ^{
        topFourView.alpha = 1;
        topFourView.alpha = 0;

      }
         completion:^(BOOL finished)
        {
            [self presentRunnerUps];
    }];
}

-(void)presentRunnerUps
{
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
                                          duration:1.2f
                                           options: UIViewAnimationOptionCurveLinear
                                        animations:
                         ^{
                            self.characterTwo.alpha = 1;
                            self.characterThree.alpha = 1;
                            self.characterFour.alpha = 1;
                            self.characterFive.alpha = 1;
                         }
                                completion:^(BOOL finished)
                                {
                                     self.topMatch = topFiveHanchos[0];
                                     
                                     UITextView *presentNextButton = [[UITextView alloc] init];
                                     NSString *buttonIntro = @"and your doppel is...";
                                     CGFloat buttonIntroTextViewX = (self.finallyButton.frame.origin.x) - 20;
                                     CGFloat buttonIntrtoTextViewY = (self.finallyButton.frame.origin.y) - 55;
                                     CGFloat buttonIntroTextViewWidth = CGRectGetWidth(self.self.doppelStackView.bounds);
                                     CGFloat buttonIntroTextViewheight = CGRectGetHeight(self.doppelStackView.bounds) / 2;
                                     
                                     CGRect buttonIntroTextViewFrame = CGRectMake(buttonIntroTextViewX, buttonIntrtoTextViewY, buttonIntroTextViewWidth, buttonIntroTextViewheight);
                                     presentNextButton.frame = buttonIntroTextViewFrame;
                                     
                                     presentNextButton.text = buttonIntro;
                                     presentNextButton.backgroundColor = [UIColor clearColor];
                                     presentNextButton.layer.shadowColor = [UIColor clearColor].CGColor;
                                     [presentNextButton setFont: [UIFont fontWithName: @"Verdana-Bold" size: 15]];
                                         
                                    [UIView animateWithDuration: 1.0f
                                                          delay: 0
                                         usingSpringWithDamping: 1
                                          initialSpringVelocity: 0.5
                                                        options: UIViewAnimationOptionCurveEaseIn animations:
                                          ^{
                                             [self.doppelStackView insertSubview: presentNextButton atIndex: 0];
                                              presentNextButton.alpha = 1;
                                              self.finallyButton.alpha = 1;
                                          }
                                                completion: nil];
                                }];
                                             // NSLog(@"LIKENESS OF TOP 4\n%d\n%d\n%d\n%d\n%d",[topFiveHanchos[0]likeness], [topFiveHanchos[1]likeness], [topFiveHanchos[2]likeness], [topFiveHanchos[3]likeness], [topFiveHanchos[4]likeness]);
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
   // NSLog(@"\ntop match:%@\n", self.topMatch.characterName);
    ALMEndViewController *endVC = segue.destinationViewController;
    ALMCharacter *firstPlace = self.topMatch;
    endVC.theOne = firstPlace;
}

@end

