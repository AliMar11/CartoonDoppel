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
#import "ALMTextField.h"

@interface ALMEndViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *doppelImageView;
@property (weak, nonatomic) IBOutlet UITextField *traitOne;
@property (weak, nonatomic) IBOutlet UITextField *traitTwo;
@property (weak, nonatomic) IBOutlet UITextField *traitThree;
@property (weak, nonatomic) IBOutlet UITextField *traitFour;
@property (weak, nonatomic) IBOutlet UITextField *TraitFive;
@property (weak, nonatomic) IBOutlet UILabel *thankYouLabel; //TODO: add cool gradients here!

@end

@implementation ALMEndViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.doppelImageView setImage: self.theOne.mugshot];
    self.doppelImageView.layer.cornerRadius = 10;
    self.doppelImageView.clipsToBounds = YES;
    self.thankYouLabel.hidden = YES;
    self.thankYouLabel.layer.cornerRadius = 5;
    
    
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
         [self labelAnimation];
         
         self.thankYouLabel.layer.backgroundColor = [UIColor redColor].CGColor;
         
     }];
}

-(void)labelAnimation
{
    //To make this better, create a random function that picks a color from array. Create option 'repeat' for animation meth
    self.thankYouLabel.textColor = [UIColor clearColor];
    [UIView transitionWithView: self.thankYouLabel duration:1/4 options:UIViewAnimationOptionTransitionCrossDissolve animations:
     ^{
         self.thankYouLabel.textColor = [UIColor blackColor];
     } completion:^(BOOL finished)
    {[UIView animateWithDuration: 2 animations:
         ^{
             self.thankYouLabel.layer.backgroundColor = [UIColor greenColor].CGColor;
             
         } completion:^(BOOL finished)
    
      {[UIView animateWithDuration: 1 animations:
             ^{
                 self.thankYouLabel.layer.backgroundColor = [UIColor orangeColor].CGColor;
                 
             } completion: ^(BOOL fin)
        
        { [UIView animateWithDuration: 2 animations:
                                         
                 ^{
                     self.thankYouLabel.layer.backgroundColor = [UIColor yellowColor].CGColor;
                     
                 } completion: ^(BOOL fin)
           
            {[UIView animateWithDuration: 1 animations:
                                             
                     ^{
                         self.thankYouLabel.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
                         
                     } completion: ^(BOOL fin)
                {
                        self.thankYouLabel.textColor = [UIColor purpleColor];
                    }];
                 }];
             }];
         }];
     }];
    
    
}

-(void)setUpDoppelInfo
{
    [self.traitOne setText: self.theOne.traits.topDoppelTraits[0]];
    [self.traitTwo setText: self.theOne.traits.topDoppelTraits[1]];
    [self.traitThree setText: self.theOne.traits.topDoppelTraits[2]];
    [self.traitFour setText: self.theOne.traits.topDoppelTraits[3]];
    [self.TraitFive setText: self.theOne.traits.topDoppelTraits[4]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end