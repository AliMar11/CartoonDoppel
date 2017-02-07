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
        topPlayerTraits[trait] =  [playerTraits.traitDictionary valueForKey: trait];
    }
    
    completion(sortedPlayerTraits);
}

//TODO!!! Fix doppel init so it's not crazy like so: characterList.doppel.traits.doppelTraits.... a doppel only needs doppel traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSArray * characterList))completion
{
    //NSLog(@"\ncharacterSort:\n%@\n", characterList);
    NSMutableDictionary *sortedDoppel = [NSMutableDictionary new];
    NSArray *orderedDoppelTraits = [NSArray new];

    for (ALMCharacter *character in characterList)
    {
        NSArray *characterAnalysisArray = [[NSArray alloc] init];
        
        characterAnalysisArray = [character.traits.doppelTraits keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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

        
        orderedDoppelTraits = [characterAnalysisArray subarrayWithRange: NSMakeRange(0, 7)];

        for (NSString *testTrait in orderedDoppelTraits)
        {
            sortedDoppel[testTrait] = character.traits.doppelTraits[testTrait];
        }

        [character.traits.topDoppelTraits removeAllObjects];

        [character.traits.topDoppelTraits addObjectsFromArray: orderedDoppelTraits];

    }
        completion(characterList);
    
}

+(void)dataAnalysis:(NSArray*)playerTraits :(NSArray*)characterList withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    //NSLog(@"\ndata analysist:\n%@\n", characterList);
    NSArray *topFiveHanchos = [NSArray new];
 
    for (ALMCharacter *doppel in characterList)
    {
       // NSLog(@"\nWE ARE COMPARING userTraits:%@ WITH %@", playerTraits, doppel.traits.topDoppelTraits);
        NSArray *leTraits = [NSArray arrayWithArray: doppel.traits.topDoppelTraits];

        for (NSString *trait in playerTraits)
        {
            if([doppel.traits.topDoppelTraits containsObject: trait] )
            {
                doppel.likeness += 1;
            }
        }
        
        if([playerTraits[0]  isEqualToString: leTraits[0]] )
        {
            doppel.likeness += 3;
        }
        
        if([playerTraits[1] isEqualToString: leTraits[1]] )
        {
            doppel.likeness += 2;
        }

        if([playerTraits[2] isEqualToString: leTraits[2]])
        {
            doppel.likeness += 1;
        }
        
        if([playerTraits[3] isEqualToString: leTraits[3]] )
        {
            doppel.likeness += 1;
        }
 
       // NSLog(@"\n\nDoppName:%@\nLIKENESS POINTS:%d\n", doppel.characterName,doppel.likeness);
    }
    
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"likeness" ascending: NO];
        NSArray *orderedArray = [characterList sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortDescriptor]];

        topFiveHanchos = [orderedArray subarrayWithRange: NSMakeRange(0, 5)];

    completion(topFiveHanchos);
}

@end