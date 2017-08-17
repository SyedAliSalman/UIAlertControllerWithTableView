//
//  ViewController.m
//  UIAlertControllerWithTableView
//
//  Created by Ali AS. Salman on 17/08/2017.
//  Copyright © 2017 Ali AS. Salman. All rights reserved.
//

#import "ViewController.h"

#define kNumberOfRecords 10

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //creating UIAlertController which includes a table view according to your requirement
    UIAlertController *controller = [self getAlertControllerForDisplayingListInViewCOntroller:self havingNumberOfObjects:kNumberOfRecords withTag:1 MessgeString:@"My First Alert Table View" TitleString:@"Below are records to show in an alert"];
    [self presentViewController:controller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utility Methods
-(UIAlertController *) getAlertControllerForDisplayingListInViewCOntroller :(id) viewControllerRefrence havingNumberOfObjects:(int) numberOfObjects withTag:(int)kTableViewTag MessgeString:(NSString *)message TitleString:(NSString *)title{
    
    UIViewController *controller = [[UIViewController alloc]init];
    UITableView *alertTableView;
    //creating tableview height with respect ot objects in table view
    if (numberOfObjects < 4) {
        CGRect rect = CGRectMake(0, 0, 272, 100);
        [controller setPreferredContentSize:rect.size];
        alertTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 272, 100)];
    }
    else if (numberOfObjects < 6){
        CGRect rect = CGRectMake(0, 0, 272, 150);
        [controller setPreferredContentSize:rect.size];
        alertTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 272, 150)];
    }
    else if (numberOfObjects < 8){
        CGRect rect = CGRectMake(0, 0, 272, 200);
        [controller setPreferredContentSize:rect.size];
        alertTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 272, 200)];
    }
    else{
        CGFloat maxHeight = 250;
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        if(orientation != 0 || orientation != UIInterfaceOrientationPortrait) //Default orientation and portrait
        {
            maxHeight = 200;
        }
        CGRect rect = CGRectMake(0, 0, 272, maxHeight);
        [controller setPreferredContentSize:rect.size];
        alertTableView  = [[UITableView alloc]initWithFrame:rect];
    }
    
    alertTableView.delegate = viewControllerRefrence;
    alertTableView.dataSource = viewControllerRefrence;
    alertTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    // setting table view separator style
    [alertTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [alertTableView setTag:kTableViewTag];
    [controller.view addSubview:alertTableView];
    [controller.view bringSubviewToFront:alertTableView];
    [controller.view setUserInteractionEnabled:YES];
    [alertTableView setUserInteractionEnabled:YES];
    [alertTableView setAllowsSelection:YES];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:controller forKey:@"contentViewController"];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    return alertController;
}

#pragma mark - Table View Delegates and Data source
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return kNumberOfRecords;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"This is cell at %ld index",indexPath.row +1]];
    
    return cell;
}
@end
