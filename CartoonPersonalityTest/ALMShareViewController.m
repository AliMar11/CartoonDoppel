//
//  ALMShareViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 1/15/17.
//  Copyright © 2017 AliApps. All rights reserved.
//

#import "ALMShareViewController.h"
#import "ALMButtonLayer.h"
#import "ALMBackgroundLayer.h"

@interface ALMShareViewController ()
@property (strong, nonatomic)  NSString *blurb;

@end

@implementation ALMShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"\n\nTHE ONE ==> %@ \n\n", self.doppel.characterName);
    
        self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by downloading the Cartoon Doppel app on the App Store- coming out next week! I'm awesome and got to play it early by going to Playcrafter's Winter Game Expo : p I got %@!", self.doppel.characterName];
    
//    self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by downloading the Cartoon Doppel app on the App Store I got %@!", self.doppel.characterName];

}

-(void)viewWillAppear:(BOOL)animated
{
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
}

- (IBAction)faceBookButtonTapped:(id)sender
{
    NSLog(@"\nFB share tapped");
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType: SLServiceTypeFacebook];
    
    [controller setInitialText: self.blurb];
    [controller addImage: self.doppel.mugshot];
    
    [self presentViewController: controller animated: YES completion: Nil];
}

- (IBAction)twitterButtonTapped:(id)sender
{
    NSLog(@"twitter Share button tapped");
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType: SLServiceTypeTwitter];
    
    [controller setInitialText: self.blurb];
    [controller addImage: self.doppel.mugshot];
    
    [self presentViewController: controller animated: YES completion: Nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
