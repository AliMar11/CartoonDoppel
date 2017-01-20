//
//  ALMTwitterViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 1/19/17.
//  Copyright © 2017 AliApps. All rights reserved.
//

#import "ALMTwitterViewController.h"
#import <TwitterKit/TwitterKit.h>
#import "Twitter/Twitter.h"

@interface ALMTwitterViewController ()
@property (nonatomic, strong) NSString *blurb;

@end

@implementation ALMTwitterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"\n\nTHE ONE ==> %@ \n\n", self.doppel.characterName);
    
    self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by playing Cartoon Doppel app! I got %@ %@", self.doppel.characterName, self.doppel.mugshot];
}

-(void)viewDidAppear:(BOOL)animated
{
    
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    //we can also send a url in the blurb
    [composer setText: self.blurb];
    
    //Here get a picture of the app icon
    [composer setImage:[UIImage imageNamed: @"fabric"]];
    
    //[UIView transitionFromView:self.view toView: (UIView*)composer duration:0.4 options:UIViewAnimationOptionCurveLinear completion:nil];
    // Called from the viewController
    [composer showFromViewController: self completion:^(TWTRComposerResult result)
     {
         if (result == TWTRComposerResultCancelled)
         {
             NSLog(@"Tweet composition cancelled");
         }
         
         else
         {
             NSLog(@"Sending Tweet!");
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
