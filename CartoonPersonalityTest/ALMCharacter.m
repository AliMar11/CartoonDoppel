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
        _likeness = 0;
    }
    
    return  self;
}

-(instancetype)initWithUserCharacter: (NSString *)userName characterTraits: (NSMutableDictionary *)traitDictionary
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
    NSMutableDictionary *traitDictionary = [NSMutableDictionary dictionaryWithDictionary:@{@"Aggressive": @0,
                                     @"Careful" : @0,
                                      @"Clever" : @0,
                                     @"Comedic" : @0,
                                  @"Courageous" : @0,
                                    @"Creative" : @0,
                                  @"Despicable" : @0,
                                  @"Determined" : @0,
                                       @"Dorky" : @0,
                                   @"Eccentric" : @0,
                                @"Enthusiastic" : @0,
                                     @"Sincere" : @0,
                                  @"Optimistic" : @0,
                                    @"Negative" : @0,
                                     @"Passive" : @0,
                                       @"Sassy" : @0,
                                         @"Shy" : @0,
                                 @"Sympathetic" : @0,
                                @"Troublemaker" : @0}];
    
    ALMCharacter *user = [[ALMCharacter alloc] initWithUserCharacter: userName characterTraits: traitDictionary];
                    
        completion(user);
}

+(void)populateCharacterListWithCompletion: (void(^)(NSMutableArray *characterList))completion
{
    NSMutableArray* characterList = [[NSMutableArray alloc] init];
    ALMCharacterTraits *traits = [[ALMCharacterTraits alloc] init];
    
    ALMCharacter *bart = [[ALMCharacter alloc] initWithCharacter: @"Bart Simpson"
                                                         picture: [UIImage imageNamed: @"bart"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @2 careful: @0 clever: @3 comedic: @4 courage: @2 creative: @1 despicable: @3 determined: @1 dorky: @0 eccentric: @0 enthusiastic: @1 sincere: @0 optimistic: @0 negative: @1 passive: @1 sassy: @3 shy: @0 sympathetic: @0 troublemaker: @5]];
    [characterList addObject: bart];
    
    ALMCharacter *bender = [[ALMCharacter alloc] initWithCharacter: @"Bender" picture: [UIImage imageNamed: @"bender"] characterTraits:[[ALMCharacterTraits alloc] initWithAggressive: @4 careful: @0 clever: @3 comedic: @3 courage: @2 creative: @3 despicable: @5 determined: @1 dorky: @0 eccentric: @0 enthusiastic: @0 sincere: @0 optimistic: @0 negative: @4 passive: @3 sassy: @5 shy: @0 sympathetic: @0 troublemaker: @4]];
    
    [characterList addObject: bender];

    
    ALMCharacter *bob = [[ALMCharacter alloc] initWithCharacter: @"Bob Belcher"
                                                        picture: [UIImage imageNamed: @"bob"]
                                                characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @1 careful: @2 clever: @2 comedic: @1 courage: @3 creative: @2 despicable: @0 determined: @5 dorky: @4 eccentric: @0 enthusiastic: @1 sincere: @1 optimistic: @1 negative: @4 passive: @2 sassy: @0 shy: @1 sympathetic: @0 troublemaker: @2]];
    
    [characterList addObject: bob];

    ALMCharacter *bugs = [[ALMCharacter alloc] initWithCharacter: @"Bugs Bunny"
                picture: [UIImage imageNamed: @"buggsB"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @0 careful: @1 clever: @5 comedic:@4 courage: @3 creative: @4 despicable: @0 determined: @1 dorky: @0 eccentric: @1 enthusiastic:@2 sincere: @0 optimistic: @2 negative: @0 passive: @4 sassy: @2 shy: @0 sympathetic: @2 troublemaker: @1]];

    [characterList arrayByAddingObject: bugs];
 
    ALMCharacter *daffy = [[ALMCharacter alloc] initWithCharacter: @"Daffy Duck"
                                                         picture: [UIImage imageNamed: @"daffy duck"]
                                                  characterTraits:  traits = [[ALMCharacterTraits alloc] initWithAggressive:@3 careful:@0 clever:@1 comedic:@3 courage:@1 creative:@1 despicable:@4 determined:@1 dorky:@0 eccentric:@3 enthusiastic:@1 sincere:@1 optimistic:@1 negative:@1 passive:@0 sassy:@5 shy:@0 sympathetic:@0 troublemaker:@2]];
   [characterList addObject: daffy];
    
    ALMCharacter *flowey = [[ALMCharacter alloc] initWithCharacter: @"Flowey the Flower"
                                                           picture: [UIImage imageNamed: @"flowey"]
                                                   characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@4 careful: @0 clever: @1 comedic: @1 courage: @1 creative: @1 despicable: @5 determined: @2 dorky: @0 eccentric: @0 enthusiastic: @0 sincere: @1 optimistic: @0 negative: @1 passive: @0 sassy: @2 shy: @0 sympathetic: @0 troublemaker: @3]];
    
    [characterList addObject: flowey];

    ALMCharacter *garnet = [[ALMCharacter alloc] initWithCharacter: @"Garnet" picture: [UIImage imageNamed: @"garnet1"] characterTraits: [[ALMCharacterTraits alloc] initWithAggressive: @0 careful: @3 clever: @4 comedic: @2 courage:@5 creative: @3 despicable: @0 determined: @3 dorky: @2 eccentric: @0 enthusiastic: @3 sincere: @4 optimistic: @4 negative: @0 passive: @2 sassy: @0 shy: @0 sympathetic: @3 troublemaker: @0]];
    
    [characterList addObject: garnet];
    
    ALMCharacter *homer = [[ALMCharacter alloc] initWithCharacter: @"Homer Simpson"
                                                          picture: [UIImage imageNamed: @"homer"]
                                                  characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @1 careful: @0 clever: @0 comedic: @3 courage: @1 creative: @1 despicable: @0 determined: @1 dorky: @0 eccentric: @0 enthusiastic: @2 sincere: @4 optimistic: @1 negative: @2 passive: @2 sassy: @3 shy: @0 sympathetic: @0 troublemaker: @2]];
    
    [characterList addObject: homer];
    
    ALMCharacter *jake = [[ALMCharacter alloc]initWithCharacter: @"Jake The Dog" picture: [UIImage imageNamed: @"jake"] characterTraits:[[ALMCharacterTraits alloc] initWithAggressive: @2 careful: @2 clever: @3 comedic: @4 courage: @5 creative: @5 despicable: @0 determined: @3 dorky: @2 eccentric: @1 enthusiastic: @3 sincere: @2 optimistic: @4 negative: @3 passive: @3 sassy: @3 shy: @0 sympathetic: @3 troublemaker: @2]];
    
    [characterList addObject: jake];
    
    ALMCharacter *leela = [[ALMCharacter alloc]initWithCharacter: @"Leela" picture: [UIImage imageNamed: @"leela"] characterTraits: [[ALMCharacterTraits alloc] initWithAggressive: @3 careful: @3 clever: @4 comedic: @2 courage: @5 creative: @3 despicable: @0 determined: @5 dorky: @0 eccentric: @0 enthusiastic: @3 sincere: @0 optimistic: @2 negative: @2 passive: @1 sassy: @4 shy: @0 sympathetic: @5 troublemaker: @0]];
    
    [characterList addObject: leela];

    ALMCharacter *louise = [[ALMCharacter alloc] initWithCharacter: @"Louise Belcher"
                                                           picture: [UIImage imageNamed: @"louise"]
                                                   characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @3 careful: @0 clever: @5 comedic: @2 courage: @1 creative: @3 despicable: @3 determined: @2 dorky: @1 eccentric: @0 enthusiastic: @1 sincere: @0 optimistic: @1 negative: @1 passive: @0 sassy: @5 shy: @0 sympathetic: @1 troublemaker: @4]];
    
    [characterList addObject: louise];

    ALMCharacter *marceline = [[ALMCharacter alloc]initWithCharacter: [NSString stringWithFormat:@"%@\n%@", @"Marceline/", @"Marshall Lee" ] picture: [UIImage imageNamed: @"MtV"] characterTraits: [[ALMCharacterTraits alloc] initWithAggressive: @4 careful: @2 clever: @3 comedic: @2 courage: @5 creative: @5 despicable: @2 determined: @3 dorky: @1 eccentric: @0 enthusiastic: @2 sincere: @5 optimistic: @3 negative: @2 passive: @4 sassy: @3 shy: @0 sympathetic: @3 troublemaker: @4]];
    
    [characterList addObject: marceline];
    
    ALMCharacter *pbles = [[ALMCharacter alloc]initWithCharacter: [NSString stringWithFormat:@"%@\n%@", @"Princess Bubblegum/", @"Prince Gumball"] picture: [UIImage imageNamed: @"PBsTwo"] characterTraits:[[ALMCharacterTraits alloc] initWithAggressive: @3 careful: @4 clever: @5 comedic: @1 courage: @4 creative: @5 despicable: @0 determined: @4 dorky: @2 eccentric: @0 enthusiastic: @2 sincere: @0 optimistic:@3 negative: @0 passive: @2 sassy: @3  shy:@0 sympathetic: @4 troublemaker: @0]];
    
    [characterList addObject: pbles];

    ALMCharacter *rick = [[ALMCharacter alloc] initWithCharacter: @"Rick Sanchez" picture: [UIImage imageNamed: @"rick"] characterTraits: [[ALMCharacterTraits alloc] initWithAggressive: @4 careful: @0 clever: @5 comedic: @3 courage: @1 creative: @4 despicable: @4 determined: @2 dorky: @0 eccentric: @4 enthusiastic: @0 sincere: @0 optimistic: @0 negative: @5 passive: @2 sassy: @5 shy: @0 sympathetic: @0 troublemaker: @4]];
    
    [characterList addObject: rick];
    
    ALMCharacter *sans = [[ALMCharacter alloc] initWithCharacter: @"Sans ;)"
                                                         picture: [UIImage imageNamed: @"sans"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive:@0 careful:@0 clever:@4 comedic:@5 courage:@3 creative:@3 despicable:@1 determined:@2 dorky:@2 eccentric:@0 enthusiastic:@1 sincere:@0 optimistic:@1 negative:@0 passive:@3 sassy:@3 shy:@0 sympathetic:@0 troublemaker:@1]];
    
    [characterList addObject: sans];

    ALMCharacter *simity = [[ALMCharacter alloc] initWithCharacter: @"Yosimite Sam"
                                                         picture: [UIImage imageNamed: @"sam"]
                                                 characterTraits:  traits = [[ALMCharacterTraits alloc] initWithAggressive:@5 careful:@0 clever:@0 comedic:@0 courage:@2 creative:@1 despicable:@4 determined:@2 dorky:@0 eccentric:@1 enthusiastic:@0 sincere:@1 optimistic:@0 negative:@1 passive:@0 sassy:@3 shy:@0 sympathetic:@0 troublemaker:@3]];
    
   [characterList addObject: simity];
    
    
    ALMCharacter *steven = [[ALMCharacter alloc] initWithCharacter: @"Steven Universe" picture: [UIImage imageNamed: @"steven1"] characterTraits: [[ALMCharacterTraits alloc] initWithAggressive: @0 careful: @1 clever: @2 comedic: @1 courage: @5 creative: @4 despicable: @0 determined: @5 dorky: @4 eccentric: @0 enthusiastic: @3 sincere: @3 optimistic: @5 negative: @0 passive: @1 sassy: @1 shy: @0 sympathetic: @4 troublemaker: @0]];
    
    [characterList addObject: steven];
    
    
    ALMCharacter *tina = [[ALMCharacter alloc] initWithCharacter: @"Tina Belcher"
                                                     picture: [UIImage imageNamed: @"tina"]
                                                 characterTraits: traits = [[ALMCharacterTraits alloc] initWithAggressive: @0 careful: @4 clever: @1 comedic: @1 courage: @2 creative: @5 despicable: @0 determined: @1 dorky: @5 eccentric: @0 enthusiastic: @0 sincere: @1 optimistic: @0 negative: @2 passive: @2 sassy: @1 shy: @2 sympathetic: @1 troublemaker: @0]];
    
    [characterList addObject: tina];
    
    completion(characterList);
}

@end