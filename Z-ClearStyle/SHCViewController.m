//
//  SHCViewController.m
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import "SHCViewController.h"
#import "SHCToDoItem.h"
#import "SHCTableViewCell.h"

@interface SHCViewController ()

@end

@implementation SHCViewController {
    NSMutableArray *_toDoItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[SHCTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _toDoItems = [[NSMutableArray alloc] init];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Feed the cat"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Buy eggs"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Pack bags for WWDC"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Rule the web"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Buy a new iPhone"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Find missing socks"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Write a new tutorial"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Master Objective-C"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Remember your wedding anniversary!"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Drink less beer"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Learn to draw"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Take the car to the garage"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Sell things on eBay"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Learn to juggle"]];
        [_toDoItems addObject:[SHCToDoItem toDoItemWithText:@"Give up"]];

    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _toDoItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = @"cell";
    SHCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    int index = [indexPath row];
    SHCToDoItem *item = _toDoItems[index];
//    cell.textLabel.text = item.text;
    cell.delegate = self;
    cell.todoItem = item;
    return cell;
}

- (UIColor *)colorForIndex:(NSInteger)index {
    NSUInteger itemCount = _toDoItems.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed:1.0 green:val blue:0.0 alpha:1.0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (void)toDoItemDeleted:(SHCToDoItem *)todoItem {
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    [self.tableView beginUpdates];
    [_toDoItems removeObject:todoItem];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView endUpdates];
}

- (void)toDoItemComplete:(SHCToDoItem *)todoItem {
    NSInteger index = [_toDoItems indexOfObject:todoItem];
    [todoItem setCompleted:YES];
}

@end
