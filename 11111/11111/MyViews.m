//
//  MyViews.m
//  11111
//
//  Created by 仝兴伟 on 2018/2/27.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MyViews.h"

@implementation MyViews

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
}

- (void)updateTrackingAreas {
    if(self.trackingArea != nil) {
        [self removeTrackingArea:self.trackingArea];
    }
    int opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways|NSTrackingMouseMoved);
    self.trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds]
                                                     options:opts
                                                       owner:self
                                                    userInfo:nil];
    [self addTrackingArea:self.trackingArea];
}

#pragma mark -- 
- (void)mouseEntered:(NSEvent *)event {
    NSLog(@"mouseEntered");
//    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskMouseEntered handler:^NSEvent * _Nullable(NSEvent * _Nonnull theEvent) {
//        NSView *hitView = [self hitTest:theEvent.locationInWindow];
//        NSLog(@"hitView-%@",hitView);
//        if (hitView && hitView.trackingAreas.count == 0) {
//            return nil;
//        }
//        return theEvent;
//    }];
}

-(void)mouseUp:(NSEvent *)event {
    NSLog(@"mouseUp");
}

-(void)mouseDown:(NSEvent *)event {
    NSLog(@"mouseDown");
}

- (void)mouseMoved:(NSEvent *)event {
    NSLog(@"mouseMoved");
}

- (void)scrollWheel:(NSEvent *)event{
    NSLog(@"scrollWheel");
}

@end
