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
    
    UITextField *nameTextField = [[UITextField alloc]init];
    
    [enterUserName addTextFieldWithConfigurationHandler:^(UITextField *nameTextField)
     {
         nameTextField.placeholder = @"your name here";
         nameTextField.textColor = [UIColor blueColor];
         nameTextField.borderStyle = UITextBorderStyleRoundedRect;
     }];
    
    UIAlertAction *enterUserNameAction = [UIAlertAction actionWithTitle:@"Done!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                          {
                                              self.userName = nameTextField.text;
                                              
                                              [ALMCharacter createUser:(NSString*)self.userName];
                                              
                                              //[self dismissViewControllerAnimated: YES completion:nil];
                                            //  ALMQuestionViewController *questionVC = [[ALMQuestionViewController alloc] init];
                                              [self performSegueWithIdentifier: @"questionVCSegue" sender:nil];
                                        
                                          }];
    
    [enterUserName addAction: enterUserNameAction];
    
    [self presentViewController: enterUserName animated: YES completion: nil];
    
    
}

- (IBAction)startTapped:(id)sender
{
    [self setUpTheUser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
      ALMQuestionViewController *questionVC = [[ALMQuestionViewController alloc] init];
      questionVC = segue.destinationViewController;
}

@end
