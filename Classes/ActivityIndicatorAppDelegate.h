//
//  ActivityIndicatorAppDelegate.h
//  ActivityIndicator
//
//  Created by DEJOware on 7/27/10.
//  Copyright DEJOware 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActivityIndicatorViewController;

@interface ActivityIndicatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ActivityIndicatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ActivityIndicatorViewController *viewController;

@end

