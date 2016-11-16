//
//  ALMEndViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ALMEndViewController.h"

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
    
    [self.traitOne setText: self.theOne.traits.topDuppleTraits[0]];
    [self.traitTwo setText: self.theOne.traits.topDuppleTraits[1]];
    [self.traitThree setText: self.theOne.traits.topDuppleTraits[2]];
    [self.traitFour setText: self.theOne.traits.topDuppleTraits[3]];
    [self.TraitFive setText: self.theOne.traits.topDuppleTraits[4]];

}

-(void)setUpDuppleInfo
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
