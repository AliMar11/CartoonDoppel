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
    
    self.choiceAbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.choiceBbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.choiceCbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.choiceDbutton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

-(void)setUpTheQuest
{//this is helper meth that feeds the Q to the VC
    
    
    [ALMQuestions createQuestions: ^(NSMutableArray * questionsArray)
     {
         self.questionList = questionsArray;
         
         int questionCounter = 0;
         ALMQuestions *question = self.questionList[questionCounter];

         NSLog(@"\n\nQUESTION: %@\n", question);
         
        NSArray *key = [NSArray new];
        [key arrayByAddingObjectsFromArray: question.choiceA.allKeys];
         
             self.questionTextView.text = question.question;
             [self.choiceAbutton setTitle: [NSString stringWithFormat: @"%@",[NSArray arrayWithObject: question.choiceA.allKeys]] forState:UIControlStateNormal];
             [self.choiceBbutton setTitle: [NSString stringWithFormat: @"%@", [NSArray arrayWithObject: question.choiceB.allKeys]] forState: UIControlStateNormal];
              [self.choiceCbutton setTitle: [NSString stringWithFormat: @"%@", [NSArray arrayWithObject: question.choiceC.allKeys]] forState:UIControlStateNormal];
              [self.choiceDbutton setTitle: [NSString stringWithFormat: @"%@", [NSArray arrayWithObject: question.choiceD.allKeys]] forState:UIControlStateNormal];
         
             NSLog(@"\n\nCURRENT question:\n%@\n\n\n", question);
     }];
}

-(IBAction)buttClicked:(id)sender
{
    NSLog(@"\n\nA BUTTON CLICKED DETECTED!\n\n\n");
    //get the value of ButtonChoice.value and ++ it to the users trait characteristics.

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
