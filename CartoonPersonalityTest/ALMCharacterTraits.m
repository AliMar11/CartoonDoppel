//
//  ALMCharacterTraits.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMCharacterTraits.h"

@implementation ALMCharacterTraits

-(instancetype) initWithAggressive: (NSNumber *)aggression
                      ambition: (NSNumber *)ambition
//                          careful: (NSNumber *)careful
                  cheerfulness: (NSNumber *)cheerfulness
                        clever: (NSNumber *)cleverness
                       comedic: (NSNumber *)comedic
                    courageous: (NSNumber *)courage
                      creative: (NSNumber *)creativity
                    despicable: (NSNumber *)despicableness
                    determined: (NSNumber *)determination
                         dorky: (NSNumber *)dorkiness
                     eccentric: (NSNumber *)eccentricity
                  enthusiastic: (NSNumber *)enthusiasm
                        genius: (NSNumber *)genius
                       fighter: (NSNumber *)fight
                      harmless: (NSNumber *)harmlessness
                         lucky: (NSNumber *)luck
                         naive: (NSNumber *)naivity
                    optimistic: (NSNumber *)optimisticness
                      negative: (NSNumber *)negativity
                    passionate: (NSNumber *)passion
//                           passive: (NSNumber *)passive
                      positive: (NSNumber *)positivity
                     prankster: (NSNumber *)pracksterness
                         sassy: (NSNumber *)sass
//                               shy: (NSNumber *)shy
                   sympathetic: (NSNumber *)sympathy
                      talented: (NSNumber *)talent
                  troublemaker: (NSNumber *)troublemaker
                      trusting: (NSNumber *)trust
                 vulnerability: (NSNumber *)vulnurability
{
    
    self = [super init];
    if (self)
    {
                _aggressive = @0;
                _ambitious = @0;
                _cheerful = @0;
                _clever = @0;
                _comedic = @0;
                _courageous = @0;
                _creative = @0;
                _despicable = @0;
                _determined = @0;
                _dorky = @0;
                _eccentric = @0;
                _enthusiastic = @0;
                _genius = @0;
                _fighter = @0;
                _harmless = @0;
                _lucky = @0;
                _naive = @0;
                _optimistic = @0;
                _negative = @0;
                _passionate = @0;
                _positive = @0;
                _prankster = @0;
                _sassy = @0;
                _sympathetic = @0;
                _troublemaker = @0;
                _trusting = @0;
                _vulnerability = @0;
          }

    return self;
}

@end
