//
//  ALMStartScreenViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMStartScreenViewController.h"
#import "ALMBackgroundLayer.h"

@interface ALMStartScreenViewController () 
@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation ALMStartScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    self.startButton.layer.cornerRadius = 6;
    self.startButton.clipsToBounds = YES;
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
}

- (IBAction)startTapped:(id)sender
{
    [self setUpTheUser];
}

//Ask for user name in order to tie their name to their player profile
-(void)setUpTheUser
{
    UIAlertController *enterUserName = [UIAlertController alertControllerWithTitle: @"Let's get started!" message: @"Enter your name" preferredStyle: (UIAlertControllerStyleAlert)];
    
    [enterUserName addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"your name here";
         textField.textColor = [UIColor blueColor];
         textField.borderStyle = UITextBorderStyleRoundedRect;
         
         UIAlertAction *enterUserNameAction = [UIAlertAction actionWithTitle: @"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                   {
                       self.userName = textField.text;
                       
                       [ALMCharacter createUser: self.userName withCompletion:^(ALMCharacter *user)
                        {
                            self.player = user;
                        }];
                       
                       [self performSegueWithIdentifier: @"questionVCSegue" sender: self];
                   }];
         
         //TODO: come up with a better way to grab the userName Textfield-- placing the action here is how I grab user's name before segue is called
         [enterUserName addAction: enterUserNameAction];
         [self presentViewController: enterUserName animated: YES completion: nil];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
