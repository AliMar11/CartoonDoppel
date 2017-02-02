//
//  ALMCharacterTraits.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/13/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALMCharacterTraits : NSObject

@property (nonatomic, strong)  NSNumber  *aggressive;
@property (nonatomic, strong) NSNumber *careful;
@property (nonatomic, strong)  NSNumber  *clever;
@property (nonatomic, strong)  NSNumber  *comedic;
@property (nonatomic, strong)  NSNumber  *courage;
@property (nonatomic, strong)  NSNumber  *creative;
@property (nonatomic, strong)  NSNumber  *despicable;
@property (nonatomic, strong)  NSNumber  *determined;
@property (nonatomic, strong)  NSNumber  *dorky;
@property (nonatomic, strong)  NSNumber  *eccentric;
@property (nonatomic, strong)  NSNumber  *enthusiastic;
@property (nonatomic, strong)  NSNumber  *sincere;
@property (nonatomic, strong)  NSNumber  *optimistic;
@property (nonatomic, strong)  NSNumber  *negative;
@property (nonatomic, strong)  NSNumber *passive;
@property (nonatomic, strong)  NSNumber  *sassy;
@property (nonatomic, strong)  NSNumber *shy;
@property (nonatomic, strong)  NSNumber  *sympathetic;
@property (nonatomic, strong)  NSNumber  *troublemaker;
@property (nonatomic, strong) NSMutableDictionary *doppelTraits;
@property (nonatomic, strong) NSMutableArray *topDoppelTraits;

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
                      troublemaker: (NSNumber *)troublemaker;

@end