//
//  ALMEndViewController.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/12/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMCharacter.h"
#import "ALMStartScreenViewController.h"
#import "ALMStartScreenViewController.h"

@interface ALMEndViewController : UIViewController
@property (nonatomic, strong) ALMCharacter *theOne;

-(void) playAgainButtonPressed;

@end
