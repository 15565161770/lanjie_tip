//
//  MyVC.m
//  11111
//
//  Created by 仝兴伟 on 2018/2/27.
//  Copyright © 2018年 仝兴伟. All rights reserved.
//

#import "MyVC.h"
#import "MyTableCellView.h"
#import "MyCustomAnimator.h"
#import "ApplyDecrytionWaitVC.h"
@interface MyVC ()<NSTableViewDelegate, NSTableViewDataSource>
@property (nonatomic, strong) NSTableView *tableview;
@property (nonatomic, strong) NSScrollView *tableviewScrollView;
@end
// scrollView.contentView.documentView为无数据显示的View就好了么

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [self addTableviews];
}

- (void)addTableviews {
    self.tableviewScrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(400, 0, 546, 480)];
    self.tableview = [[NSTableView alloc]initWithFrame:CGRectMake(0, 0, 546, 480)];
    [self.tableview setAutoresizesSubviews:YES];
    self.tableview.headerView = nil;
    self.tableview.rowHeight = 58;
    self.tableview.rowSizeStyle = NSTableViewRowSizeStyleDefault;
    
    NSTableColumn *cloumu = [[NSTableColumn alloc]initWithIdentifier:@"file"];
    cloumu.title = @"";
    cloumu.width = 546;
    [self.tableview addTableColumn:cloumu];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    self.tableview.gridStyleMask = NSTableViewGridNone;
    [self.tableviewScrollView setDocumentView:self.tableview];
    [self.view addSubview:self.tableviewScrollView];

}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 58;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return nil;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    MyTableCellView *cellView = [tableView makeViewWithIdentifier:@"Tableviewcells" owner:self];
    if (cellView == nil) {
        cellView = [[MyTableCellView alloc]init];
        [cellView setIdentifier:@"Tableviewcells"];
    }
    //    cellView.model = self.listFileArray[row];
    return cellView;
}


- (IBAction)buttonClick:(NSButton *)sender {
    id animator = [[MyCustomAnimator alloc] init];
    ApplyDecrytionWaitVC *list = [[ApplyDecrytionWaitVC alloc]initWithNibName:@"ApplyDecrytionWaitVC" bundle:nil];
    [self presentViewController:list animator:animator];
}



@end
