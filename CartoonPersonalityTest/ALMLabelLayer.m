//
//  ALMLabelLayer.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 12/18/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMLabelLayer.h"

@implementation ALMLabelLayer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(CAGradientLayer*)labelgradient
{
    UIColor *yellow= [UIColor yellowColor];
    UIColor *orange= [UIColor orangeColor];
    UIColor *red= [UIColor redColor];
    UIColor *pink= [UIColor colorWithRed: 255 green: 35 blue: 134 alpha:1];
    UIColor *green = [UIColor greenColor];
    NSArray *colors = [NSArray arrayWithObjects: yellow, orange, red, pink, green, nil];
    
    
    CAGradientLayer *labelLayer = [CAGradientLayer layer];
    labelLayer.colors = colors;
    [labelLayer setStartPoint: CGPointMake(0.0, 0.5)];
    [labelLayer setEndPoint: CGPointMake(1.0, 0.5)];
    
    return labelLayer;
    
    /*
     NSNumber *divisionOne = [NSNumber numberWithFloat: 0.0];
     NSNumber *divisionT = [NSNumber numberWithFloat: 0.5];
     NSNumber *divisionTh = [NSNumber numberWithFloat: 1.0];
     
     NSArray *grandientLocations= [NSArray arrayWithObjects: divisionOne, divisionT, divisionTh, nil];
     CAGradientLayer *labelLayer = [CAGradientLayer layer];
     labelLayer.colors = colors;
     labelLayer.locations = grandientLocations;
     
     return labelLayer;
     */
}

@end
