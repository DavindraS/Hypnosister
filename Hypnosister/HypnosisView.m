//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Davindra Sutraban on 9/19/13.
//  Copyright (c) 2013 Davindra Sutraban. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void)drawRect:(CGRect)rect
{
    // Set a context (which maintains the state of the drawing ie. color/thickness of pen) to the current context
    // that is automatically created
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // bounds gives the view's size independent of the superviews size
    // We don't care about the superview until we are ready to draw the view onto the screen
    CGRect bounds = [self bounds];
    
    // Draw a circle in the center of the bounds rectangle (size of the current view)
    // Figure out the center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // Set the radius to be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    // Set the thickness of the line (context) to be 10 pts
    CGContextSetLineWidth(ctx, 10);
    
    // Set the color of the line to be gray
    CGContextSetRGBFillColor(ctx, .6, .6, .6, 1);
    
    // Add shape - this doesn't draw the shape yet
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2, YES);
    
    // PERFORM THE DRAWING INSTRUCTION
    CGContextStrokePath(ctx);
}

// Override default initializer to make the background clear
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

@end
