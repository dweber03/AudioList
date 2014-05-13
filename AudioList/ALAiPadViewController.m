//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Derek Weber on 5/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "ALAiPadViewController.h"
#import "ALAiPadDetailVC.h"
#import "ALAiPadListTableVC.h"
#import "ALASoundCloudRequest.h"


@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    ALAiPadListTableVC * listVC;
    ALAiPadDetailVC * detailVC;
    UINavigationController * nc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        detailVC = [[ALAiPadDetailVC alloc]initWithNibName:nil bundle:nil];
        
        nc = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        
        // listVC needs a tab bar button at the bottom with 2 options : tracks & playlists buttons: if you click on the playlist, it should push in & display the song list ie..PushView Controller
        
        // DetailVC has play & stop button 
        
        listVC = [[ALAiPadListTableVC alloc]initWithStyle:UITableViewStylePlain];
        
       
        listVC.detailVC = detailVC;
        
        self.viewControllers = @[listVC, nc];
        
        self.presentsWithGesture = YES;
        self.delegate = self;
        
        [ALASoundCloudRequest updateData];
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
