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
     _aggressive = 0;
        _ambitious = 0;
        _cheerful = 0;
        _clever = 0;
        _comedic = 0;
        _courageous = 0;
        _creative = 0;
        _despicable = 0;
        _determined = 0;
        _dorky = 0;
        _eccentric = 0;
        _enthusiastic = 0;
        _genius = 0;
        _fighter = 0;
        _harmless = 0;
        _lucky = 0;
        _naive = 0;
        _optimistic = 0;
        _negative = 0;
        _passionate = 0;
        _positive = 0;
        _prankster = 0;
        _sassy = 0;
        _sympathetic = 0;
        _troublemaker = 0;
        _trusting = 0;
        _vulnerability = 0;
    }
    
    return  self;
}

@end
