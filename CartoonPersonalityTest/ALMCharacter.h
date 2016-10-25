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
@property (nonatomic,  strong) NSArray *characterList;
@property (nonatomic, strong) ALMCharacter *character;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) UIImage *mugshot;
@property (nonatomic, strong) ALMCharacterTraits *traits;

-(instancetype)initWithCharacter: (NSString*)characterName
                         picture: (UIImage*)mugshot
                 characterTraits: (ALMCharacterTraits*)traits;

-(void)populateCharacterList;

-(instancetype)initWithUserCharacter: (NSString*)userName
                     characterTraits: (ALMCharacterTraits*)traits;

+(void)createUser: (NSString *)userName withCompletion: (void(^)())completion;
+(void)tallyUserAnswers;


@end
