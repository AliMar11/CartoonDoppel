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
    NSArray *test = [player.traitDictionary keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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
    
    NSMutableArray *topFive = [[NSMutableArray alloc]init];
    [ALMCharacter populateCharacterListWithCompletion:^(NSArray *characterList)
     {
         [ALMCharacter characterSort: characterList];
        
     }];
    //TODO HERE WE NEED TO COMPARE THE KEYS ACCORDING TO VALUES

}





@end