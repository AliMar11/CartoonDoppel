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

-(instancetype)initWithUserCharacter:(NSString *)userName characterTraits:(ALMCharacterTraits *)traitDictionary
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
    NSDictionary *traitDictionary = @{@"aggressive": @0,
                                      @"ambition" : @0,
                                      @"cheerfulness" : @0,
                                      @"clever" : @0,
                                      @"comedic" : @0,
                                      @"courageous" : @0,
                                      @"creative" : @0,
                                      @"dispicable" : @0,
                                      @"determined" : @0,
                                      @"dorky" : @0,
                                      @"eccentric" : @0,
                                      @"enthusiastic" : @0,
                                      @"lucky" : @0,
                                      @"naive" : @0,
                                      @"optimistic" : @0,
                                      @"negative" : @0,
                                      @"passionate" : @0,
                                      @"positive" : @0,
                                      @"prankster" : @0,
                                      @"sassy" : @0,
                                      @"sympathetic" : @0,
                                      @"troublemaker" : @0,
                                      @"trusting" : @0,
                                      @"vulnerability" : @0};
    
   // NSLog(@"\n\nTRAITS:%d\n\n\n\n", (int)traits + 1);
    
    ALMCharacter *user = [[ALMCharacter alloc] initWithUserCharacter: userName characterTraits: traitDictionary];
                    
        completion(user);
}

+(void)tallyUserAnswers:(ALMCharacter *)player :(ALMCharacterTraits *) selectedTrait
{
    //take value for button
    
    for (ALMCharacterTraits *trait in player.traitDictionary)
    {
        
        NSLog(@"\nDO WE HAVE A TRAIT MATCH???: %@", [selectedTrait isEqual: trait] ? @"YES" : @"NO");
      
        
        
        if ([selectedTrait isEqual: trait])
        {
            NSLog(@"MATCH FOOL!");
            
        }
        
        
        
    }
    
    //search user traits for buttonValue trait and ++
    NSLog(@"\n\n\nTALLY TAKEN\n\n\n");

}

-(void)populateCharacterList
{
    ALMCharacter *bugs = [[ALMCharacter alloc] initWithCharacter: @"Bugs Bunny"
                picture: [UIImage imageNamed: @"buggs"]
                                                 characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:@0 ambition:@2 cheerfulness:@3 clever:@20 comedic:@8 courageous:@7 creative:@20 despicable:@3 determined:@9 dorky:@0 eccentric:@0 enthusiastic:@8 genius:@8 fighter:@0 harmless:@5 lucky:@9 naive:@0 optimistic:@5 negative:@3 passionate:@3 positive:@5 prankster:@8 sassy:@8 sympathetic:@8 talented:@10 troublemaker:@5 trusting:@5 vulnerability: @3]];
    
    [self.characterList arrayByAddingObject: bugs];
    
 /*
    ALMCharacter *daffy = [[ALMCharacter alloc] initWithCharacter: @"Daffy Duck"
                                                         picture: [UIImage imageNamed: @"daffy5"]
                                                 characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:10 ambition:8 cheerfulness:5 clever:8 comedic:10 courageous:4 creative:9 despicable:10 determined:10 dorky:5 eccentric:10 enthusiastic:8 genius:5 fighter:6 harmless:5 lucky:2 naive:4 optimistic:0 negative:6 passionate:8 positive:5 prankster:10 sassy:10 sympathetic:0 talented:7 troublemaker:10 trusting:7 vulnerability: 9]];
    
    [self.characterList arrayByAddingObject: daffy];
    
    ALMCharacter *simity = [[ALMCharacter alloc] initWithCharacter: @"Yosimite Sam"
                                                         picture: [UIImage imageNamed: @"sam"]
                                                 characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:10 ambition:8 cheerfulness:0 clever:5 comedic:3 courageous:9 creative:2 despicable:10 determined:8 dorky:0 eccentric:4 enthusiastic:0 genius:2 fighter:10 harmless:2 lucky:0 naive:10 optimistic:0 negative:5 passionate:9 positive:0 prankster:6 sassy:0 sympathetic:0 talented:4 troublemaker:8 trusting:0 vulnerability: 5]];
    
    [self.characterList arrayByAddingObject: simity];

    
    ALMCharacter *sans = [[ALMCharacter alloc] initWithCharacter: @"Sans ;)"
                                                     picture: [UIImage imageNamed: @"sans"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:0 ambition:3 cheerfulness:10 clever:10 comedic:10 courageous:10 creative:8 despicable:20 determined:10 dorky: 9 eccentric:0 enthusiastic:10 genius: 8 fighter:8 harmless:9 lucky:5 naive:0 optimistic:10 negative:0 passionate:6 positive:10 prankster:10 sassy:10 sympathetic:9 talented:8 troublemaker:10 trusting:9 vulnerability:2]];
    
    [self.characterList arrayByAddingObject: sans];
    
    
    
    ALMCharacter *flowey = [[ALMCharacter alloc] initWithCharacter: @"Flowey the Flower"
                                                     picture: [UIImage imageNamed: @"flowey2"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:10 ambition:9 cheerfulness:5 clever:9 comedic:3 courageous:1 creative:0 despicable:10 determined:10 dorky:0 eccentric:0 enthusiastic:7 genius:7 fighter:9 harmless:0 lucky:0 naive:0 optimistic:3 negative:9 passionate:8 positive:0 prankster:7 sassy:6 sympathetic:0 talented:6 troublemaker:10 trusting:0 vulnerability:0]];
    
    [self.characterList arrayByAddingObject: flowey];



ALMCharacter *frisk = [[ALMCharacter alloc] initWithCharacter: @"Frisk"
                                                 picture: [UIImage imageNamed: @"frisk3"]
                                         characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:0 ambition:9 cheerfulness:5 clever:7 comedic:0 courageous:10 creative:8 despicable:0 determined:10 dorky:0 eccentric:0 enthusiastic:0 genius:5 fighter:3 harmless:10 lucky:6 naive:6 optimistic:7 negative:5 passionate:6 positive:6 prankster:0 sassy:0 sympathetic:10 talented:8 troublemaker:0 trusting:9 vulnerability:8]];

[self.characterList arrayByAddingObject: frisk];


    ALMCharacter *bob = [[ALMCharacter alloc] initWithCharacter: @"Bob Belcher"
                                                     picture: [UIImage imageNamed: @"bob"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:3 ambition:6 cheerfulness:6 clever:6 comedic:6 courageous:8 creative:9 despicable:0 determined:7 dorky:7 eccentric:4 enthusiastic:6 genius:5 fighter:5 harmless:9 lucky:7 naive:5 optimistic:6 negative:7 passionate:8 positive:6 prankster:0 sassy:0 sympathetic:7 talented:8 troublemaker:0 trusting:3 vulnerability:5]];
    
    [self.characterList arrayByAddingObject: bob];
    
    ALMCharacter *louise = [[ALMCharacter alloc] initWithCharacter: @"Louise Belcher"
                                                     picture: [UIImage imageNamed: @"louise"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:10 ambition:9 cheerfulness:5 clever:9 comedic:8 courageous:7 creative:7 despicable:6 determined:8 dorky:5 eccentric:5 enthusiastic:3 genius:7 fighter:8 harmless:0 lucky:5 naive:0 optimistic:7 negative:8 passionate:7 positive:5 prankster:10 sassy:10 sympathetic:8 talented:7 troublemaker:10 trusting:0 vulnerability:4]];
    
    [self.characterList arrayByAddingObject: louise];
    
    ALMCharacter *tina = [[ALMCharacter alloc] initWithCharacter: @"Tina Belcher"
                                                     picture: [UIImage imageNamed: @"tina2"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:6 ambition:4 cheerfulness:4 clever:5 comedic:3 courageous:7 creative:10 despicable:0 determined:5 dorky:10 eccentric:7 enthusiastic:3 genius:5 fighter:0 harmless:10 lucky:6 naive:7 optimistic:5 negative:9 passionate:8 positive:3 prankster:0 sassy:6 sympathetic:9 talented:7 troublemaker:0 trusting:9 vulnerability:9]];
    
    [self.characterList arrayByAddingObject: tina];
    
    
    ALMCharacter *homer = [[ALMCharacter alloc] initWithCharacter: @"Homer Simpson"
                                                     picture: [UIImage imageNamed: @"homer2"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:4 ambition:3 cheerfulness:8 clever:3 comedic:7 courageous:3 creative:5 despicable:0 determined:8 dorky:5 eccentric:3 enthusiastic:7 genius:0 fighter:3 harmless:10 lucky:8 naive:9 optimistic:8 negative:7 passionate:5 positive:5 prankster:7 sassy:8 sympathetic:8 talented:3 troublemaker:0 trusting:3 vulnerability:9]];
    
    [self.characterList arrayByAddingObject: homer];
    
    ALMCharacter *bart = [[ALMCharacter alloc] initWithCharacter: @"Bart Simpson"
                                                     picture: [UIImage imageNamed: @"bart"]
                                             characterTraits: self.traits = [[ALMCharacterTraits alloc] initWithAggressive:7 ambition:8 cheerfulness:5 clever:10 comedic:10 courageous:8 creative:7 despicable:5 determined:8 dorky:0 eccentric:0 enthusiastic:3 genius:5 fighter:3 harmless:4 lucky:4 naive:3 optimistic:5 negative:5 passionate:0 positive:7 prankster:10 sassy:10 sympathetic:0 talented:6 troublemaker:10 trusting:3 vulnerability:0]];
    
    [self.characterList arrayByAddingObject: bart];
  */
}


@end
