//
//  AppDelegate.m
//  11111
//
//  Created by 仝兴伟 on 2018/2/26.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//  然后创建TrackingArea的时候不要在drawRect里面搞。要在updateTrackingAreas里面弄
//  最主要的改动都是在ApplyDecrytionWaitVC里面干的
#import "AppDelegate.h"
#import "MyVC.h"
@interface AppDelegate ()
@property (nonatomic, strong) MyVC *myVC;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.myVC = [[MyVC alloc]initWithNibName:@"MyVC" bundle:nil];
    NSWindow *myWindow = [NSWindow windowWithContentViewController:self.myVC];
    self.windowController = [[NSWindowController alloc]initWithWindow:myWindow];
    self.windowController.window.titlebarAppearsTransparent  = YES;
    self.windowController.window.movableByWindowBackground = YES;
    self.windowController.window.titleVisibility = NSWindowTitleHidden;
    self.myVC.view.window.windowController = self.windowController;
    self.myVC.view.window.styleMask = self.myVC.view.window.styleMask & ~NSWindowStyleMaskResizable;
    [self.windowController.window makeKeyAndOrderFront:self];
    [self.windowController.window center];
    [self.windowController showWindow:nil];
}



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
