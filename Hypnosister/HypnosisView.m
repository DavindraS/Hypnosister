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
    
}

@end
