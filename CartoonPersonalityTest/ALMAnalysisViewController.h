//
//  ALMAnalysisViewController.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMCharacter.h"
#import "ALMEndViewController.h"

@interface ALMAnalysisViewController : UIViewController

@property (nonatomic, strong) ALMCharacter *topMatch;
@property (nonatomic, strong) ALMCharacter *playerTraits;
//@property (nonatomic, strong) NSArray *duppleCharacters;

@end