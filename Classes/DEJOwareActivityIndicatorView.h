//
//  DEJOwareActivityIndicatorView.h
//  ActivityIndicator
//
//  Created by DEJOware on 3/10/11.
//  Copyright 2011 DEJOware. All rights reserved.
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
//  This class is subclassed from UIView
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
//  - If the text string you set is too long (> 20 chars), it will be truncated. Try to keep it short:
//    as in, one or two words, especially when using the WhiteLarge style, in order to avoid truncation
//  - The styling of the text is not currently customizable but based on the indicator style
//
//  SAMPLE USAGE:
//
//  Add the following code to a viewDidLoad:
//  	DEJOwareActivityIndicatorView *activityIndicatorView = [[DEJOwareActivityIndicatorView alloc]
//			initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray
//			text:NSLocalizedString(@"Searching",@"Searching")
//			superview:self.view];
//  Trigger the animation:
//		[activityIndicatorView startAnimating];
//
//  VERSION: 1.0
//

#import <UIKit/UIKit.h>


@interface DEJOwareActivityIndicatorView : UIView {
	NSString *_text;
@private
	UIActivityIndicatorView *_activityIndicatorView;
	UILabel *_label;
	UIView *_superview;
}
@property (nonatomic, retain) NSString *text;

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
								text:(NSString *)theText
						   superview:(UIView *)theSuperview;

@property(nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle; // default is UIActivityIndicatorViewStyleWhite
@property(nonatomic) BOOL hidesWhenStopped; // default is YES. calls -setHidden when animating gets set to NO

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

@end
