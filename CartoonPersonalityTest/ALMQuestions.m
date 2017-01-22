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
    
    ALMQuestions *emotionalOne = [[ALMQuestions alloc]initWithQuestion: @"You're on line for your morning java and someone cuts in front of you... you"
                                                               answers: @[]
                                                           choiceA: @{@"Apologize and inform them there's a line." : @"Sympathetic"}
                                                           choiceB: @{@"Get mad but decide it's best not to say anything." : @"Negative"}
                                                           choiceC: @{@"Sheepishly tell them you've been waiting in line." : @"Passive"}
                                                           choiceD: @{@"Give them a piece of youe mind! Who do they think they are?!" : @"Aggressive"}];
    [questionArray addObject: emotionalOne];
    
    ALMQuestions *esteemOne = [[ALMQuestions alloc] initWithQuestion: @"Your dream job includes..."
                                                             answers: @[]
                                                               choiceA: @{@"Idk, I'm just trying to do my own thing." : @"Passive"}
                                                               choiceB: @{@"I to do something people look up to." : @"Careful"}
                                                               choiceC: @{@"I'm gonna lead!" : @"Determined"}
                                                               choiceD: @{@"I want to create." : @"Courage"}];
    
    [questionArray addObject: esteemOne];
    
    ALMQuestions *personalityOne = [[ALMQuestions alloc] initWithQuestion: @"When confronted with a problem..."
                                                                  answers: @[]
                                                               choiceA: @{@"I tend to think my way to my goal." : @"Clever"}
                                                               choiceB: @{@"I tend to think a way around the problem." : @"Creative"}
                                                               choiceC: @{@"I fight whatever is in my way." : @"Sassy"}
                                                               choiceD: @{@"I think of how the problem affects me and how to solve it." : @"Shy"}];
    
    [questionArray addObject: personalityOne];
    
    ALMQuestions *personalityTwo = [[ALMQuestions alloc] initWithQuestion: @"You tend to look back at past problems and..."
                                                                  answers: @[]
                                                    choiceA: @{@"Make fun of them." : @"Comedic"}
                                                    choiceB: @{@"Think of how I'll do better next time!" : @"Enthusiastic"}
                                                    choiceC: @{@"Hmmm... that sucked." : @"Dorky"}
                                                    choiceD: @{@"I... am always right." : @"Sassy"}];
    
    [questionArray addObject: personalityTwo];
 //Below is Q five
    ALMQuestions *emotionalTwo = [[ALMQuestions alloc] initWithQuestion: @"When I realize I'm succeeding I tend to think..."
                                                                answers: @[]
                                                    choiceA: @{@"I gotta keep this up." : @"Aggressive"}
                                                    choiceB: @{@"This means I'm gonna mess up at some point soon..." : @"Negative"}
                                                    choiceC: @{@"This is awesome!" : @"Optimistic"}
                                                    choiceD: @{@"Cool I guess." : @"Passive"}];
    
    [questionArray addObject: emotionalTwo];
    
    ALMQuestions *personalityThree = [[ALMQuestions alloc] initWithQuestion: @"You took an exam you weren't sure about, what do you expect of the outcome?"
                                                                    answers: @[]
                                                    choiceA: @{@"I expect I did okay." : @"Enthusiastic"}
                                                    choiceB: @{@"Well, I won't be able to do as bad next time around!" : @"Comedic"}
                                                    choiceC: @{@"I better pass that stupic test." : @"Despicable"}
                                                    choiceD: @{@"eeeeh, I have no idea." : @"Dorky"}];
    
    [questionArray addObject: personalityThree];
    
    ALMQuestions *esteemTwo = [[ALMQuestions alloc] initWithQuestion: @"You're given an opportunity to spend a week in another country you think..."
                                                             answers: @[]
                                                    choiceA: @{@"What! This is amazing- can't wait!" : @"Courage"}
                                                    choiceB: @{@"There are a million things that can go wrong." : @"Careful"}
                                                    choiceC: @{@"Ha! Time to do all the things I usually can't!." : @"Despicable"}
                                                    choiceD: @{@"Why me?" : @"Naive"}];
    
    [questionArray addObject: esteemTwo];
    
    ALMQuestions *esteemThree = [[ALMQuestions alloc] initWithQuestion: @"Someone just wrongly put you on blast... what do you do?"
                                                               answers: @[]
                                                    choiceA: @{@"Let them know they're wrong." : @"Courage"}
                                                    choiceB: @{@"You'll talk to them one-on-one." : @"Careful"}
                                                    choiceC: @{@"Wow, they must really not like me." : @"Naive"}
                                                    choiceD: @{@"Ooooh you want to do that? It's on." : @"Troublemaker"}];
    
    [questionArray addObject: esteemThree];
    
    ALMQuestions *personalityFour = [[ALMQuestions alloc] initWithQuestion: @"Time to pick a movie with your friends! What are you thinking?"
                                                                   answers: @[]
                                                    choiceA: @{@"I'll watch whatever ^_^" : @"Enthusiastic"}
                                                    choiceB: @{@"I'm really only interested in one or two." : @"Despicable"}
                                                    choiceC: @{@"I don't know what to watch... you pick." : @"Dorky"}
                                                    choiceD: @{@"We are watching this one." : @"Sassy"}];
    
    [questionArray addObject: personalityFour];
 //Below is Q 10
    ALMQuestions *esteemFour = [[ALMQuestions alloc] initWithQuestion: @"You see a scared baby pup in the street, what do you do?"
                                                              answers: @[]
                                                    choiceA: @{@"Go get him!" : @"Courage"}
                                                    choiceB: @{@"Wait is this a prank?" : @"Troublemaker"}
                                                    choiceC: @{@"I'm sure it'll be fine, I'm not going out there." : @"Naive"}
                                                    choiceD: @{@"Call it to you from the edge of the street when it's clear." : @"Careful"}];
    
    [questionArray addObject: esteemFour];
    
    ALMQuestions *blank = [[ALMQuestions alloc] initWithQuestion: @"Hey you! With the FACE...time to figure out your twin.Press 'next' button dork!"
                                                         answers: @[]
                                                               choiceA: @{@" " : @" "}
                                                               choiceB: @{@" " : @" "}
                                                               choiceC: @{@" " : @" "}
                                                               choiceD: @{@" " : @" "}];
    
    [questionArray addObject: blank];
    
    completion(questionArray);
}

@end
