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

+(void)dataAnalysis:(ALMCharacter*)player withCompletion: (void(^)(NSArray *topFive))completion;
//-(void)orderTheTraits: (ALMCharacter*)playerData : (NSDictionary*)duppleList;
@end