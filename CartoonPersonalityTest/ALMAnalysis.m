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
    
    //NSLog(@"1PLAYER TRAITS:%@", playerTraits);
    NSArray *sortedPlayerTraits = [playerTraitsArray subarrayWithRange: NSMakeRange(0, 7)];
   // NSLog(@"1.2PLAYER TOPS-->%@", topPlayerTraits);
    
    for (NSString *trait in sortedPlayerTraits)
    {
        topPlayerTraits[trait] =  [playerTraits.traitDictionary valueForKey:trait];
        //topPlayerTraits[trait] = (NSDictionary *)playerTraits.traits[trait];
    }
    
    completion(topPlayerTraits);
}

//TODO!!! Fix dupple init so it's not crazy like so: characterList.dupple.traits.duppleTraits.... a dupple only needs dupple traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSMutableArray * topDuppleTraits))completion
{
    //What we want to do here is redefine each 'duppleTraits' dictionary to the sorted+top7 traits WITH their values.
  
    NSMutableDictionary *sortedDupple = [NSMutableDictionary new];
    NSMutableArray *topDuppleTraits = [NSMutableArray new];
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

        
        NSMutableArray *orderedDuppleTraits = [[NSMutableArray alloc] init];
        [orderedDuppleTraits addObjectsFromArray: [characterAnalysisArray subarrayWithRange: NSMakeRange(0, 7)]];
        //[character.traits.duppleTraits removeAllObjects];
        
        for (NSString *testTrait in orderedDuppleTraits)
        {
            sortedDupple[testTrait] = character.traits.duppleTraits[testTrait];
        }
            
            NSLog(@"\n%@\n", character.traits.duppleTraits);


        completion(topDuppleTraits);
    }
}

+(void)dataAnalysis:(NSMutableDictionary*)player :(NSMutableDictionary*)sortedDupple withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    NSArray *topFiveHanchos = [NSArray new];
    NSLog(@"3 DATA ANALYSIS:%@",topFiveHanchos);
 //take player and topDupps and compare each Dupp with player to give back most compatable dupps.
    
    //below compares one trait from dupple with all traits from player
    /*
    for (ALMCharacter *dupple in topDuppleTraits)
    {
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", player, dupple);
    }
     */
    for (int i = 0;  i <= player.count; i++)
    {
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", player, sortedDupple);
        //now we want to compare each array for doubles. The dupple with highest doubles count is topHanchose[0], the others get passed as topHanchos
        
    }
    completion(topFiveHanchos);
}

@end