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

-(void)setUpTheUser
{
    UIAlertController *enterUserName = [UIAlertController alertControllerWithTitle:@"Let's get started!" message: @"Enter your name" preferredStyle: (UIAlertControllerStyleAlert)];
        
    [enterUserName addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"your name here";
         textField.textColor = [UIColor blueColor];
         textField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    UIAlertAction *enterUserNameAction = [UIAlertAction actionWithTitle:@"Done!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                          {
                                              self.userName = textField.text;
                                              
                                              [ALMCharacter createUser: self.userName withCompletion:^(ALMCharacter *user)
                                              {
                                                   self.player = user;
                                              }];
                                              
                                              [self performSegueWithIdentifier: @"questionVCSegue" sender: self];
                                          }];

//TODO: come up with a better way to grab the userName Textfield
    [enterUserName addAction: enterUserNameAction];
    [self presentViewController: enterUserName animated: YES completion: nil];
          }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)startTapped:(id)sender
{
    [self setUpTheUser];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"questionVCSegue"])
    {
        ALMQuestionViewController *questionVC = segue.destinationViewController;
        questionVC.theUser = self.player;
    }

}

@end
