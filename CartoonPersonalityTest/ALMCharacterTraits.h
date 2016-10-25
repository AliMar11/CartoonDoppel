//
//  ALMCharacterTraits.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALMCharacterTraits : NSObject
@property (nonatomic, assign)int *aggressive;
@property (nonatomic, assign)int *ambitious;
@property (nonatomic, assign)int *careful;
@property (nonatomic, assign)int *cheerful;
@property (nonatomic, assign)int *clever;
@property (nonatomic, assign)int *comedic;
@property (nonatomic, assign)int *courageous;
@property (nonatomic, assign)int *creative;
@property (nonatomic, assign)int *despicable;
@property (nonatomic, assign)int *determined;
@property (nonatomic, assign)int *dorky;
@property (nonatomic, assign)int *eccentric;
@property (nonatomic, assign)int *enthusiastic;
@property (nonatomic, assign)int *genius;
@property (nonatomic, assign)int *fighter;
@property (nonatomic, assign)int *harmless;
@property (nonatomic, assign)int *lucky;
@property (nonatomic, assign)int *naive;
@property (nonatomic, assign)int *optimistic;
@property (nonatomic, assign)int *negative;
@property (nonatomic, assign)int *passionate;
@property (nonatomic, assign)int *passive;
@property (nonatomic, assign)int *positive;
@property (nonatomic, assign)int *prankster;
@property (nonatomic, assign)int *sassy;
@property (nonatomic, assign)int *shy;
@property (nonatomic, assign)int *sympathetic;
@property (nonatomic, assign)int *talented;
@property (nonatomic, assign)int *troublemaker;
@property (nonatomic, assign)int *trusting;
@property (nonatomic, assign)int *vulnerability;

-(instancetype) initWithAggressive: (int)aggression
                          ambition: (int)ambition
                           careful: (int)careful
                      cheerfulness: (int)cheerfulness
                            clever: (int)cleverness
                           comedic: (int)comedic
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
                           passive: (int)passive
                          positive: (int)positivity
                         prankster: (int)pracksterness
                             sassy: (int)sass
                               shy: (int)shy
                       sympathetic: (int)sympathy
                          talented: (int)talent
                      troublemaker: (int)troublemaker
                          trusting: (int)trust
                     vulnerability: (int)vulnurability;

@end
