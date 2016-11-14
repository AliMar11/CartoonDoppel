//
//  ALMCharacter.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/22/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ALMQuestions.h"
#import "ALMCharacterTraits.h"

@interface ALMCharacter : NSObject
@property (nonatomic, strong) ALMCharacter *character;
@property (nonatomic, strong) ALMCharacter *player;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic, strong) NSMutableDictionary *traitDictionary;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) UIImage *mugshot;
@property (nonatomic, strong) ALMCharacterTraits *traits;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, assign) int likeness;

-(instancetype)initWithUserCharacter: (NSString*)userName
                     characterTraits: (NSMutableDictionary*)traitDictionary;

-(instancetype)initWithCharacter: (NSString*)characterName
                         picture: (UIImage*)mugshot
                 characterTraits: (ALMCharacterTraits*)traits;

+(void)createUser: (NSString *)userName withCompletion: (void(^)())completion;
+(void)populateCharacterListWithCompletion: (void(^)(NSMutableArray *characterList))completion;

@end