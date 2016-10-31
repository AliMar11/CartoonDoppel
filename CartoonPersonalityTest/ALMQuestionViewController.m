//
//  ALMQuestionViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMQuestionViewController.h"
#import "ALMQuestions.h"

@interface ALMQuestionViewController ()
@property (nonatomic, strong) ALMQuestions *sharedDatastore;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ALMQuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nextButton.hidden = YES;

    self.sharedDatastore = [ALMQuestions sharedData];
    [self viewSetup];
    
    self.questionCounter = 0;
    [self setUpTheQuest: self.questionCounter];
    self.questionTextView.layer.cornerRadius = 5;
    self.questionTextView.clipsToBounds = YES;
    [self.questionTextView.layer setBorderColor: [[[UIColor purpleColor] colorWithAlphaComponent: 0.2] CGColor]];
    [self.questionTextView.layer setBorderWidth: 1.0];
}

-(void)setUpTheQuest:(int)questionCounter
{
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         ALMQuestions *question = self.questionList[self.questionCounter];

        self.questionTextView.text = question.question;

        [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceA.allKeys[0]] forState:UIControlStateNormal];
        [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceB.allKeys[0]] forState: UIControlStateNormal];
        [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceC.allKeys[0]] forState: UIControlStateNormal];
        [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceD.allKeys[0]] forState: UIControlStateNormal];
         
         if (self.questionCounter == 10)
         {
             [self allQuestionsAnswered];
         }
     }];
}

-(IBAction)buttClicked:(id)sender
{
    UIButton *selected = [[UIButton alloc]init];
    selected = sender;
    
    for (NSDictionary *possibleAnswer in [self.questionList[self.questionCounter] answers])
    {
        if ([possibleAnswer.allKeys[0] isEqualToString: [selected titleForState:UIControlStateNormal]])
        {
          //  NSLog(@"\n\nWe've found the selected answer pal! -->%@\n\n", possibleAnswer.allValues[0]);
            
            [ALMCharacter tallyUserAnswers: self.theUser :possibleAnswer.allValues[0]];
        }
        
    }
    
    //TODO: Insert some awesome error handling here <3
    /*
    if (!)
    {
        NSLog(@"COULD NOT DEFINE CHOSEN ANSWER BRO!");
    }
     */
    
    self.questionCounter += 1;
    [self setUpTheQuest: self.questionCounter];

}

-(void)allQuestionsAnswered
{
    self.choiceAbutton.hidden = YES;
    self.choiceBbutton.hidden = YES;
    self.choiceCbutton.hidden = YES;
    self.choiceDbutton.hidden = YES;
    self.nextButton.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewSetup
{
    self.questionTextView.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    NSArray *buttonArray = [NSArray arrayWithObjects:self.choiceAbutton, self.choiceBbutton, self.choiceCbutton, self.choiceDbutton, nil];
    
//TODO: implement cool button gradients here ^_^
    CAGradientLayer *buttonGrades = [CAGradientLayer layer];

    for (UIButton *button in buttonArray)
    {
        //[button.layer insertSublayer: buttonGrades atIndex: 0];
        //[buttLayer setBorderColor: [[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor]];

        button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        CALayer *buttLayer = button.layer;
        buttonGrades.frame = button.bounds;
        button.backgroundColor = [UIColor grayColor];
        [buttLayer setCornerRadius: 7.0f];
        [buttLayer setBorderWidth: 1.3f];
   
        [button.titleLabel setFont: [UIFont fontWithName:@"Verdana-Bold" size:15]];
        [button setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ALMAnalysisViewController *analysisVC = segue.destinationViewController;
    ALMCharacter *playerTraits = self.theUser;
    analysisVC.playerTraits = playerTraits;
}

@end
