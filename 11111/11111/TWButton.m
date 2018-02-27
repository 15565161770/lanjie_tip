//
//  TWButton.m
//  MainBackground
//
//  Created by 仝兴伟 on 2017/5/22.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "TWButton.h"

@implementation TWButton


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    //背景颜色
    if (self.backgroundColor!=nil) {
        [self.backgroundColor set];
        NSRectFill(self.bounds);
    }
//    [[NSColor colorWithRed:0/255.0 green:164/255.0 blue:255/255.0 alpha:1.0] set];
    // 绘制文字

    if (self.title != nil && self.titleColor == nil) {
        
        NSMutableParagraphStyle*paraStyle = [[NSMutableParagraphStyle alloc]init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSTextAlignmentCenter];
        
        NSDictionary*attrButton = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Verdana"size:14],NSFontAttributeName, [NSColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1.0],NSForegroundColorAttributeName, paraStyle,NSParagraphStyleAttributeName,nil];
        
        NSAttributedString* btnString = [[NSAttributedString alloc]initWithString:self.title attributes:attrButton];
        
        [btnString drawInRect:NSMakeRect(0,6,self.frame.size.width,self.frame.size.height)];
        
    } else if (self.title != nil && self.titleColor != nil){
        NSMutableParagraphStyle*paraStyle = [[NSMutableParagraphStyle alloc]init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSTextAlignmentCenter];
        
        NSDictionary*attrButton = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Verdana"size:14],NSFontAttributeName, [NSColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1.0],NSForegroundColorAttributeName, paraStyle,NSParagraphStyleAttributeName,nil];
        
        NSAttributedString* btnString = [[NSAttributedString alloc]initWithString:self.title attributes:attrButton];
        
        [btnString drawInRect:NSMakeRect(0,6,self.frame.size.width,self.frame.size.height)];

    }
}

@end
