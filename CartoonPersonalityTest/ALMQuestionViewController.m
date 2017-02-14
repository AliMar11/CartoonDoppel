//
//  ALMQuestionViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ALMQuestionViewController.h"
#import "ALMQuestions.h"
#import "ALMBackgroundLayer.h"

@interface ALMQuestionViewController ()
@property (nonatomic, strong) ALMQuestions *sharedDatastore;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIStackView *questionStackview;
@property (weak, nonatomic) IBOutlet UILabel *progressIndicatorLabel;
@property (assign, nonatomic) int progress;

@end

@implementation ALMQuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nextButton.hidden = YES;

    self.sharedDatastore = [ALMQuestions sharedData];
    self.questionCounter = 0;
    self.progress = 1;
    [self viewSetup];
    
    [self setUpTheQuest: self.questionCounter];
    self.questionTextView.layer.cornerRadius = 5;
    self.questionTextView.clipsToBounds = YES;
    [self.questionTextView.layer setBorderColor: [[[UIColor purpleColor] colorWithAlphaComponent: 0.2] CGColor]];
    [self.questionTextView.layer setBorderWidth: 1.0];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CAGradientLayer *background = [ALMBackgroundLayer blueGradient];
    background.frame = self.view.bounds;
    [self.view.layer insertSublayer: background atIndex: 0];
    
}

//TO-DO rename properties in Questions class 
-(void)setUpTheQuest:(int)questionCounter
{
//Here we are grabbing data from ALMQuestions model class to present in this VC
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         self.progressIndicatorLabel.text = [NSString stringWithFormat: @"%d / %u", self.progress, self.questionList.count -1];

         ALMQuestions *question = self.questionList[self.questionCounter];
        self.questionTextView.text = question.question;
         
//below is how answers are set to each button
        [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceA.allKeys[0]] forState:UIControlStateNormal];
        [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceB.allKeys[0]] forState: UIControlStateNormal];
        [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceC.allKeys[0]] forState: UIControlStateNormal];
        [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceD.allKeys[0]] forState: UIControlStateNormal];
         
            }];
    
//if all questions are answered, trigger the 'next' button
    if (self.questionCounter == self.questionList.count -1)
    {
        self.progressIndicatorLabel.hidden = YES;
        [self allQuestionsAnswered];
    }
}

-(IBAction)buttClicked:(id)sender
{
    UIButton *selected = [[UIButton alloc]init];
    selected = sender;
    
    for (NSDictionary *possibleAnswer in [self.questionList[self.questionCounter] answers])
    {
        if ([possibleAnswer.allKeys[0] isEqualToString: [selected titleForState: UIControlStateNormal]])
        {
            [ALMAnalysis tallyUserAnswers: self.theUser :possibleAnswer.allValues[0]];
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
    self.progress += 1;

    [self setUpTheQuest: self.questionCounter];

}

-(void)allQuestionsAnswered
{
    self.questionStackview.hidden = YES;
    self.nextButton.layer.cornerRadius = 6;
    self.nextButton.clipsToBounds = YES;
    self.nextButton.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewSetup
{
//below is a customer UI setup for all 4 buttons
    self.questionTextView.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    NSArray *buttonArray = [NSArray arrayWithObjects: self.choiceAbutton, self.choiceBbutton, self.choiceCbutton, self.choiceDbutton, nil];
    
    CAGradientLayer *buttonGrades = [CAGradientLayer layer];

    for (UIButton *button in buttonArray)
    {
        CALayer *buttLayer = button.layer;
        buttonGrades.frame = button.bounds;
        button.backgroundColor = [UIColor grayColor];
        [button setAlpha: 0.9f];
        [buttLayer setCornerRadius: 7.0f];
        [buttLayer setBorderWidth: 1.3f];
        
        button.titleLabel.numberOfLines = 3;
        [button.titleLabel setAdjustsFontSizeToFitWidth: YES];
        [button.titleLabel setFont: [UIFont fontWithName: @"Verdana-Bold" size: 15]];
        [button setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];

//the code below helps to adjust the text for each button, if the frame of the text is bigger than the frame of the button, make the text a tad smaller...
        while (((CGSize) [button sizeThatFits: button.frame.size]).height > self.nextButton.frame.size.height)
        {
            button.titleLabel.font = [button.titleLabel.font fontWithSize: button.titleLabel.font.pointSize-1];
        }
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
