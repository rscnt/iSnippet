//
//  SCSnippetsViewController.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/25/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippetsViewModel.h"
#import "SCApplicationController.h"

@interface SCSnippetsViewController : SCApplicationController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SCSnippetsViewModel *snippetsViewModel;

@end
