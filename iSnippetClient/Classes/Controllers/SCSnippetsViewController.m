//
//  SCSnippetsViewController.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/25/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippetsViewController.h"

@interface SCSnippetsViewController ()

@end

@implementation SCSnippetsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _snippetsViewModel = [[SCSnippetsViewModel alloc] init];
    NSLog(@"Snippets: %@", _snippetsViewModel.textTitle);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma  mark tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _snippetsViewModel.snippets.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_snippetsViewModel.snippets.results) {
        for (id snippet in _snippetsViewModel.snippets.results) {
            NSLog(@"%@", snippet[@"title"]);
        }
    }
    return [[UITableViewCell alloc] init];
}
@end
