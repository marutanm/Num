    //
//  TitleViewController.m
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright 2010 shisobu.in. All rights reserved.
//

#import "TitleViewController.h"


@implementation TitleViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    NSLog(@"%s", __func__);
    [super loadView];
    UIView *view = [[UIView alloc] init];
    self.view = view;
    [view release];
    [self startPicker];
}


#pragma mark -
#pragma mark Peer Picker Related Methods

-(void)startPicker {
    NSLog(@"%s", __func__);
	GKPeerPickerController*		picker;
	
	// self.gameState = kStatePicker;			// we're going to do Multiplayer!
	
    // note: picker is released in various picker delegate methods when picker use is done.
	picker = [[GKPeerPickerController alloc] init]; 
	picker.delegate = self;
	[picker show];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
