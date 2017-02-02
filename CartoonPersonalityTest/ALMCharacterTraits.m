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
                           sincere: (NSNumber *)sincere
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
    {           _doppelTraits = [NSMutableDictionary new];
                _topDoppelTraits = [NSMutableArray new];
  
        _topDoppelTraits = [@[
        _doppelTraits = [@{@"Aggressive" : aggressive,
                              @"Careful" : careful,
                               @"Clever" : clever,
                              @"Comedic" : comedic,
                           @"Courageous" : courage,
                             @"Creative" : creativity,
                           @"Despicable" : despicableness,
                           @"Determined" : determination,
                                @"Dorky" : dorky,
                            @"Eccentric" : eccentricity,
                         @"Enthusiastic" : enthusiasm,
                              @"Sincere" : sincere,
                           @"Optimistic" : optimistic,
                             @"Negative" : negative,
                              @"Passive" : passive,
                                @"Sassy" : sassy,
                                  @"Shy" : shy,
                          @"Sympathetic" : sympathy,
                         @"Troublemaker" : troublemaker} mutableCopy] ] mutableCopy];
    }

    return self;
}

@end
