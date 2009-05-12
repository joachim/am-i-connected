//
//  Am_I_Connected__AppDelegate.h
//  Am I Connected? 
//
//  Created by Joachim Bean on 4/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@interface Am_I_Connected__AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebViewController *viewController;

	BOOL _isDataSourceAvailable;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewController *viewController;

- (BOOL)isDataSourceAvailable;

@end

