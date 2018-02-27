//
//  BoxCommonCellButton.h
//  cloudscreen
//
//  Created by 仝兴伟 on 2017/11/2.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BoxCommonCellButton : NSButton
@property (assign) BOOL isSelected;
@property (strong) NSImage *defaultImage;
@property (strong) NSImage *selectedImage;
@end
