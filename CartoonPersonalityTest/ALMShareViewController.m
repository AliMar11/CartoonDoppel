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
#import <TwitterKit/TwitterKit.h>

@interface ALMShareViewController ()
@property (strong, nonatomic)  NSString *blurb;

@end

@implementation ALMShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"\n\nTHE ONE ==> %@ \n\n", self.doppel.characterName);
    
        self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by playing Cartoon Doppel app! I got %@ %@", self.doppel.characterName, self.doppel.mugshot];
    
    NSString *mugshotPath = [NSString stringWithFormat: @"/CartoonPErsonalityTest/Assets/%@", self.doppel.characterName];
    
    NSURL *doppelMugshot = [[NSURL alloc]initFileURLWithPath: mugshotPath];
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
    //here link to store page?? Or just delete and use photo and description?
    //include user's dupple
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    
    //this is what I would want for custome sharing info
//    content.contentTitle = @"I just played Who's your Doppel";
//    content.contentDescription = self.blurb;
//    content.imageURL = doppelMugshot;
    
    FBSDKShareButton *facebookShareButton = [[FBSDKShareButton alloc] init];
    facebookShareButton.shareContent = content;
    
    CGFloat facebookButtonX = self.view.center.x;
    CGFloat centerY = self.view.center.y;
    [facebookShareButton setCenter: CGPointMake(facebookButtonX, centerY)];
    
    [self.view addSubview: facebookShareButton];
    
    [self composeTweet];
}

-(void)composeTweet
{
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    //we can also send a url in the blurb
    [composer setText: self.blurb];
    
    //Here get a picture of the app icon
    [composer setImage:[UIImage imageNamed: @"fabric"]];
    
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
