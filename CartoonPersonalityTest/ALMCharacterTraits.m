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
    {
                _aggressive = @0;
                _careful = @0;
                _clever = @0;
                _comedic = @0;
                _courage = @0;
                _creative = @0;
                _despicable = @0;
                _determined = @0;
                _dorky = @0;
                _eccentric = @0;
                _enthusiastic = @0;
                _naive = @0;
                _optimistic = @0;
                _negative = @0;
                _sassy = @0;
                _shy = @0;
                _sympathetic = @0;
                _troublemaker = @0;
    }

    return self;
}

@end
