//
//  ViewController.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 9/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMDuppleCollectionViewController.h"
#import "ALMQuestionViewController.h"
#import "ALMCharacter.h"

@interface ALMStartScreenViewController : UIViewController 
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) ALMCharacter *player;
@end

