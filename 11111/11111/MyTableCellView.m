//
//  MyTableCellView.m
//  11111
//
//  Created by 仝兴伟 on 2018/2/27.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MyTableCellView.h"
#import "BoxCommonCellButton.h"
@interface MyTableCellView()
@property (nonatomic, strong) NSImageView *cellImageView;
@property (nonatomic, strong) NSTextField *fileNameLable;
@property (nonatomic, strong) NSTextField *timeLabel;
@property (nonatomic, strong) BoxCommonCellButton *fileButton;
@end
@implementation MyTableCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}


#pragma mark --  重绘区域
- (void)updateTrackingAreas
{
    [super updateTrackingAreas];
    // Drawing code here.
    NSTrackingArea *area =[[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited|NSTrackingActiveInKeyWindow owner:self userInfo:nil];
    [self addTrackingArea:area];
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if ([super initWithFrame:frameRect]) {
        [self addLayout];
    }
    return self;
}

- (void)addLayout {
    self.cellImageView = [[NSImageView alloc]initWithFrame:CGRectMake(30, 10, 35, 35)];
    self.cellImageView.image = [NSImage imageNamed:@"word"];
    [self addSubview:self.cellImageView];
    
    self.fileNameLable = [[NSTextField alloc]initWithFrame:CGRectMake(100, 35, 300, 20)];
    self.fileNameLable.stringValue = @"dfaggdfgf.doc";
    self.fileNameLable.backgroundColor = [NSColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:0.01];
    self.fileNameLable.bordered = NO;
    self.fileNameLable.selectable = NO;
    [self.fileNameLable setLineBreakMode:(NSLineBreakByTruncatingMiddle)];
    self.fileNameLable.font = [NSFont systemFontOfSize:13.0];
    [self addSubview:self.fileNameLable];
    
    self.timeLabel = [[NSTextField alloc]initWithFrame:CGRectMake(100, 4, 300, 20)];
    self.timeLabel.stringValue = @"2017-11--28 13:34";
    self.timeLabel.backgroundColor = [NSColor clearColor];
    self.timeLabel.bordered = NO;
    self.timeLabel.selectable = NO;
    [self.timeLabel setLineBreakMode:(NSLineBreakByTruncatingMiddle)];
    self.timeLabel.font = [NSFont systemFontOfSize:12.0];
    [self.timeLabel setTextColor:[NSColor colorWithRed:142 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0]];
    [self addSubview:self.timeLabel];
    
    self.fileButton = [[BoxCommonCellButton alloc]initWithFrame:CGRectMake(440, (self.frame.size.height + 28) / 2, 28, 28)];
    self.fileButton.isSelected = YES;
    [self.fileButton setImage:[NSImage imageNamed:@"decrypt_icon_folder"]];
    self.fileButton.defaultImage = [NSImage imageNamed:@"decrypt_icon_folder"];
    self.fileButton.selectedImage = [NSImage imageNamed:@"decrypt_icon_folder"];
    self.fileButton.target = self;
//    self.fileButton.action = @selector(showButtonClick:);
    self.fileButton.hidden = YES;
    [self addSubview:self.fileButton];
    
    NSTextField *textfield = [[NSTextField alloc]initWithFrame:CGRectMake(16, 0, 703, 0.5)];
    textfield.backgroundColor = [NSColor lightGrayColor];
    [self addSubview:textfield];
}

#pragma mark ---  鼠标事件
- (void)mouseEntered:(NSEvent *)event {
    self.fileButton.hidden = NO;
}

- (void)mouseExited:(NSEvent *)event {
    self.fileButton.hidden = YES;
}

@end
