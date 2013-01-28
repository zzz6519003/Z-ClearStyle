//
//  SHCViewController.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCTableViewCellDelegate.h"

@interface SHCViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SHCTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
