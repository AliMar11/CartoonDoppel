//
//  ViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMStartScreenViewController.h"

@interface ALMStartScreenViewController () 

@end

@implementation ALMStartScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)startTapped:(id)sender
{
    ALMQuestionViewController *questionVC = [[ALMQuestionViewController alloc] init];
    [self presentViewController: questionVC animated: YES completion: nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
