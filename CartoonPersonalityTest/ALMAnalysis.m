//
//  ALMAnalysis.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/28/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMAnalysis.h"

@implementation ALMAnalysis

+(void)dataAnalysis:(ALMCharacter *)player withCompletion:(void (^)(NSArray *topFive))completion
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
    
    NSLog(@"PLAYER TRAITS:%@", playerTraits);
   // NSMutableArray *topFive = [[NSMutableArray alloc]init];
    
    [ALMCharacter populateCharacterListWithCompletion:^(NSArray *characterList)
     {
         NSLog(@"POP CHARA LIST ON ALMANALYSIS");
         [ALMCharacter characterSort: characterList withCompletion:^(NSArray *characterList)
         {
             NSArray *topDuppleTraits = [NSArray new];
             
             for (ALMCharacter *dupple in characterList)
             {
                           [topDuppleTraits arrayByAddingObjectsFromArray: [characterList subarrayWithRange: NSMakeRange(0, 7)] ];
                 
                 NSLog(@"\n%@'s top traits:%@",dupple.characterName, topDuppleTraits);
             }
             [topDuppleTraits arrayByAddingObjectsFromArray: [characterList subarrayWithRange: NSMakeRange(0, 7)] ];
             //                   NSLog(@"name:%@\nCHARACTER TEST\n%@\n%@'s top traits:%@",aDupple.characterName ,characterTest.description, aDupple.characterName, topDuppleTraits);
             //                       NSLog(@"name:%@\nCHARACTER TEST\n%@\n%@'s top traits:%@",aDupple.characterName ,characterTest.description, aDupple.characterName, topDuppleTraits);
             //}

            
         }];
         //TODO here we need to compare the player's traits with dupple traits according to values. Return the top 5 to next VC.
         NSArray *topPlayerTraits = [playerTraits subarrayWithRange: NSMakeRange(0, 7)];
        // NSLog(@"PLAYER TOPS-->%@", topPlayerTraits);
         
         
        
     }];

}





@end