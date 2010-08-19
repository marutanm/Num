//
//  NumAppDelegate.m
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright shisobu.in 2010. All rights reserved.
//

#import "NumAppDelegate.h"
#import "TitleViewController.h"

@implementation NumAppDelegate

@synthesize window;
@synthesize titleViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSLog(@"%s", __func__);
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    titleViewController = [[TitleViewController alloc] init];
    [window addSubview:titleViewController.view];

    [window makeKeyAndVisible];
    return YES;
}


- (void)dealloc {
    [TitleViewController release];
    [window release];
    [super dealloc];
}


@end
