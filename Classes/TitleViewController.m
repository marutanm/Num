    //
//  TitleViewController.m
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright 2010 shisobu.in. All rights reserved.
//

#import "TitleViewController.h"

// GameKit Session ID for app
#define SessionID @"num"


@implementation TitleViewController

@synthesize gameSession, gamePeerId, lastHeartbeatDate;


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

#pragma mark GKPeerPickerControllerDelegate Methods

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker { 
	// Peer Picker automatically dismisses on user cancel. No need to programmatically dismiss.
    
	// autorelease the picker. 
	picker.delegate = nil;
    [picker autorelease]; 
	
	// invalidate and release game session if one is around.
	if(self.gameSession != nil)	{
		// [self invalidateSession:self.gameSession];
		self.gameSession = nil;
	}
	
	// go back to start mode
	// self.gameState = kStateStartGame;
} 

//
// Provide a custom session that has a custom session ID. This is also an opportunity to provide a session with a custom display name.
//
- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type { 
    NSLog(@"%s", __func__);
	GKSession *session = [[GKSession alloc] initWithSessionID:SessionID displayName:nil sessionMode:GKSessionModePeer]; 
	return [session autorelease]; // peer picker retains a reference, so autorelease ours so we don't leak.
}

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session { 
    NSLog(@"%s", __func__);
	// Remember the current peer.
	self.gamePeerId = peerID;  // copy
	
	// Make sure we have a reference to the game session and it is set up
	self.gameSession = session; // retain
	self.gameSession.delegate = self; 
	[self.gameSession setDataReceiveHandler:self withContext:NULL];
	
	// Done with the Peer Picker so dismiss it.
	[picker dismiss];
	picker.delegate = nil;
	[picker autorelease];
	
	// Start Multiplayer game by entering a cointoss state to determine who is server/client.
	// self.gameState = kStateMultiplayerCointoss;
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
