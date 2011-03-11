//
//  ActivityIndicatorAppDelegate.m
//  ActivityIndicator
//
//  Created by DEJOware on 2/11/10.
//  Copyright DEJOware 2010. All rights reserved.
//

#import "ActivityIndicatorAppDelegate.h"
#import "ActivityIndicatorViewController.h"

@implementation ActivityIndicatorAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
