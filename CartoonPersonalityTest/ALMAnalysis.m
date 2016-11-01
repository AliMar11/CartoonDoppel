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
    for (ALMCharacter *character in characterList)
    {
        NSArray *characterTest = [character.traits.duppleTraits keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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
        [ topDuppleTraits addObjectsFromArray:[characterTest subarrayWithRange: NSMakeRange(0, 7)] ];
        
        completion(topDuppleTraits);
    }
   // NSLog(@"2 DUPPLE TRAITS--SORTED%@", characterList);
    
}

+(void)dataAnalysis:(NSArray*)player :(NSArray*)topDuppleTraits withCompletion: (void(^)(NSArray *topFiveHanchos))completion
{
    NSArray *topFiveHanchos = [NSArray new];
    NSLog(@"3 DATA ANALYSIS:%@",topFiveHanchos );

 //take player and topDupps and compare each Dupp with player to give back most compatable dupps.
    completion(topFiveHanchos);
}

@end