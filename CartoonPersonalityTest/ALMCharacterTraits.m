//
//  ALMCharacterTraits.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMCharacterTraits.h"

@implementation ALMCharacterTraits

-(instancetype) initWithAggressive: (int)agression
                          ambition: (int)ambition
                      cheerfulness: (int)cheerfulness
                            clever: (int)cleverness
                           comedic: (int)comedy
                        courageous: (int)courage
                          creative: (int)creativity
                        despicable: (int)despicableness
                        determined: (int)determination
                             dorky: (int)dorkiness
                         eccentric: (int)eccentricity
                      enthusiastic: (int)enthusiasm
                            genius: (int)genius
                           fighter: (int)fight
                          harmless: (int)harmlessness
                             lucky: (int)luck
                             naive: (int)naivity
                        optimistic: (int)optimisticness
                          negative: (int)negativity
                        passionate: (int)passion
                          positive: (int)positivity
                         prankster: (int)pracksterness
                             sassy: (int)sass
                       sympathetic: (int)sympathy
                          talented: (int)talent
                      troublemaker: (int)troublemaker
                          trusting: (int)trust
                     vulnerability: (int)vulnurability
{
    self = [super init];
    if (self)
    {
     _aggressive = self.aggressive;
        _ambitious = self.ambitious;
        _cheerful = self.cheerful;
        _clever = self.clever;
        _comedic = self.comedic;
        _courageous = self.courageous;
        _creative = self.creative;
        _despicable = self.despicable;
        _determined = self.determined;
        _dorky = self.dorky;
        _eccentric = self.eccentric;
        _enthusiastic = self.enthusiastic;
        _genius = self.genius;
        _fighter = self.fighter;
        _harmless = self.harmless;
        _lucky = self.lucky;
        _naive = self.naive;
        _optimistic = self.optimistic;
        _negative = self.negative;
        _passionate = self.passionate;
        _positive = self.positive;
        _prankster = self.prankster;
        _sassy = self.sassy;
        _sympathetic = self.sympathetic;
        _troublemaker = self.troublemaker;
        _trusting = self.trusting;
        _vulnerability = self.vulnerability;
    }
    
    return  self;
}

@end
