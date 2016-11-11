//
//  ALMAnalysis.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/28/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMAnalysis.h"

@implementation ALMAnalysis

+(void)tallyUserAnswers:(ALMCharacter *)player :(ALMCharacterTraits *) selectedTrait
{
    if (player.traitDictionary[selectedTrait] != nil)
    {
        int traitValue = [player.traitDictionary[selectedTrait] intValue];
        traitValue += 1;
        player.traitDictionary[(NSString *)selectedTrait] = [[NSNumber alloc] initWithInt: traitValue];
    }
}

+(void)sortUserTraits:(ALMCharacter*)playerTraits withCompletion: (void(^)(NSMutableDictionary *topPlayerTraits))completion
{
    NSMutableDictionary *topPlayerTraits = [NSMutableDictionary new];
    NSArray *playerTraitsArray = [playerTraits.traitDictionary keysSortedByValueUsingComparator: ^(id obj1, id obj2)
                             {
                                 if ([obj1 integerValue] > [obj2 integerValue])
                                 {
                                     
                                     return (NSComparisonResult)NSOrderedAscending;
                                 }
                                 if ([obj1 integerValue] < [obj2 integerValue])
                                 {
                                     
                                     return (NSComparisonResult)NSOrderedDescending;
                                 }
                                 
                                 return (NSComparisonResult)NSOrderedAscending;
                             }];
    
    NSArray *sortedPlayerTraits = [playerTraitsArray subarrayWithRange: NSMakeRange(0, 7)];
    
    for (NSString *trait in sortedPlayerTraits)
    {
        topPlayerTraits[trait] =  [playerTraits.traitDictionary valueForKey:trait];
    }
    
    completion(topPlayerTraits);
}

//TODO!!! Fix dupple init so it's not crazy like so: characterList.dupple.traits.duppleTraits.... a dupple only needs dupple traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSMutableDictionary * sortedDupple))completion
{
    NSMutableDictionary *sortedDupple = [NSMutableDictionary new];
  
    for (ALMCharacter *character in characterList)
    {
        NSArray *characterAnalysisArray = [[NSArray alloc] init];
        
        characterAnalysisArray = [character.traits.duppleTraits keysSortedByValueUsingComparator: ^(id obj1, id obj2)
                         {
                             if ([obj1 integerValue] > [obj2 integerValue])
                             {
                                 
                                 return (NSComparisonResult)NSOrderedAscending;
                             }
                             if ([obj1 integerValue] < [obj2 integerValue])
                             {
                                 
                                 return (NSComparisonResult)NSOrderedDescending;
                             }
                             
                             return (NSComparisonResult)NSOrderedAscending;
                         }];

        
        NSArray *orderedDuppleTraits = [characterAnalysisArray subarrayWithRange: NSMakeRange(0, 7)];
        
        for (NSString *testTrait in orderedDuppleTraits)
        {
            sortedDupple[testTrait] = character.traits.duppleTraits[testTrait];
        }
            
            NSLog(@"\nallDuppTraits:%@\nsortedDupleTraitsDic:\n%@\norderedDuppTraitArray:\n%@\n", character.traits.duppleTraits, sortedDupple, orderedDuppleTraits);

        completion(sortedDupple);
    }
}

+(void)dataAnalysis:(NSMutableDictionary*)player :(NSMutableDictionary*)sortedDupple withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    NSArray *topFiveHanchos = [NSArray new];
    NSLog(@"3 DATA ANALYSIS:%@",topFiveHanchos);
 
    for (int i = 0;  i <= player.count; i++)
    {
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", player, sortedDupple);
        //now we want to compare each array for doubles. The dupple with highest doubles count is topHanchose[0], the others get passed as topHanchos
        
        
    }
    completion(topFiveHanchos);
}

@end