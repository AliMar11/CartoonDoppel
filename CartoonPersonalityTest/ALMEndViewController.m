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

@interface ALMEndViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *duppleImageView;
@property (weak, nonatomic) IBOutlet UITextField *traitOne;
@property (weak, nonatomic) IBOutlet UITextField *traitTwo;
@property (weak, nonatomic) IBOutlet UITextField *traitThree;
@property (weak, nonatomic) IBOutlet UITextField *traitFour;
@property (weak, nonatomic) IBOutlet UITextField *TraitFive;
@property (weak, nonatomic) IBOutlet UITextField *thankYou; //TODO: add cool gradients here!

@end

@implementation ALMEndViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.duppleImageView setImage: self.theOne.mugshot];
    self.duppleImageView.layer.cornerRadius = 10;
    self.duppleImageView.clipsToBounds = YES;
    
    [self setUpDuppleInfo];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
    [UIView animateWithDuration: 1.2 delay: 0.9 options: UIViewAnimationOptionCurveEaseIn animations:
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

     } completion: nil];
}

-(void)setUpDuppleInfo
{
    [self.traitOne setText: self.theOne.traits.topDuppleTraits[0]];
    [self.traitTwo setText: self.theOne.traits.topDuppleTraits[1]];
    [self.traitThree setText: self.theOne.traits.topDuppleTraits[2]];
    [self.traitFour setText: self.theOne.traits.topDuppleTraits[3]];
    [self.TraitFive setText: self.theOne.traits.topDuppleTraits[4]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
