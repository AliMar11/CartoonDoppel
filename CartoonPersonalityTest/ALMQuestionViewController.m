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


@end

@implementation ALMQuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sharedDatastore = [ALMQuestions sharedData];
  
    [self setUpTheQuest];
    
}

-(void)setUpTheQuest
{//this is helper meth that feeds the Q to the VC
    
    
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         
         NSLog(@"\n\nSELF.Qlist=\n%@\n\n", self.questionList);
         
   //      for (ALMQuestions *question in  self.questionList)
    //     {
         ALMQuestions *question = self.questionList.firstObject;
         
             self.questionTextField.text = question.question;
              [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceA[@"aaa"] ] forState:UIControlStateNormal];
              [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceB[@"bbb"]] forState:UIControlStateNormal];
              [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceC[@"ccc"]] forState:UIControlStateNormal];
              [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceD[@"ddd"]] forState:UIControlStateNormal];
             
             NSLog(@"\n\nCURRENT question:\n%@\n\n\n", question);
         
     }];
    
    
}

-(void)allQuestionsAnswered
{
    //when questionsArray == 0 call segue to analysis VC
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //create VC destinationSegue
    //pass userCharacterPoints
    
   // ALMAnalysisViewController *analysisVC = segue.destinationViewController;
    //ALMCharacter *characterPoints = self.characterPoints;
   // analysisVC.characterPoints = characterPoints;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
