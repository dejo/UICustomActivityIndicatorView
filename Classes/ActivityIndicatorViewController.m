//
//  ActivityIndicatorViewController.m
//  ActivityIndicator
//
//  Created by DEJOware on 2/11/10.
//  Copyright DEJOware 2010. All rights reserved.
//

#import "ActivityIndicatorViewController.h"
#import "UICustomActivityIndicatorView.h"

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
	
	customActivityIndicatorView = [[UICustomActivityIndicatorView alloc]
								   initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray
								   text:NSLocalizedString(@"Searching",@"Searching")
								   superview:self.view];
	
	//customActivityIndicatorView.hidesWhenStopped = NO;
	//self.view.backgroundColor = [UIColor blackColor];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	customActivityIndicatorView = nil;
}


- (void)dealloc {
	[customActivityIndicatorView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Action Methods

- (IBAction)startAnimating:(id)sender {
	//customActivityIndicatorView.text = @"Searching craigslist";
	//customActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	//customActivityIndicatorView.hidesWhenStopped = NO;
	[customActivityIndicatorView startAnimating];
}

- (IBAction)stopAnimating:(id)sender {
	[customActivityIndicatorView stopAnimating];
}

@end
