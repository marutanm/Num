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
@synthesize titleView;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    NSLog(@"%s", __func__);
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    titleView = [[TitleViewController alloc] init];
    [window addSubview:titleView.view];
    [TitleViewController release];

    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
