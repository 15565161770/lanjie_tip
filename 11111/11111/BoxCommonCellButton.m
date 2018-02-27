//
//  BoxCommonCellButton.m
//  cloudscreen
//
//  Created by 仝兴伟 on 2017/11/2.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "BoxCommonCellButton.h"

@implementation BoxCommonCellButton{
    BOOL mouseIn;
}

-(void)updateTrackingAreas{
    
    NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow;
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                                options:options
                                                                  owner:self
                                                               userInfo:nil];
    [self addTrackingArea:trackingArea];
}

-(void)mouseEntered:(NSEvent *)theEvent{
    mouseIn = YES;
    [self updateImage];
}

-(void)mouseExited:(NSEvent *)theEvent{
    mouseIn = NO;
    [self updateImage];
    
}

- (void)updateImage{
    if (_isSelected || mouseIn) {
        [self setImage:self.selectedImage];
    }else {
        [self setImage:self.defaultImage];
    }
}
/*
 //用xib请用下面方法
 -(void)awakeFromNib{
 [self.cell setHighlightsBy:NSNoCellMask];
 [self.cell setBordered:NO];
 mouseIn = NO;
 _isSelected = NO;
 
 }
 */

//用代码初始化NSButton
- (id)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        //取消按下变灰效果
        [self.cell setHighlightsBy:NSNoCellMask];
        //设置边框不显示
        self.bordered = NO;
        mouseIn = NO;
        _isSelected = NO;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

@end
