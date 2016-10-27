//
//  ALMCharacterTraits.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALMCharacterTraits : NSObject

@property (nonatomic, strong) NSDictionary *traitDictionary;
@property (nonatomic, strong)  NSNumber  *aggressive;
@property (nonatomic, strong)  NSNumber  *ambitious;
@property (nonatomic, strong)  NSNumber  *cheerful;
@property (nonatomic, strong)  NSNumber  *clever;
@property (nonatomic, strong)  NSNumber  *comedic;
@property (nonatomic, strong)  NSNumber  *courageous;
@property (nonatomic, strong)  NSNumber  *creative;
@property (nonatomic, strong)  NSNumber  *despicable;
@property (nonatomic, strong)  NSNumber  *determined;
@property (nonatomic, strong)  NSNumber  *dorky;
@property (nonatomic, strong)  NSNumber  *eccentric;
@property (nonatomic, strong)  NSNumber  *enthusiastic;
@property (nonatomic, strong)  NSNumber  *genius;
@property (nonatomic, strong)  NSNumber  *fighter;
@property (nonatomic, strong)  NSNumber  *harmless;
@property (nonatomic, strong)  NSNumber  *lucky;
@property (nonatomic, strong)  NSNumber  *naive;
@property (nonatomic, strong)  NSNumber  *optimistic;
@property (nonatomic, strong)  NSNumber  *negative;
@property (nonatomic, strong)  NSNumber  *passionate;
@property (nonatomic, strong)  NSNumber  *positive;
@property (nonatomic, strong)  NSNumber  *prankster;
@property (nonatomic, strong)  NSNumber  *sassy;
@property (nonatomic, strong)  NSNumber  *sympathetic;
@property (nonatomic, strong)  NSNumber  *talented;
@property (nonatomic, strong)  NSNumber  *troublemaker;
@property (nonatomic, strong)  NSNumber  *trusting;
@property (nonatomic, strong)  NSNumber  *vulnerability;

-(instancetype) initWithAggressive: (NSNumber *)aggression
                          ambition: (NSNumber *)ambition
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
                          positive: (NSNumber *)positivity
                         prankster: (NSNumber *)pracksterness
                             sassy: (NSNumber *)sass
                       sympathetic: (NSNumber *)sympathy
                          talented: (NSNumber *)talent
                      troublemaker: (NSNumber *)troublemaker
                          trusting: (NSNumber *)trust
                     vulnerability: (NSNumber *)vulnurability;

 
@end
