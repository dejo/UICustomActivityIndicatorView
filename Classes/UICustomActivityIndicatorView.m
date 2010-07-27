//
//  UICustomActivityIndicatorView.m
//  ActivityIndicator
//
//  Created by dejo on 2/11/10.
//  Copyright 2010 DEJOware. All rights reserved.
//
//  Code can be freely redistruted and modified as long as the above copyright remains.
//

#import "UICustomActivityIndicatorView.h"

// =================================
// = Interface for private methods
// =================================
@interface UICustomActivityIndicatorView (private)

- (void)setGearSizes;
- (void)restyleTextLabel; 

@end

static CGFloat smallGearSize;
static CGFloat largeGearSize;

@implementation UICustomActivityIndicatorView

@synthesize text;

//
//  initWithActivityIndicatorStyle:text:superview
//
//  Initializes and returns a customized activity-indicator object
//
- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
								text:(NSString *)someText
						   superview:(UIView *)aSuperview
//
//  Parameters:
//  style
//      A constant that specifies the style of the object to be created. See UIActivityIndicatorStyle
//      for descriptions of the style constants
//  text
//      The indicator's text, to be displayed in a label next to the gear. If nil, "Loading" is displayed.
//  superview
//      The view to which is activity indicator will be added as subview. Should be a UIView or subclass thereof
//
//  Return Value
//  An initialized UICustomActivityIndicatorView object or nil if the object couldn’t be created or no superview
//  was specified.
//
//  Discussion
//  UICustomActivityIndicatorView sizes the returned instance according to the specified style. You can set
//  and retrieve the style of a activity indicator through the activityIndicatorViewStyle property. It also
//  centers it within the superview and styles the text based on the indicator style. You can also set
//  and retrieve the text and superview through their properties.
//
{
	if ([self initWithActivityIndicatorStyle:style] == nil) {
		return nil;
	}

	if (aSuperview == nil) {
		return nil;
	} else {
		superview = aSuperview;
	}
	[superview addSubview:self];
	
	textLabel = [[UILabel alloc] init];
	// Don't worry about the frame size right now; it'll soon be resized
	textLabel.frame = CGRectMake(0, 0, 200, 36);
	textLabel.backgroundColor = [UIColor clearColor];
	textLabel.hidden = YES;
	[self restyleTextLabel];
	[superview addSubview:textLabel];
	
	// calling this will also ensure layoutSubviews is called
	[self setText:someText];
	
	[self setGearSizes];

	return self;
}

//
//  setText:
//
//  Override synthesized setter so that we can set a default string as well as call layoutSubviews
//
- (void)setText:(NSString *)someText {
	[someText retain];
	[text release];
	if (someText == nil || [someText length] == 0) {
		text = NSLocalizedString(@"Loading",@"Loading");
	} else {
		text = someText;
	}
	// Now that the text is changed, we need to propgate to the textLabel and realign things
	[self layoutSubviews];
}

- (void)dealloc {
	[textLabel release];
	[text release];
	[super dealloc];
}

#pragma mark -
#pragma mark Overriding Super Methods

- (void)setHidesWhenStopped:(BOOL)hides {
	[super setHidesWhenStopped:hides];
	if (!hides) {
		textLabel.hidden = NO;
	} else {
		textLabel.hidden = YES;
	}

}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style {
	[super setActivityIndicatorViewStyle:style];

	// we need to resize the frame for the gear since there is seemingly a bug that
	// resetting the style doesn't resize the frame as well
	if (style == UIActivityIndicatorViewStyleWhiteLarge) {
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, largeGearSize, largeGearSize);
	} else {
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, smallGearSize, smallGearSize);
	}
	// If the style has changed, we should adjust the styling of the textLabel as well
	[self restyleTextLabel];
	// And then we should realign it
	[self layoutSubviews];
}

- (void)startAnimating {
	[super startAnimating];

	textLabel.hidden = NO;
}

- (void)stopAnimating {
	[super stopAnimating];

	if (self.hidesWhenStopped) {
		textLabel.hidden = YES;
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];

	// No sense doing all this if textLabel has not been instantiated yet
	if (textLabel != nil) {
		textLabel.text = [NSString stringWithFormat:@"%@...", self.text];
		[textLabel sizeToFit];
		// Calculate the new width for our "view" with gear, 5px spacer and textLabel
		CGFloat totalWidth = self.frame.size.width + 5.0 + textLabel.frame.size.width;
		// Realign the gear to be left-aligned in our "view"
		self.center = CGPointMake(superview.center.x - (totalWidth - self.frame.size.width)/2.0, superview.center.y);
		// Realign the textLabel to butt against the gear but with a 5px gap, also vertically aligned within the "view"
		textLabel.frame = CGRectMake(self.frame.origin.x + self.frame.size.width + 5.0, self.frame.origin.y + (self.frame.size.height - textLabel.frame.size.height)/2.0, textLabel.frame.size.width, textLabel.frame.size.height);
	}
}

@end

// =====================================
// = Implementation of private methods
// =====================================
@implementation UICustomActivityIndicatorView (private)

//
// setGearSizes
//
// Set the static vars for the gear sizes, based on what they would be if instantiated
//
- (void)setGearSizes {
	UIActivityIndicatorView *smallGear = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	smallGearSize = smallGear.frame.size.width;
	[smallGear release];
	UIActivityIndicatorView *largeGear = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	largeGearSize = largeGear.frame.size.width;
	[largeGear release];
}

//
// restyleTextLabel
//
// Based on the activityIndicatorViewStyle, restyle the textLabel accordingly
//
- (void)restyleTextLabel {
	if (self.activityIndicatorViewStyle == UIActivityIndicatorViewStyleWhiteLarge) {
		textLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]*1.33];
	} else {
		textLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]*0.9];
	}
	
	if (self.activityIndicatorViewStyle == UIActivityIndicatorViewStyleGray) {
		textLabel.textColor = [UIColor colorWithWhite:0.33 alpha:1.0];
		textLabel.shadowColor = [UIColor whiteColor];
		textLabel.shadowOffset = CGSizeMake(0, 1);
	} else {
		textLabel.textColor = [UIColor colorWithWhite:0.96 alpha:1.0];
		textLabel.shadowColor = [UIColor clearColor];
		textLabel.shadowOffset = CGSizeMake(0, 0);
	}
}

@end


