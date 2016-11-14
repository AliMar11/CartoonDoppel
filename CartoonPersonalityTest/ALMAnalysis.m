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

+(void)sortUserTraits:(ALMCharacter*)playerTraits withCompletion: (void(^)(NSArray *sortedTraitsArray))completion
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
    
    completion(sortedPlayerTraits);
}

//TODO!!! Fix dupple init so it's not crazy like so: characterList.dupple.traits.duppleTraits.... a dupple only needs dupple traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSArray * characterList))completion
{
    NSMutableDictionary *sortedDupple = [NSMutableDictionary new];
    NSArray *orderedDuppleTraits = [NSArray new];

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

        
        orderedDuppleTraits = [characterAnalysisArray subarrayWithRange: NSMakeRange(0, 7)];
       // NSLog(@"SORRRRRRRRRTED A DUP:%@\n%@", character.characterName, orderedDuppleTraits);

        for (NSString *testTrait in orderedDuppleTraits)
        {
            sortedDupple[testTrait] = character.traits.duppleTraits[testTrait];
        }
            
            NSLog(@"\nsortedDupleTraitsDic:\n%@\norderedDuppTraitArray:\n%@\n", sortedDupple, orderedDuppleTraits);
        [character.traits.topDuppleTraits removeAllObjects];
        NSLog(@"\nEMPTY TOP DUPPS:\n%@\norderedDuppTraitArray:\n%@\n", character.traits.topDuppleTraits, orderedDuppleTraits);

        [character.traits.topDuppleTraits addObjectsFromArray: orderedDuppleTraits];
            NSLog(@"\nREDEFINED TOP DUPPS:\n%@\norderedDuppTraitArray:\n%@\n", character.traits.topDuppleTraits, orderedDuppleTraits);
    }
        completion(characterList);
    
}

+(void)dataAnalysis:(NSArray*)playerTraits :(NSArray*)characterList withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    NSArray *topFiveHanchos = [NSArray new];
 
    for (ALMCharacter *duppel in characterList)
    {
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", playerTraits, duppel.traits.topDuppleTraits);
        //NSArray *leTraits = [NSArray arrayWithArray: duppel.traits.topDuppleTraits];

        for (NSString *trait in playerTraits)
        {
            if([duppel.traits.topDuppleTraits containsObject: [trait uppercaseString]] )
            {
                duppel.likeness += 1;
            }
        }
        
        if([playerTraits[0] uppercaseString] == duppel.traits.topDuppleTraits[0] )
        {
            duppel.likeness += 3;
        }
        
        if([playerTraits[1] uppercaseString] == duppel.traits.topDuppleTraits[1] )
        {
            duppel.likeness += 2;
        }

        if(playerTraits[2] == duppel.traits.topDuppleTraits[2] )
        {
            duppel.likeness += 1;
        }
        
        if(playerTraits[3] == duppel.traits.topDuppleTraits[3] )
        {
            duppel.likeness += 1;
        }
 
        NSLog(@"\n\nLIKENESS POINTS:%d", duppel.likeness);
        //now we want to compare each array for doubles. The dupple with highest doubles count is topHanchose[0], the others get passed as topHanchos
        
        
    }
    completion(topFiveHanchos);
}

@end