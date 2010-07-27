//
//  ActivityIndicatorViewController.h
//  ActivityIndicator
//
//  Created by DEJOware on 2/11/10.
//  Copyright DEJOware 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICustomActivityIndicatorView;

@interface ActivityIndicatorViewController : UIViewController {
@private
	UICustomActivityIndicatorView *customActivityIndicatorView;
}

- (IBAction)startAnimating:(id)sender;
- (IBAction)stopAnimating:(id)sender;

@end

