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

        for (NSString *testTrait in orderedDuppleTraits)
        {
            sortedDupple[testTrait] = character.traits.duppleTraits[testTrait];
        }

        [character.traits.topDuppleTraits removeAllObjects];

        [character.traits.topDuppleTraits addObjectsFromArray: orderedDuppleTraits];

    }
        completion(characterList);
    
}

+(void)dataAnalysis:(NSArray*)playerTraits :(NSArray*)characterList withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    NSArray *topFiveHanchos = [NSArray new];
 
    for (ALMCharacter *duppel in characterList)
    {
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", playerTraits, duppel.traits.topDuppleTraits);
        NSArray *leTraits = [NSArray arrayWithArray: duppel.traits.topDuppleTraits];

        for (NSString *trait in playerTraits)
        {
            if([duppel.traits.topDuppleTraits containsObject: [trait uppercaseString]] )
            {
                duppel.likeness += 1;
            }
        }
        
        if([[playerTraits[0] uppercaseString] isEqualToString: leTraits[0]] )
        {
            duppel.likeness += 3;
        }
        
        if([[playerTraits[1] uppercaseString] isEqualToString: leTraits[1]] )
        {
            duppel.likeness += 2;
        }

        if([[playerTraits[2] uppercaseString] isEqualToString: leTraits[2]])
        {
            duppel.likeness += 1;
        }
        
        if([[playerTraits[3] uppercaseString] isEqualToString: leTraits[3]] )
        {
            duppel.likeness += 1;
        }
 
        NSLog(@"\n\nDuppName:%@\nLIKENESS POINTS:%d\n", duppel.characterName,duppel.likeness);
    }
    
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"likeness" ascending: NO];
        NSArray *orderedArray = [characterList sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];

        topFiveHanchos = [orderedArray subarrayWithRange: NSMakeRange(0, 5)];

    completion(topFiveHanchos);
}

@end