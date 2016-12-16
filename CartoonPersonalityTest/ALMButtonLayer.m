//
//  ALMButtonLayer.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 12/14/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMButtonLayer.h"
@interface ALMButtonLayer ()
//@property (strong, nonatomic) CALayer *kaPingLayer;
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
        //[self drawKaPing];
        [self drawBackground];
        [self drawHighlightedButtonState];
        self.highlightedStateLayer.hidden = YES;
    }
    
    return self;
}

-(void)layoutSubviews
{
    //self.backgroundLayer.cornerRadius = 5;
    //self.kaPingLayer.frame = CGRectInset(self.bounds, 1, 1);
    self.backgroundLayer.frame = self.bounds;
    self.highlightedStateLayer.frame = self.bounds;
    
    [super layoutSubviews];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    
    self.highlightedStateLayer.hidden = !highlighted;
    [super setHighlighted: highlighted];
    
    [CATransaction commit];
    
    [super setHighlighted: highlighted];
}

//setters for all UIbutton layers
-(void)drawButton
{
    CALayer *buttonLayer = self.layer;
    buttonLayer.cornerRadius = 5;
    buttonLayer.borderWidth = 1;
    buttonLayer.borderColor = [UIColor darkGrayColor].CGColor;
}

-(void)drawBackground
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

-(void)drawHighlightedButtonState
{
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

/*
////light topmost button layer, adds... pizzaz? ha.
-(void)drawKaPing
{
    if (!_kaPingLayer)
    {
    self.kaPingLayer = [CALayer layer];
    self.kaPingLayer.cornerRadius = 4;
    self.kaPingLayer.borderColor = [UIColor yellowColor].CGColor;
    self.kaPingLayer.opacity = 0.5;
    self.kaPingLayer.borderWidth = 1;
    
    [self.layer insertSublayer: self.kaPingLayer atIndex: 2];
    }
}
 */
}
@end
