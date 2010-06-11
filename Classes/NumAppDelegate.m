//
//  NumAppDelegate.m
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright shisobu.in 2010. All rights reserved.
//

#import "NumAppDelegate.h"

@implementation NumAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    NSLog(@"%s", __func__);
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
