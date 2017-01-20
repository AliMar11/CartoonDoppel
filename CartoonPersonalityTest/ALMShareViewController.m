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
#import "ALMTwitterViewController.h"

@interface ALMShareViewController ()
@property (strong, nonatomic)  NSString *blurb;

@end

@implementation ALMShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"\n\nTHE ONE ==> %@ \n\n", self.doppel.characterName);
    
        self.blurb = [NSString stringWithFormat: @"Ever wonder what cartoon character you'd be? Find out by playing Cartoon Doppel app! I got %@ %@", self.doppel.characterName, self.doppel.mugshot];
    
    [self createMediaButtons];
    
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

    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    FBSDKShareButton *facebookShareButton = [[FBSDKShareButton alloc] init];
    facebookShareButton.shareContent = content;
    CGFloat facebookButtonX = self.view.center.x;
    CGFloat centerY = self.view.center.y;
    [facebookShareButton setCenter: CGPointMake(facebookButtonX, centerY)];
    [self.view addSubview: facebookShareButton];
    
    
    CGFloat twitterX = self.view.center.x;
    CGFloat twitterY = self.view.center.y;

    UIButton *twitterButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 70, 30)];
      [twitterButton setCenter: CGPointMake(twitterX, twitterY + 70)];
    
    [self.view addSubview: twitterButton];
    twitterButton.backgroundColor = [UIColor darkGrayColor];

}

-(void)viewWillAppear:(BOOL)animated
{
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ALMTwitterViewController *TwitterVC = segue.destinationViewController;
    TwitterVC.doppel = self.doppel;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
