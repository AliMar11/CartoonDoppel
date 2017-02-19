//
//  ALMQuestions.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/22/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMQuestions.h"
#import "ALMQuestionViewController.h"

@implementation ALMQuestions

#pragma mark <singleton>
+(instancetype)sharedData
{
    static ALMQuestions *_sharedData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedData = [[ALMQuestions alloc]init];

    });
    return _sharedData;
}

-(instancetype)initWithQuestion:(NSString *)question
                        answers:(NSArray *)answers
                        choiceA:(NSDictionary *)choiceA
                        choiceB:(NSDictionary *)choiceB
                        choiceC:(NSDictionary *)choiceC
                        choiceD:(NSDictionary *)choiceD
{
    self = [super init];
    if (self)
        {
            _question = question;
            _answers = @[choiceA, choiceB, choiceC, choiceD];
            _choiceA = choiceA;
            _choiceB = choiceB;
            _choiceC = choiceC;
            _choiceD = choiceD;
        }
    return self;
}

+(void) createQuestions:(void(^)(NSMutableArray* questionArray))completion
{
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    
    ALMQuestions *questionOne = [[ALMQuestions alloc]initWithQuestion: @"You're on line for your morning java and someone cuts in front of you. How do you react?"
                                                               answers: @[]
                                                           choiceA: @{@"Apologize and inform them there's a line." : @"Sympathetic"}
                                                           choiceB: @{@"Get mad but decide it's best not to say anything." : @"Negative"}
                                                           choiceC: @{@"Sheepishly tell them you've been waiting in line." : @"Shy"}
                                                           choiceD: @{@"Give them a piece of your mind! Who do they think they are?" : @"Aggressive"}];
    [questionArray addObject: questionOne];
    
    ALMQuestions *questionTwo = [[ALMQuestions alloc] initWithQuestion: @"Your dream job entails..."
                                                             answers: @[]
                                                               choiceA: @{@"Idk, I'm just trying to do my own thing." : @"Passive"}
                                                               choiceB: @{@"Something people look up to." : @"Careful"}
                                                               choiceC: @{@"I'm gonna lead!" : @"Determined"}
                                                               choiceD: @{@"I want to create." : @"Creative"}];
    
    [questionArray addObject: questionTwo];
    
    ALMQuestions *questionThree = [[ALMQuestions alloc] initWithQuestion: @"When confronted with a problem at work or at home you tend to..."
                                                                  answers: @[]
                                                               choiceA: @{@"Break up the issue, step by step, in order to reach my goal." : @"Clever"}
                                                               choiceB: @{@"Think of a solution that avoids the issue and still reaches my goal." : @"Creative"}
                                                               choiceC: @{@"I fight whatever is in my way." : @"Sassy"}
                                                               choiceD: @{@"The problem must be there for a reason. It's probably not worth fighting." : @"Shy"}];
    
    [questionArray addObject: questionThree];
    
    ALMQuestions *questionFour = [[ALMQuestions alloc] initWithQuestion: @"How do you view past problems?"
                                                                  answers: @[]
                                                    choiceA: @{@"I make fun of them." : @"Comedic"}
                                                    choiceB: @{@"I think of how I'll do better next time!" : @"Enthusiastic"}
                                                    choiceC: @{@"Hmmm... that sucked." : @"Dorky"}
                                                    choiceD: @{@"I... am always right." : @"Sassy"}];
    
    [questionArray addObject: questionFour];

    ALMQuestions *questionFive = [[ALMQuestions alloc] initWithQuestion: @"When I realize I'm succeeding I tend to think..."
                                                                answers: @[]
                                                    choiceA: @{@"I gotta keep this up." : @"Aggressive"}
                                                    choiceB: @{@"This means I'm gonna mess up at some point soon..." : @"Negative"}
                                                    choiceC: @{@"This is awesome!" : @"Optimistic"}
                                                    choiceD: @{@"Cool I guess." : @"Passive"}];
    
    [questionArray addObject: questionFive];
    
    ALMQuestions *questionSix = [[ALMQuestions alloc] initWithQuestion: @"You took an exam and have no idea how you did, what do you expect of the outcome?"
                                                                    answers: @[]
                                                    choiceA: @{@"I expect I did okay." : @"Enthusiastic"}
                                                    choiceB: @{@"Well, if I fail won't do as bad next time!" : @"Comedic"}
                                                    choiceC: @{@"I better pass that stupid test." : @"Despicable"}
                                                    choiceD: @{@"Eeeeh, I have no idea." : @"Dorky"}];
    
    [questionArray addObject: questionSix];
    
    ALMQuestions *questionSeven = [[ALMQuestions alloc] initWithQuestion: @"You're given an opportunity to spend a week in another country. How do you feel about the trip?"
                                                             answers: @[]
                                                    choiceA: @{@"What! This is amazing- can't wait!" : @"Courage"}
                                                    choiceB: @{@"There are a million things that can go wrong." : @"Careful"}
                                                    choiceC: @{@"Ha! Time to do all the things I usually can't!" : @"Despicable"}
                                                    choiceD: @{@"I wonder what the culture will be like." : @"Sympathetic"}];
    
    [questionArray addObject: questionSeven];
    
    ALMQuestions *questionEight = [[ALMQuestions alloc] initWithQuestion: @"Someone just wrongly put you on blast... what do you do?"
                                                               answers: @[]
                                                    choiceA: @{@"Let them know they're wrong." : @"Courage"}
                                                    choiceB: @{@"Talk to them one-on-one. I don't want to cause a fight." : @"Careful"}
                                                    choiceC: @{@"That sucks but I'll clear things up later." : @"Determined"}
                                                    choiceD: @{@"Ooooh you want to do that? It's on." : @"Troublemaker"}];
    
    [questionArray addObject: questionEight];
    
    ALMQuestions *questionNine = [[ALMQuestions alloc] initWithQuestion: @"Time to pick a movie with your friends! What are you thinking?"
                                                                   answers: @[]
                                                    choiceA: @{@"I'll watch whatever." : @"Enthusiastic"}
                                                    choiceB: @{@"I'm interested in one or two, we can choose from those." : @"Despicable"}
                                                    choiceC: @{@"I don't know what to watch... you pick." : @"Dorky"}
                                                    choiceD: @{@"We are watching this one." : @"Sassy"}];
    
    [questionArray addObject: questionNine];

    ALMQuestions *questionTen = [[ALMQuestions alloc] initWithQuestion: @"You see a puppy in the middle of a street- what is your first thought?"
                                                              answers: @[]
                                                    choiceA: @{@"Go get him!" : @"Courage"}
                                                    choiceB: @{@"Ha! Who's dog got loose?" : @"Troublemaker"}
                                                    choiceC: @{@"It must be so scared!" : @"Sincere"}
                                                    choiceD: @{@"Call it from the edge of the street when it's clear." : @"Careful"}];
    
    [questionArray addObject: questionTen];
    
    ALMQuestions *questionEleven = [[ALMQuestions alloc] initWithQuestion: @"Someone complimented your work. How do you react?"
                                                                  answers: @[]
                                                                  choiceA: @{@"Thank them and think of a point to compliment them as well." : @"Sincere"}
                                                                  choiceB: @{@"That was so nice!": @"Optimistic"}
                                                                  choiceC:@{@"Thank them and share more information about the job.": @"Creative"}
                                                                  choiceD: @{@"Thank them and come back with a joke." :@"Clever"}];
    
    [questionArray addObject: questionEleven];

    ALMQuestions *questionTwelve = [[ALMQuestions alloc] initWithQuestion: @"One of your favorite pastimes include..." answers: @[] choiceA: @{@"Man, I don't know." : @"Negative"} choiceB: @{@"I enjoy hanging out with my friends.": @"Comedic"} choiceC: @{@"Playing an instrument or making crafts.": @"Creative"} choiceD: @{@"I priortitize chores and play- that feels good to me.": @"Clever"}];
    
    [questionArray addObject: questionTwelve];
    
    ALMQuestions *blank = [[ALMQuestions alloc] initWithQuestion: @"That's all we need! Press the 'next' button for your results."
                                                         answers: @[]
                                                               choiceA: @{@" " : @" "}
                                                               choiceB: @{@" " : @" "}
                                                               choiceC: @{@" " : @" "}
                                                               choiceD: @{@" " : @" "}];
    
    [questionArray addObject: blank];
    
    completion(questionArray);
}

@end
