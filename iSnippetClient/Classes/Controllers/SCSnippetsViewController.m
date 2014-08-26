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
    _snippetsViewModel = [[SCSnippetsViewModel alloc]
                          initWithCallback:^(SCSnippetsViewModel *snippetsViewModel) {
                              if (snippetsViewModel.snippets) {
                                  _snippetsViewModel = snippetsViewModel;
                              }
                          }];
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
    return (NSInteger) _snippetsViewModel.snippets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"A table view with index path %@", indexPath);
    /**
     *  Using a table view cell from an identifier located 
     *  at the snippets tab controller in main.storyboard
     */
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"columnRepresentSnippet"];
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"columnRepresentSnippet"];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (_snippetsViewModel.snippets.results) {
        for (id snippetObject in _snippetsViewModel.snippets.results) {
            SCSnippet *snippet = [[SCSnippet alloc] initWithDictionary:snippetObject error:nil];
            tableViewCell.textLabel.text = snippet.title;
            tableViewCell.detailTextLabel.text = snippet.code;
        }
    }
    return tableViewCell;
}
@end
