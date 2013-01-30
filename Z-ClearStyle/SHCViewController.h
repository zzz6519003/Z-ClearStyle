//
//  SHCViewController.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCTableViewCellDelegate.h"
#import "SHCTableView.h"

@interface SHCViewController : UIViewController <SHCTableViewDataSource, SHCTableViewCellDelegate>

//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet SHCTableView *tableView;

@end
