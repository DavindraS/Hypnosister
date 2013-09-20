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
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Set the thickness of the line (context) to be 10 pts
    CGContextSetLineWidth(ctx, 10);
    
    // Set the color of the line to be gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw concentric circles
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2, YES);
        // DRAW
        CGContextStrokePath(ctx);
    }
    
    // Create a string
    NSString *text = @"You are getting sleepy.";
    
    // Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    // sizeWithFont is deprecated - Docs recommend sizeWithAttributes
    // This takes an NSDictionary of attribtutes
    NSDictionary *attr = [NSDictionary dictionaryWithObject:font forKey:@"font"];
    
    // Set the size of the textRect the size of the string
    textRect.size = [text sizeWithAttributes:attr];
    
    // Put string in the center of the rect
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    /*
    // Shadow that will move 4pts to the right and 3 pts down from the text
    CGSize offset = CGSizeMake(4, 3);
    
    // Color of the shadow
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // Set the shadow
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    */
    // Draw the string
    [text drawInRect:textRect withAttributes:attr];
    
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
