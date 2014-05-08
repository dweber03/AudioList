//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Derek Weber on 5/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALAiPadViewController.h"

@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    UITableViewController * listVC;
    UIViewController * detailVC;
    UINavigationController * nc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        detailVC = [[UIViewController alloc]initWithNibName:nil bundle:nil];
        
        nc = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        listVC = [[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
        
       
        
        self.viewControllers = @[listVC, nc];
        
//        self.presentsWithGesture = YES;
        self.delegate = self;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Button";
    
    detailVC.navigationItem.leftBarButtonItem = barButtonItem;
    detailVC.navigationController.navigationBarHidden = NO;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    
    nc.navigationBarHidden = YES;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
