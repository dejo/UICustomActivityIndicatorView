//
//  UICustomActivityIndicatorView.h
//  ActivityIndicator
//
//  Created by dejo on 2/11/10.
//  Copyright 2010 DEJOware. All rights reserved.
//
//  Code can be freely redistruted and modified as long as the above copyright remains.
//
//  DESCRIPTION:
//
//  This class is intended to provide an activity indicator view that includes a text label
//  next to the "spinning gear" all centered nicely within the superview. It is similar to the
//  one you see, for example, in the App Store app when it is searching and displays the
//  usual activity indicator (the spinning gear) with a label reading "Loading..." next to it.
//
//  SUPERCLASS:
//  
//  This class is subclassed from UIActivityIndicatorView
//
//  PROPERTIES:
//
//  This class provides one new property: an NSString named "text" to set the text of the label;
//  the ellipsis (i.e. the "...") is added automatically
//
//  METHODS:
//
//  - (id) initWithActivityIndicatorStyle:text:superview
//    This method is similar to UIActivityIndicatorView's initWithActivityIndicatorStyle: but
//    adds parameters for the text string for the label and the superview for this view.
//
//  KNOWN LIMITATIONS:
//
//  - If the text string you set is too long, there will be display issues. Try to keep it short:
//    as in, one or two words, especially when using the WhiteLarge style
//  - The styling of the text is not currently customizable but based on the indicator style
//
//  SAMPLE USAGE:
//
//  Add the following code to a viewDidLoad:
//  	UICustomActivityIndicatorView *customActivityIndicatorView = [[UICustomActivityIndicatorView alloc]
//			initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray
//			text:NSLocalizedString(@"Searching",@"Searching")
//			superview:self.view];
//  Trigger the animation:
//		[customActivityIndicatorView startAnimating];
//
//  VERSION: 1.0
//

#import <Foundation/Foundation.h>


@interface UICustomActivityIndicatorView : UIActivityIndicatorView {
	NSString *text;
@private
	UILabel *textLabel;
	UIView *superview;
}
@property (nonatomic, retain) NSString *text;

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
								text:(NSString *)someText
						   superview:(UIView *)aSuperview;

@end