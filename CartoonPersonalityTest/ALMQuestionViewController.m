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

//this is helper meth that feeds the Q to the VC
-(void)setUpTheQuest:(int)questionCounter
{
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         
         ALMQuestions *question = self.questionList[self.questionCounter];
         
         NSLog(@"\n\nCOUNTER:%d  QUESTIONLIST COUNT: %ld\n\n", self.questionCounter, [self.questionList indexOfObject: question]);

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
    NSLog(@"\n\nBUTTON CLICKED DETECTED!\n\n");

    [ALMCharacter tallyUserAnswers];
    
    self.questionCounter += 1;
    [self setUpTheQuest: self.questionCounter];

}

-(void)allQuestionsAnswered
{
    //when questionsArray == 0 call segue to analysis VC and appear the next button
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
    self.choiceAbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.choiceAbutton.titleLabel setFont: [UIFont fontWithName:@"Verdana-Bold" size:18]];
    [self.choiceAbutton setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];
    
    self.choiceBbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.choiceBbutton.titleLabel setFont: [UIFont fontWithName:@"Verdana-Bold" size:18]];
    [self.choiceBbutton setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];
    
    self.choiceCbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.choiceCbutton.titleLabel setFont: [UIFont fontWithName:@"Verdana-Bold" size:18]];
    [self.choiceCbutton setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];
    
    self.choiceDbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.choiceDbutton.titleLabel setFont: [UIFont fontWithName:@"Verdana-Bold" size:18]];
    [self.choiceDbutton setTitleColor: [UIColor purpleColor] forState: UIControlStateNormal];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //create VC destinationSegue
    //pass userCharacterPoints
    
   // ALMAnalysisViewController *analysisVC = segue.destinationViewController;
   // ALMCharacter *characterPoints = self.characterPoints;
   // analysisVC.characterPoints = characterPoints;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
