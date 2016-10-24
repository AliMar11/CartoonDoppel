//
//  ALMQuestionViewController.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMAnalysisViewController.h"
#import "ALMCharacter.h"

@interface ALMQuestionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UIButton *choiceAbutton;
@property (weak, nonatomic) IBOutlet UIButton *choiceBbutton;
@property (weak, nonatomic) IBOutlet UIButton *choiceCbutton;
@property (weak, nonatomic) IBOutlet UIButton *choiceDbutton;
@property (strong, nonatomic) NSMutableArray *questionList;
@property (assign, nonatomic) int questionCounter;

-(void)setUpTheQuest:(int)questionCounter;

@end
