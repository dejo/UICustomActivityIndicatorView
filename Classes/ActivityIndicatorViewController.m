//
//  ActivityIndicatorViewController.m
//  ActivityIndicator
//
//  Created by DEJOware on 2/11/10.
//  Copyright DEJOware 2010. All rights reserved.
//

#import "ActivityIndicatorViewController.h"
#import "DEJOwareActivityIndicatorView.h"

@implementation ActivityIndicatorViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	activityIndicatorView = [[DEJOwareActivityIndicatorView alloc]
							 initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge
							 text:NSLocalizedString(@"Searching 123456789012345",@"Searching")
							 superview:self.view];
	//activityIndicatorView.hidesWhenStopped = NO;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	//customActivityIndicatorView = nil;
	activityIndicatorView = nil;
}


- (void)dealloc {
	//[customActivityIndicatorView release];
	[activityIndicatorView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Action Methods

- (IBAction)startAnimating:(id)sender {
	//activityIndicatorView.text = @"Searching craigslist";
	//activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	//activityIndicatorView.hidesWhenStopped = NO;
	[activityIndicatorView startAnimating];
}

- (IBAction)stopAnimating:(id)sender {
	[activityIndicatorView stopAnimating];
	//[activityIndicatorView setText:@"done animating"];
}

@end
