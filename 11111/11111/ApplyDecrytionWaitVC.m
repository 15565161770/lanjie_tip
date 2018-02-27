//
//  ApplyDecrytionWaitVC.m
//  cloudscreen
//
//  Created by 仝兴伟 on 2018/1/24.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "ApplyDecrytionWaitVC.h"
#import "TWButton.h"
#import "SYFlatButton.h"
@interface ApplyDecrytionWaitVC ()
@property (weak) IBOutlet TWButton *bg_button;
@property (weak) IBOutlet NSButton *close_window;

@property (nonatomic,strong) id eventObserver;

@end

@implementation ApplyDecrytionWaitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self addLayout];
   
#pragma mark -- 进行全局鼠标进入view的事件拦截
    // 如果在这个vc中添加NSEventMaskScrollWheel会导致这个vc的scrollview不工作？？？
    self.eventObserver =  [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskMouseEntered | NSEventMaskScrollWheel handler:^NSEvent * _Nullable(NSEvent * _Nonnull theEvent) {
        
        /*
         这个方法适合窗口叠加
         NSPoint p = [theEvent locationInWindow];
       NSPoint newPoint = [self.view convertPoint:p fromView:self.view];
        if (!CGRectContainsPoint(self.view.bounds, newPoint)) {
            [self.view removeFromSuperview];
            [NSEvent removeMonitor:self.eventObserver];
            return nil;
        } else {
            return theEvent;
        }
         */
        if (self.view.window == nil) return theEvent;
        NSView *hitView = [self.view hitTest:theEvent.locationInWindow];
        NSLog(@"=== hitView-%@",hitView);
        if (hitView && hitView.trackingAreas.count == 0) {
            return nil;
        }
        return theEvent;
    }];
    
}

- (void)addLayout {
    self.bg_button.backgroundColor = [NSColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:0.01];
    self.bg_button.target = self;
    self.bg_button.action = @selector(closeButtonClisck:);

    self.close_window.target = self;
    self.close_window.action = @selector(closeButtonClisck:);
}

- (void)closeButtonClisck:(NSButton *)button {
    if (self.presentingViewController) {
        [self.presentingViewController dismissViewController:self];
    } else {
        [self.view.window close];
    }
}

// viewWillDisappeare的时候一定要移除监听，
- (void)viewWillDisappear
{
    [super viewWillDisappear];
    [NSEvent removeMonitor:self.eventObserver];
}

// 在这个上层的controller里面重写mouseDown方法可防止点击穿透
- (void)mouseDown:(NSEvent *)event {
    NSLog(@"mouseDown");
}

- (void)scrollWheel:(NSEvent *)event{
    
}



@end
