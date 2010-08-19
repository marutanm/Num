//
//  NumAppDelegate.h
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright shisobu.in 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TitleViewController;

@interface NumAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TitleViewController *titleViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) TitleViewController *titleViewController;

@end

