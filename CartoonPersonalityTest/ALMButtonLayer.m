//
//  ALMButtonLayer.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 12/14/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMButtonLayer.h"
@interface ALMButtonLayer ()
@property (strong, nonatomic) CAGradientLayer *backgroundLayer;
@property (strong, nonatomic) CAGradientLayer *highlightedStateLayer;

@end

@implementation ALMButtonLayer

-(id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder: aDecoder];
   
    if (self)
    {
        [self drawButton];
        [self drawBackground];
        [self drawHighlightedButtonState];
        self.highlightedStateLayer.hidden = YES;
    }
    
    return self;
}

-(void)layoutSubviews
{
    self.backgroundLayer.frame = self.bounds;
    self.highlightedStateLayer.frame = self.bounds;
    
    [super layoutSubviews];
}

-(void)setHighlighted:(BOOL)highlighted
{
    if (self.tag != 2)
    {
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    
    self.highlightedStateLayer.hidden = !highlighted;
    [super setHighlighted: highlighted];
    
    [CATransaction commit];
    
    [super setHighlighted: highlighted];
    }
}

//setters for all UIbutton layers
-(void)drawButton
{
    if (self.tag != 2)
    {
        CALayer *buttonLayer = self.layer;
        buttonLayer.cornerRadius = 5;
        buttonLayer.borderWidth = 1;
        buttonLayer.borderColor = [UIColor darkGrayColor].CGColor;
    }
        else
        {
            CALayer *buttonLayer = self.layer;
            buttonLayer.cornerRadius = 5;
            buttonLayer.borderWidth = 1;
            buttonLayer.borderColor = [UIColor clearColor].CGColor;
        
        }
}

-(void)drawBackground
{
    if (self.tag != 2)
    {
        
        if (!_backgroundLayer)
        {
        self.backgroundLayer = [CAGradientLayer layer];
            self.backgroundLayer.cornerRadius = 5;
        self.backgroundLayer.colors = (@[(id)[UIColor lightGrayColor].CGColor,
                                         (id)[UIColor grayColor].CGColor]);
        
        self.backgroundLayer.locations = (@[@0.0f, @1.0f]);
        
        [self.layer insertSublayer: self.backgroundLayer atIndex: 0];
        }
    }
        
}

-(void)drawHighlightedButtonState
{
    if (self.tag != 2)
    {
        
        if (!_highlightedStateLayer)
        {
            self.highlightedStateLayer = [CAGradientLayer layer];
            self.highlightedStateLayer.cornerRadius = 5;
            self.highlightedStateLayer.colors = (@[(id)[UIColor grayColor].CGColor,
                                                   (id)[UIColor lightGrayColor].CGColor]);
            
            self.highlightedStateLayer.locations = (@[@0.0f, @1.0f]);
            
            [self.layer insertSublayer: self.highlightedStateLayer atIndex: 1];
        }
    }
    else
    {
//        if (!_highlightedStateLayer)
//        {
//            self.highlightedStateLayer = [CAGradientLayer layer];
//            self.highlightedStateLayer.cornerRadius = 5;
//            self.highlightedStateLayer.colors = (@[(id)[UIColor clearColor].CGColor,
//                                                   (id)[UIColor clearColor].CGColor]);
//           
//            self.highlightedStateLayer.locations = (@[@0.0f, @1.0f]);
//            
//            [self.layer insertSublayer: self.highlightedStateLayer atIndex: 1];
//        }
    }
    
}
@end
