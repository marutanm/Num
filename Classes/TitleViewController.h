//
//  TitleViewController.h
//  Num
//
//  Created by marutanm on 6/11/10.
//  Copyright 2010 shisobu.in. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>


@interface TitleViewController : UIViewController <GKPeerPickerControllerDelegate>{
	// networking
	GKSession		*gameSession;
	int				gameUniqueID;
	int				gamePacketNumber;
	NSString		*gamePeerId;
	NSDate			*lastHeartbeatDate;

}

@property(nonatomic, retain) GKSession	 *gameSession;
@property(nonatomic, copy)	 NSString	 *gamePeerId;
@property(nonatomic, retain) NSDate		 *lastHeartbeatDate;

-(void)startPicker;

@end
