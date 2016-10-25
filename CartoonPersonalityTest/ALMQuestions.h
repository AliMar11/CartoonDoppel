//
//  ALMQuestions.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/22/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMCharacter.h"

@interface ALMQuestions : NSObject
// property array of questions
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSDictionary *choiceA;
@property (nonatomic, strong) NSDictionary *choiceB;
@property (nonatomic, strong) NSDictionary *choiceC;
@property (nonatomic, strong) NSDictionary *choiceD;

+(instancetype)sharedData;
+(void) createQuestions:(void(^)(NSMutableArray * questionArray))completion;
-(instancetype)initWithQuestion: (NSString*) question
                        choiceA: (NSDictionary*) choiceA
                        choiceB: (NSDictionary*) choiceB
                        choiceC: (NSDictionary*) choiceC
                        choiceD: (NSDictionary*) choiceD;


@end
