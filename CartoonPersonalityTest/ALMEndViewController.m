//
//  ALMEndViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ALMEndViewController.h"
#import "ALMBackgroundLayer.h"
#import "ALMShareViewController.h"

@interface ALMEndViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *doppelImageView;
@property (weak, nonatomic) IBOutlet UITextField *traitOne;
@property (weak, nonatomic) IBOutlet UITextField *traitTwo;
@property (weak, nonatomic) IBOutlet UITextField *traitThree;
@property (weak, nonatomic) IBOutlet UITextField *traitFour;
@property (weak, nonatomic) IBOutlet UITextField *TraitFive;
@property (weak, nonatomic) IBOutlet UILabel *thankYouLabel;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UILabel *doppelNameLabel;

@end

@implementation ALMEndViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.counter = self.analysisData[2];
    self.counter = @(self.counter.intValue + 1);
    NSLog(@"ANAYSIS DATA IN ENDVC: \n%@", self.analysisData);
    self.doppelImageView.layer.cornerRadius = 10;
    self.doppelImageView.clipsToBounds = YES;
    self.thankYouLabel.layer.cornerRadius = 5;
    self.playAgainButton.alpha = 0;
    self.shareButton.alpha = 0;
    
    
//    self.analysisData[2][0] = self.counter;
    self.analysisData[2] = @(self.counter.intValue + 1);

    
    [self setUpDoppelInfo];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
    [UIView animateWithDuration: 0.9 delay: 0.4 options: UIViewAnimationOptionCurveEaseIn animations:
     ^{
         self.traitOne.alpha = 0.5;
         self.traitOne.alpha = 1;
         
         self.traitTwo.alpha = 0.3;
         self.traitTwo.alpha = 1;
         
         self.traitThree.alpha = 0.2;
         self.traitThree.alpha = 1;
         
         self.traitFour.alpha = 0.1;
         self.traitFour.alpha = 1;
         
         self.TraitFive.alpha = 0.0;
         self.TraitFive.alpha = 1;
         
     } completion:^(BOOL finished)
     {
         self.thankYouLabel.hidden = NO;
         
       //  NSLog(@"\nENDVC...COUNTER:%@\n ANALYSIS COUNTER: %@\n", self.counter, self.analysisData[2]);
         
         if (self.counter.intValue <= 2)
         {
             [self labelAnimation];
         }
         else
         {
             [UIView transitionWithView: self.thankYouLabel duration: 0.9 options: UIViewAnimationOptionCurveEaseOut animations:^{
                 
                 CGFloat newY = self.thankYouLabel.center.y + self.view.bounds.size.width;
                 [self.thankYouLabel setCenter: CGPointMake(self.thankYouLabel.center.x, newY)];
                 
                 self.playAgainButton.alpha = 1;
                 self.shareButton.alpha = 1;
                 
             } completion:^(BOOL fin)
              {
                  [UIView animateWithDuration: 0.4 animations:
                   ^{
                       CGFloat newY = (CGFloat)self.view.bounds.size.height - 30;
                       
                       self.playAgainButton .center = CGPointMake( self.playAgainButton.center.x, newY);
                       
                       self.shareButton.center = CGPointMake(self.shareButton.center.x,  newY);
                   }];
              }];
         }
     
         self.thankYouLabel.layer.backgroundColor = [UIColor lightTextColor].CGColor;
     }];
}

-(void)labelAnimation
{
    self.thankYouLabel.textColor = [UIColor clearColor];
    [UIView transitionWithView: self.thankYouLabel
                      duration: 1/4
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations:
     ^{
         self.thankYouLabel.textColor = [UIColor blackColor];
     } completion:^(BOOL finished)
    {[UIView animateWithDuration: 1.2 animations:
         ^{
             self.thankYouLabel.layer.backgroundColor = [UIColor greenColor].CGColor;
             
         }
                      completion:^(BOOL finished)
    
      {[UIView animateWithDuration: 0.8 animations:
             ^{
                 self.thankYouLabel.layer.backgroundColor = [UIColor orangeColor].CGColor;
                 
             } completion: ^(BOOL fin)
        
        { [UIView animateWithDuration: 1 animations:
                                         
                 ^{
                     self.thankYouLabel.layer.backgroundColor = [UIColor yellowColor].CGColor;
                     
                 } completion: ^(BOOL fin)
           
            {[UIView animateWithDuration: 1 animations:
                 ^{
                     self.thankYouLabel.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
                     self.thankYouLabel.textColor = [UIColor purpleColor];
                  }
                  completion: ^(BOOL fin)
                {
                    [UIView transitionWithView: self.thankYouLabel duration: 0.9 options: UIViewAnimationOptionCurveEaseOut animations:^{
                        
                        CGFloat newY = self.thankYouLabel.center.y + self.view.bounds.size.width;
                        [self.thankYouLabel setCenter: CGPointMake(self.thankYouLabel.center.x, newY)];
                        
                        self.playAgainButton.alpha = 1;
                        self.shareButton.alpha = 1;
                        
                    } completion:^(BOOL fin)
                     {
                         [UIView animateWithDuration: 0.3 animations:
                          ^{
                             CGFloat newY = (CGFloat)self.view.bounds.size.height - 30;
                            
                             self.playAgainButton .center = CGPointMake( self.playAgainButton.center.x, newY);
                             
                             self.shareButton.center = CGPointMake(self.shareButton.center.x,  newY);
                         }];
                     }];
                }];
            }];
        }];
      }];
    }];

}

-(IBAction) playAgainButtonPressed: (UIButton*) UIButton
{
    if (self.playAgainButton)
    {
        
        [UIView animateWithDuration: 0.8 animations:
         ^{
            self.traitOne.alpha = 0;
            self.traitTwo.alpha = 0;
            self.traitThree.alpha = 0;
            self.traitFour.alpha = 0;
            self.TraitFive.alpha = 0;
        }];

        UIStoryboard *story = [UIStoryboard storyboardWithName: @"Main"
                                                        bundle: [NSBundle mainBundle]];
        UIViewController *secondViewController = [story instantiateViewControllerWithIdentifier: @"startScreenVC"];
        
        secondViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        secondViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:secondViewController animated:YES completion:nil];
    }
}

-(void)setUpDoppelInfo
{
    //this is the character most like the user... we call him/her 'topDog'.
    //self.topDog = self.analysisData[1][0];
    
    if (!self.topDog)
    {
       self.topDog = self.analysisData[1][0];
    }
    
    [self.doppelImageView setImage: self.topDog.mugshot];
    self.doppelNameLabel.text = [self.analysisData[1][0]characterName];

    //these are the top Five character traits for topDog.
    ALMCharacterTraits *topDoppTraitOne = self.topDog.traits.topDoppelTraits[0];
    ALMCharacterTraits *topDoppTraitTwo = self.topDog.traits.topDoppelTraits[1];
    ALMCharacterTraits *topDoppTraitThree = self.topDog.traits.topDoppelTraits[2];
    ALMCharacterTraits *topDoppTraitFour = self.topDog.traits.topDoppelTraits[3];
    ALMCharacterTraits *topDoppTraitFive = self.topDog.traits.topDoppelTraits[4];
    
     [self.traitOne setText: (NSString*)topDoppTraitOne];
     [self.traitTwo setText: (NSString*)topDoppTraitTwo];
     [self.traitThree setText: (NSString*)topDoppTraitThree];
     [self.traitFour setText: (NSString*)topDoppTraitFour];
     [self.TraitFive setText: (NSString*)topDoppTraitFive];

}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual: @"backButtonSegue"])
    {
        ALMAnalysisViewController *analysisVC = segue.destinationViewController;
        analysisVC.analysisData = self.analysisData;
    }
    else
    {
    ALMShareViewController *shareVC = segue.destinationViewController;
    shareVC.analysisData = self.analysisData;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end