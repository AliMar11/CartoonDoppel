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
        
        NSLog(@"\n\nINITING sharedData\n\n");
        _sharedData = [[ALMQuestions alloc]init];

    });
    return _sharedData;
}

-(instancetype)initWithQuestion:(NSString *)question choiceA:(NSDictionary *)choiceA choiceB:(NSDictionary *)choiceB choiceC:(NSDictionary *)choiceC choiceD:(NSDictionary *)choiceD
{
    self = [super init];
    if (self)
        {
            _question = question;
            _choiceA = choiceA;
            _choiceB = choiceB;
            _choiceC = choiceC;
            _choiceD = choiceD;
        }
    return self;
}

+(void) createQuestions:(void(^)(NSMutableArray* questionArray))completion
{
    //access questionArray. Each question obj is a (nss)question w/(nsd)answers.
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    
    ALMQuestions *question = [[ALMQuestions alloc]initWithQuestion: @"dfgfdg"
                                                           choiceA: @{@"aaa" : @"a"}
                                                           choiceB: @{@"bbb" : @"b"}
                                                           choiceC: @{@"ccc" : @"c"}
                                                           choiceD: @{@"ddd" : @"d"}];
    [questionArray addObject: question];
    
    ALMQuestions *questionOne = [[ALMQuestions alloc] initWithQuestion: @"This is a Q"
                                                               choiceA: @{@"This is choiceA" : @"comidic"}
                                                               choiceB: @{@"This is choiceB" : @"arrogant"}
                                                               choiceC: @{@"This is choiceC" : @"selfish"}
                                                               choiceD: @{@"This is choiceD" : @"caring"}];
    
    [questionArray addObject: questionOne];
    
    completion(questionArray);
   
}

@end
