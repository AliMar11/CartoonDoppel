//
//  ALMBackgroundLayer.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 12/14/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMBackgroundLayer.h"

@implementation ALMBackgroundLayer

+(CAGradientLayer*)blueGradient
{
    UIColor *colorOne = [UIColor colorWithRed:(85/255.0) green:(238/255.0) blue:(204/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(87/255.0)  green:(207/255.0)  blue:(245/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    
    NSNumber *colorOneBounds = [NSNumber numberWithFloat:0.0];
    NSNumber *colorTwoBounds = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:colorOneBounds, colorTwoBounds, nil];
    
    CAGradientLayer *backgroundLayer = [CAGradientLayer layer];
    
    backgroundLayer.colors = colors;
    backgroundLayer.locations = locations;
    
    return backgroundLayer;
}

@end
