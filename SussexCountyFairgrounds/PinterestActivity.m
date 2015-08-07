//
//  PinterestActivity.m
//  TunebashA
//
//  Created by Avik B on 24/12/13.
//  Copyright (c) 2013 Avik B. All rights reserved.
//

#import "PinterestActivity.h"
#import <Pinterest/Pinterest.h>

@implementation PinterestActivity

Pinterest *pinterest;
NSString *sharedesc;
NSArray *arr;

- (NSString *)activityType
{
    return @"com.Tunebash.PinterestActivity";
}

- (NSString *)activityTitle
{
    return @"Pinterest";
}

- (UIImage *)activityImage
{
    // Note: These images need to have a transparent background and I recommend these sizes:
    // iPadShare@2x should be 126 px, iPadShare should be 53 px, iPhoneShare@2x should be 100
    // px, and iPhoneShare should be 50 px. I found these sizes to work for what I was making.
    
    return [UIImage imageNamed:@"pinterestactivity.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s", __FUNCTION__);
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"items :: %@", activityItems);
    
    pinterest = [[Pinterest alloc]initWithClientId:@"1445350"];
    
    arr = [NSArray arrayWithArray:activityItems];
}

- (UIViewController *)activityViewController
{
    NSLog(@"%s",__FUNCTION__);
    return nil;
}

- (void)performActivity
{
    [self activityDidFinish:YES];
    
    [self performSelector:@selector(pinit) withObject:nil afterDelay:1.0f];
}

- (void) pinit
{    
    [pinterest createPinWithImageURL:[NSURL URLWithString:_strimgurl]
                           sourceURL:[arr objectAtIndex:1]
                         description:[arr objectAtIndex:0]];
}

@end
