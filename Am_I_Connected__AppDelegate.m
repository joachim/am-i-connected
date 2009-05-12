//
//  Am_I_Connected__AppDelegate.m
//  Am I Connected? 
//
//  Created by Joachim Bean on 4/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Am_I_Connected__AppDelegate.h"
#import "WebViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation Am_I_Connected__AppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[self isDataSourceAvailable];
    // Override point for customization after application launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (BOOL)isDataSourceAvailable
{
	static BOOL checkNetwork = YES;
	if (checkNetwork) { 
		checkNetwork = NO;
		
		Boolean success;
		const char *host_name = "www.apple.com";
		
		SCNetworkReachabilityRef reachability = 
		SCNetworkReachabilityCreateWithName(NULL, host_name);
		SCNetworkReachabilityFlags flags;
		success = SCNetworkReachabilityGetFlags(reachability, &flags);
		_isDataSourceAvailable = success && (flags & 
											 kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
		
		//If there is no network connection
		if (!_isDataSourceAvailable) {
			UIAlertView *nonetwork = [[UIAlertView alloc] initWithTitle:@"No Network"
									  
																message:@"You are not connected to the Internet."
															   delegate:nil
													  cancelButtonTitle:@"Dismiss"
													  otherButtonTitles:nil];
			
			[nonetwork show];
		} else {
			//Connection successful
		}
	}
	return _isDataSourceAvailable;
}


- (void)dealloc {
    [viewController release];
	[window release];
    [super dealloc];
}


@end
