//
//  ALMCharacter.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/22/16.
//  Copyright ©2016 AliApps. All rights reserved.
//

#import "ALMCharacter.h"

@implementation ALMCharacter

-(instancetype)initWithCharacter:(NSString *)characterName
                         picture: (UIImage*) mugshot
                 characterTraits:(ALMCharacterTraits *)traits
{
    self = [super init];
    if (self)
    {
        _userName = self.userName;
        _characterName = characterName;
        _traits =  traits;
        _mugshot = mugshot;
    }
    
    return  self;
}

-(instancetype)initWithUserCharacter:(NSString *)userName characterTraits:(NSMutableDictionary *)traitDictionary
{
    self = [super init];
    if(self)
    {
        _userName = userName;
        _traitDictionary = traitDictionary;
    }
    return self;
}

+(void)createUser: (NSString *)userName  withCompletion: (void(^)())completion
{
    NSMutableDictionary *traitDictionary = [NSMutableDictionary dictionaryWithDictionary:@{@"aggressive": @0,
                                                                                           @"careful" : @0,
                                                                                           @"clever" : @0,
                                                                                           @"comedic" : @0,
                                                                                           @"courage" : @0,
                                                                                           @"creative" : @0,
                                                                                           @"despicable" : @0,
                                                                                           @"determined" : @0,
                                                                                           @"dorky" : @0,
                                                                                           @"eccentric" : @0,
                                                                                           @"enthusiastic" : @0,
                                                                                           @"naive" : @0,
                                                                                           @"optimistic" : @0,
                                                                                           @"negative" : @0,
                                                                                           @"passive" : @0,
                                                                                           @"sassy" : @0,
                                                                                           @"shy" : @0,
                                                                                           @"sympathetic" : @0,
                                                                                           @"troublemaker" : @0}];
    
    ALMCharacter *user = [[ALMCharacter alloc] initWithUserCharacter: userName characterTraits: traitDictionary];
                    
        completion(user);
}

//TODO put tallyTheUser in ALMAnalysis
+(void)tallyUserAnswers:(ALMCharacter *)player :(ALMCharacterTraits *) selectedTrait
{
    if (player.traitDictionary[selectedTrait] != nil)
    {
    
        int traitValue = [player.traitDictionary[selectedTrait] intValue];
        traitValue += 1;
        player.traitDictionary[(NSString *)selectedTrait] = [[NSNumber alloc] initWithInt: traitValue];
    }
    
   // NSLog(@"\n\nTALLY TAKEN for trait:%@\nPROOF:%@\n\n", player.traitDictionary[selectedTrait], player.traitDictionary);

}

+(void)populateCharacterListWithCompletion: (void(^)(NSMutableArray *characterList))completion
{
    NSMutableArray* characterList = [[NSMutableArray alloc] init];
    ALMCharacterTraits *traits = [[ALMCharacterTraits alloc] init];
    
    //[ALMCharacter test:characterList :traits];
    ALMCharacter *bugs = [[ALMCharacter alloc] initWithCharacter: @"Bugs Bunny"
                picture: [UIImage imageNamed: @"buggs"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@3 careful:@4 clever:@10 comedic:@7 courage:@9 creative:@7 despicable:@3 determined:@6 dorky:@3 eccentric:@3 enthusiastic:@5 naive:@1 optimistic:@3 negative:@1 passive:@5 sassy:@8 shy:@3 sympathetic:@7 troublemaker:@5]];

    [characterList arrayByAddingObject: bugs];
 
    ALMCharacter *daffy = [[ALMCharacter alloc] initWithCharacter: @"Daffy Duck"
                                                         picture: [UIImage imageNamed: @"daffy5"]
                                                  characterTraits:  traits = [[ALMCharacterTraits alloc] initWithAggressive:@9 careful:@3 clever:@5 comedic:@9 courage:@4 creative:@6 despicable:@9 determined:@7 dorky:@6 eccentric:@10 enthusiastic:@5 naive:@5 optimistic:@4 negative:@4 passive:@0 sassy:@10 shy:@0 sympathetic:@1 troublemaker:@7]];
   [characterList addObject: daffy];
    
    ALMCharacter *simity = [[ALMCharacter alloc] initWithCharacter: @"Yosimite Sam"
                                                         picture: [UIImage imageNamed: @"sam"]
                                                 characterTraits:  traits = [[ALMCharacterTraits alloc] initWithAggressive:@10 careful:@0 clever:@1 comedic:@2 courage:@9 creative:@5 despicable:@10 determined:@8 dorky:@1 eccentric:@9 enthusiastic:@5 naive:@7 optimistic:@5 negative:@5 passive:@1 sassy:@10 shy:@0 sympathetic:@0 troublemaker:@10]];
    
   [characterList addObject: simity];
    
    ALMCharacter *sans = [[ALMCharacter alloc] initWithCharacter: @"Sans ;)"
                                                     picture: [UIImage imageNamed: @"sans3"]
                                             characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@5 careful:@1 clever:@10 comedic:@10 courage:@9 creative:@8 despicable:@6 determined:@5 dorky:@7 eccentric:@5 enthusiastic:@5 naive:@5 optimistic:@5 negative:@5 passive:@9 sassy:@9 shy:@0 sympathetic:@5 troublemaker:@7]];
    
    [characterList addObject: sans];
    
    ALMCharacter *flowey = [[ALMCharacter alloc] initWithCharacter: @"Flowey the Flower"
                                                     picture: [UIImage imageNamed: @"flowey2"]
                                             characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@10 careful:@0 clever:@8 comedic:@5 courage:@4 creative:@5 despicable:@10 determined:@10 dorky:@0 eccentric:@8 enthusiastic:@6 naive:@9 optimistic:@2 negative:@6 passive:@2 sassy:@6 shy:@5 sympathetic:@0 troublemaker:@9]];
    
    [characterList addObject: flowey];

ALMCharacter *frisk = [[ALMCharacter alloc] initWithCharacter: @"Frisk"
                                                 picture: [UIImage imageNamed: @"frisk2"]
                                         characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@5 careful:@4 clever:@7 comedic:@0 courage:@8 creative:@5 despicable:@5 determined:@10 dorky:@4 eccentric:@0 enthusiastic:@0 naive:@7 optimistic:@7 negative:@5 passive:@8 sassy:@0 shy:@10 sympathetic:@10 troublemaker:@5]];

[characterList addObject: frisk];


    ALMCharacter *bob = [[ALMCharacter alloc] initWithCharacter: @"Bob Belcher"
                                                     picture: [UIImage imageNamed: @"bob"]
                                             characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@2 careful:@9 clever:@9 comedic:@6 courage:@7 creative:@9 despicable:@0 determined:@9 dorky:@8 eccentric:@5 enthusiastic:@5 naive:@4 optimistic:@4 negative:@8 passive:@10 sassy:@0 shy:@3 sympathetic:@8 troublemaker:@0]];
    
    [characterList addObject: bob];
    
    ALMCharacter *louise = [[ALMCharacter alloc] initWithCharacter: @"Louise Belcher"
                                                     picture: [UIImage imageNamed: @"louise"]
                                                   characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@10 careful:@6 clever:@10 comedic:@8 courage:@8 creative:@7 despicable:@10 determined:@7 dorky:@6 eccentric:@6 enthusiastic:@5 naive:@0 optimistic:@2 negative:@4 passive:@0 sassy:@10 shy:@2 sympathetic:@5 troublemaker:@10]];
    
    [characterList addObject: louise];
    
    ALMCharacter *tina = [[ALMCharacter alloc] initWithCharacter: @"Tina Belcher"
                                                     picture: [UIImage imageNamed: @"tina3"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@2 careful:@10 clever:@7 comedic:@5 courage:@7 creative:@7 despicable:@3 determined:@6 dorky:@9 eccentric:@5 enthusiastic:@3 naive:@4 optimistic:@3 negative:@7 passive:@8 sassy:@6 shy:@7 sympathetic:@7 troublemaker:@5]];
    
    [characterList addObject: tina];
    
    
    ALMCharacter *homer = [[ALMCharacter alloc] initWithCharacter: @"Homer Simpson"
                                                     picture: [UIImage imageNamed: @"homer2"]
                                                  characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@4 careful:@0 clever:@2 comedic:@7 courage:@6 creative:@4 despicable:@3 determined:@8 dorky:@3 eccentric:@3 enthusiastic:@4 naive:@9 optimistic:@6 negative:@6 passive:@7 sassy:@5 shy:@0 sympathetic:@0 troublemaker:@6]];
    
    [characterList addObject: homer];
    
    ALMCharacter *bart = [[ALMCharacter alloc] initWithCharacter: @"Bart Simpson"
                                                     picture: [UIImage imageNamed: @"bart"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@5 careful:@0 clever:@6 comedic:@9 courage:@8 creative:@7 despicable:@9 determined:@5 dorky:@0 eccentric:@0 enthusiastic:@3 naive:@3 optimistic:@5 negative:@5 passive:@6 sassy:@9 shy:@0 sympathetic:@3 troublemaker:@10]];
    [characterList addObject: bart];

    completion(characterList);
}

//TODO!!! Fix dupple init so it's not crazy like so: characterList.dupple.traits.duppleTraits.... a dupple only needs dupple traits ^_^ (delete unnecessary steps)
+(void)characterSort:(NSArray*)characterList withCompletion: (void(^)(NSArray *characterList))completion
{
    for (ALMCharacter *aDupple in characterList)
               {
                   NSDictionary *test = aDupple.traits.duppleTraits;
                   
        NSArray *characterTest = [test keysSortedByValueUsingComparator: ^(id obj1, id obj2)
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
                       NSLog(@"name:%@\nCHARACTER TEST\n%@",aDupple.characterName ,characterTest.description);
                }
    
}


@end