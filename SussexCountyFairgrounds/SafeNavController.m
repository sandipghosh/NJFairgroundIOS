//
//  SafeNavController.m
//  TunebashA
//
//  Created by Avik B on 22/03/14.
//  Copyright (c) 2014 Avik B. All rights reserved.
//

#import "SafeNavController.h"

@interface SafeNavController ()

@end

@implementation SafeNavController

#define THRESHOLD_TIMEOUT_BEFORE_NEXT_PUSH_OR_POP_SHOULD_BE_ALLOWED 1.0F

@synthesize lastpoporpushtransitionmadeat;

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
    
    lastpoporpushtransitionmadeat = [[NSDate date] timeIntervalSince1970];
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

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	if([[NSDate date] timeIntervalSince1970] - lastpoporpushtransitionmadeat >= THRESHOLD_TIMEOUT_BEFORE_NEXT_PUSH_OR_POP_SHOULD_BE_ALLOWED)
    {
        lastpoporpushtransitionmadeat = [[NSDate date] timeIntervalSince1970];
		[super pushViewController:viewController animated:animated];
	}
}

-(NSArray*)popToRootViewControllerAnimated:(BOOL)animated {
	if([[NSDate date] timeIntervalSince1970] - lastpoporpushtransitionmadeat >= THRESHOLD_TIMEOUT_BEFORE_NEXT_PUSH_OR_POP_SHOULD_BE_ALLOWED)
    {
        lastpoporpushtransitionmadeat = [[NSDate date] timeIntervalSince1970];
		return [super popToRootViewControllerAnimated:animated];
	}
	else
    {
		return @[];
	}
}

-(NSArray*)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
	if([[NSDate date] timeIntervalSince1970] - lastpoporpushtransitionmadeat >= THRESHOLD_TIMEOUT_BEFORE_NEXT_PUSH_OR_POP_SHOULD_BE_ALLOWED)
    {
        lastpoporpushtransitionmadeat = [[NSDate date] timeIntervalSince1970];
		return [super popToViewController:viewController animated:animated];
	}
	else
    {
		return @[];
	}
}

@end
