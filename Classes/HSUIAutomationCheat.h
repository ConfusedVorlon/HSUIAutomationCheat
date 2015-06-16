//
//  HSSnapshotChat.h
//  VLCRemote2
//
//  Created by Rob Jonson on 05/06/2015.
//
//

#import <Foundation/Foundation.h>

#ifdef SNAPSHOT

#define HSUIAutomationCheatWindow(window) [HSUIAutomationCheat installForWindow:window]

@interface HSUIAutomationCheat : NSObject

+(void)installForWindow:(UIWindow*)window;

@end

#else

#define HSUIAutomationCheatWindow(window)

#endif
