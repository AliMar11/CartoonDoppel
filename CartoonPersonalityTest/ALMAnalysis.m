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
         [ALMCharacter characterSort: characterList withCompletion:^(NSArray *characterList)
         {
//TODO here we need to compare the player's traits with dupple traits according to values. Return the top 5 to next VC.
             

         }];
        
     }];

}





@end