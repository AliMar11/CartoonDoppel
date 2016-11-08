//
//  ALMCharacterTraits.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMCharacterTraits.h"

@implementation ALMCharacterTraits

-(instancetype) initWithAggressive: (NSNumber *)aggressive
                           careful: (NSNumber *)careful
                            clever: (NSNumber *)clever
                           comedic: (NSNumber *)comedic
                           courage: (NSNumber *)courage
                          creative: (NSNumber *)creativity
                        despicable: (NSNumber *)despicableness
                        determined: (NSNumber *)determination
                             dorky: (NSNumber *)dorky
                         eccentric: (NSNumber *)eccentricity
                      enthusiastic: (NSNumber *)enthusiasm
                             naive: (NSNumber *)naive
                        optimistic: (NSNumber *)optimistic
                          negative: (NSNumber *)negative
                           passive: (NSNumber *)passive
                             sassy: (NSNumber *)sassy
                               shy: (NSNumber *)shy
                       sympathetic: (NSNumber *)sympathy
                      troublemaker: (NSNumber *)troublemaker
{
    
    self = [super init];
    if (self)
    {           _duppleTraits = [NSMutableDictionary new];
                _topDuppleTraits = [NSMutableArray new];
  
        _topDuppleTraits = [@[
        _duppleTraits = [@{@"AGGRESSIVE" : aggressive,
                           @"CAREFUL" : careful,
                           @"CLEVER" : clever,
                           @"COMEDIC" : comedic,
                           @"COURAGE" : courage,
                           @"CREATIVITY" : creativity,
                           @"DESPICABLE" : despicableness,
                           @"DETERMINED" : determination,
                           @"DORKY" : dorky,
                           @"ECCENTRIC" : eccentricity,
                           @"ENTHUSIASM" : enthusiasm,
                           @"NAIVE" : naive,
                           @"OPTIMISTIC" : optimistic,
                           @"NEGATIVE" : negative,
                           @"PASSIVE" : passive,
                           @"SASSY" : sassy,
                           @"SHY" : shy,
                           @"SYMPATHETHIC" : sympathy,
                           @"TROUBLEMAKER" : troublemaker} mutableCopy] ] mutableCopy];
    }

    return self;
}

@end
