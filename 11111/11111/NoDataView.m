//
//  NoDataView.m
//  TableViewDemo
//
//  Created by 程立卿 on 27/02/2018.
//  Copyright © 2018 CherryKing. All rights reserved.
//

#import "NoDataView.h"

@interface NoDataView()
@property (nonatomic, strong) NSTextField *txtF;
@end

@implementation NoDataView

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self configSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        [self configSelf];
    }
    return self;
}

- (void)configSelf {
    [self setupSubviews];
    
    _txtF.stringValue = @"NO DATA!!!NO DATA!!!NO DATA!!!";
    _txtF.alignment = NSTextAlignmentCenter;
}

- (void)setupSubviews {
    [self addSubview:self.txtF];
}

- (void)configSubviews {
}

#pragma mark - get
- (NSTextField *)txtF {
    if (!_txtF) {
        _txtF = [[NSTextField alloc] initWithFrame:self.bounds];
        [_txtF setEnabled:NO];
        [_txtF setEditable:NO];
        _txtF.bordered = NO;
    }
    return _txtF;
}

@end
