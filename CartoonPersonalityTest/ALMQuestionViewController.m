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
{//perhaps when a Q is anwsered, we delete it from the array? this way the next question will always be item 0. Or we create a counter to keep track
    
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         
         NSLog(@"\n\nSELF.Qlist=\n%@\n\n", self.questionList);
         
         for (ALMQuestions *question in  self.questionList)
         {
             self.questionTextField.text = question.question;
              [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceA] forState:UIControlStateNormal];
              [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceB] forState:UIControlStateNormal];
              [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceC] forState:UIControlStateNormal];
              [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceD] forState:UIControlStateNormal];
             
             NSLog(@"\n\nCURRENT question:\n%@\n\n\n", question);
             
         }
         
     }];
    //[ALMQuestions createQuestions];
    
//    [[ALMQuestions sharedData] createQuestions: ^(NSMutableArray *questionsArray)
//     {
//         self.questionList = questionsArray;
//         
//         for (ALMQuestions *question in  self.questionList)
//         {
//             self.questionTextField.text = question.question;
////             [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceA] forState:UIControlStateNormal];
////             [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceB] forState:UIControlStateNormal];
////             [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceC] forState:UIControlStateNormal];
////             [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", question.choiceD] forState:UIControlStateNormal];
//             
//         }
//         
//     }];
    
    
    /*
    self.questionTextField = self.questions[@"Q"];
    self.choiceAbutton = self.questions[@"A"];
    self.choiceBbutton = self.questions[@"B"];
    self.choiceCbutton = self.questions[@"C"];
    self.choiceDbutton = self.questions[@"D"];
     */
    
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
