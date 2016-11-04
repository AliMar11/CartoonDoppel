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



+(void)sortUserTraits:(ALMCharacter*)player withCompletion: (void(^)(NSArray *topPlayerTraits))completion
{
    NSArray *playerTraits = [player.traitDictionary keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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
    NSArray *topPlayerTraits = [playerTraits subarrayWithRange: NSMakeRange(0, 7)];
   // NSLog(@"1.2PLAYER TOPS-->%@", topPlayerTraits);
    
    completion(topPlayerTraits);
    
}

//TODO!!! Fix dupple init so it's not crazy like so: characterList.dupple.traits.duppleTraits.... a dupple only needs dupple traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSMutableArray *topDuppleTraits))completion
{
    //What we want to do here is redefine each 'duppleTraits' dictionary to the sorted+top7 traits WITH their values.
    NSMutableDictionary *test = [NSMutableDictionary new];

    for (ALMCharacter *character in characterList)
    {
        
        NSArray *characterTest = [[NSArray alloc] init];
        
        characterTest = [character.traits.duppleTraits keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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
        
        NSMutableArray *topDuppleTraits = [[NSMutableArray alloc] init];
        [topDuppleTraits addObjectsFromArray:[characterTest subarrayWithRange: NSMakeRange(0, 7)] ];
        NSLog(@"\n\nDUPP TRAITS:\n%@\n\n", topDuppleTraits);
        
        for (NSString *trait in topDuppleTraits)
        {
            test[trait] = character.traits.duppleTraits[trait];
            [test setObject:character.characterName forKey:@"characterName"];
            [test setObject:character.mugshot forKey:@"mugshot"];
        }
        NSLog(@"SORTED CHARA TEST:\n%@r",characterTest);
        NSLog(@"\n\nFINISHED THING:\n%@", test);
        NSLog(@"\nORIGINAL THING:\n%@\n", character.traits.duppleTraits);

        completion(topDuppleTraits);
    }
}

+(void)dataAnalysis:(NSArray*)player :(NSArray*)topDuppleTraits withCompletion: (void(^)(NSArray *topFiveHanchos))completion
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
        NSLog(@"\nWE ARE COMPARING %@ WITH %@", player, topDuppleTraits);
        
        //now we want to compare each array for doubles. The dupple with highest doubles count is topHanchose[0], the others get passed as topHanchos
    }
    completion(topFiveHanchos);
}

@end