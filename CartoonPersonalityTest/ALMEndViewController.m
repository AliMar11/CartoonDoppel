//
//  ALMEndViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

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

}

-(void)setUpDuppleInfo
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
