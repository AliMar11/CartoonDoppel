//
//  ALMShareViewController.h
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 1/15/17.
//  Copyright © 2017 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ALMCharacter.h"
#import "ALMEndViewController.h"

@interface ALMShareViewController : UIViewController
@property (strong, nonatomic) ALMCharacter *doppel;
@property (nonatomic, strong) NSMutableArray *analysisData;
@property (nonatomic, assign) NSNumber *counter;

@end
