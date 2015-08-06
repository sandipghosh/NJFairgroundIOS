//
//  SafeNavController.h
//  TunebashA
//
//  Created by Avik B on 22/03/14.
//  Copyright (c) 2014 Avik B. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 creating this subclass for additional protection against the black-screen bug (or double-tap issue) that is caused by
 nested push/pop transitions in ios 7. this is apparently a bug in ios 7. the concept that this class works on is that it prevents
 push/pop on/off the navigation controller stack till at least a specified duration/interval has elapsed since the last push/pop
 transition was made. this makes sure two/more pushes, or two/more pops, or any random combination of them do not nest under one another
 by repeating very fast (ie., before the original push/pop transition could actually be completed by the navigation controller.
*/

@interface SafeNavController : UINavigationController

@property (nonatomic) double lastpoporpushtransitionmadeat;

@end
