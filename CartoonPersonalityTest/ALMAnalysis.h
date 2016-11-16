//
//  ALMAnalysis.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/28/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALMCharacter.h"

@interface ALMAnalysis : NSObject

@property (nonatomic, strong) ALMCharacter *player;
@property (nonatomic, strong) NSArray *topFiveHanchos;

+(void)tallyUserAnswers:(ALMCharacter*) player :(ALMCharacterTraits *) selectedTrait;

+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSArray * characterList))completion;

+(void)sortUserTraits:(ALMCharacter*)player withCompletion: (void(^)(NSArray *sortedTraitsArray))completion;

+(void)dataAnalysis:(NSArray*)playerTraits :(NSArray *)sortedDupple withCompletion: (void(^)(NSArray *topFiveHanchos))completion;

@end