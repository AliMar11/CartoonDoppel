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
@property (strong, nonatomic) UIButton *TwitterButton;
@property (strong, nonatomic) UIStoryboardSegue *twitterSegue;

@end

@implementation ALMShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"\n\nTHE ONE ==> %@ \n\n", self.doppel.characterName);
    
        self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by playing Cartoon Doppel app! I got %@ %@", self.doppel.characterName, self.doppel.mugshot];
    
    [self createMediaButtons];
}

-(void)viewWillAppear:(BOOL)animated
{
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
}

-(void)createMediaButtons
{
    // NSString *mugshotPath = [NSString stringWithFormat: @"/CartoonPErsonalityTest/Assets/%@", self.doppel.characterName];
    
    //  NSURL *doppelMugshot = [[NSURL alloc]initFileURLWithPath: mugshotPath];
    
    //here link to store page?? Or just delete and use photo and description?
    //include user's dupple
    
    
    //this is what I would want for custome sharing info
    //    content.contentTitle = @"I just played Who's your Doppel";
    //    content.contentDescription = self.blurb;
    //    content.imageURL = doppelMugshot;
    
    CGFloat twitterX = self.view.center.x;
    CGFloat twitterY = self.view.center.y;
    
    UIButton *twitterButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 70, 30)];
    [twitterButton setCenter: CGPointMake(twitterX, twitterY + 70)];
    
    [self.view addSubview: twitterButton];
    twitterButton.backgroundColor = [UIColor darkGrayColor];
    
    [twitterButton addTarget: self action: @selector(triggerSegue) forControlEvents: UIControlEventTouchUpInside];
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    FBSDKShareButton *facebookShareButton = [[FBSDKShareButton alloc] init];
    facebookShareButton.shareContent = content;
    CGFloat facebookButtonX = self.view.center.x;
    CGFloat centerY = self.view.center.y;
    [facebookShareButton setCenter: CGPointMake(facebookButtonX, centerY)];
    [self.view addSubview: facebookShareButton];
}

#pragma mark - Navigation

-(void)triggerSegue
{
    [self performSegueWithIdentifier: @"tweetSegue" sender: self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)_twitterSegue sender:(id)sender
{
    ALMTwitterViewController *twitterVC = self.twitterSegue.destinationViewController;
    twitterVC.doppel = self.doppel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
