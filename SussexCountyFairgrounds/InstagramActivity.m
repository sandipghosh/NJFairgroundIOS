//
//  InstagramActivity.m
//  TunebashA
//
//  Created by Avik B on 24/12/13.
//  Copyright (c) 2013 Avik B. All rights reserved.
//

#import "InstagramActivity.h"

@implementation InstagramActivity

- (NSString *)activityType
{
    return @"com.Tunebash.InstagramActivity";
}

- (NSString *)activityTitle
{
    return @"Instagram";
}

- (UIImage *)activityImage
{
    // Note: These images need to have a transparent background and I recommend these sizes:
    // iPadShare@2x should be 126 px, iPadShare should be 53 px, iPhoneShare@2x should be 100
    // px, and iPhoneShare should be 50 px. I found these sizes to work for what I was making.
    
    return [UIImage imageNamed:@"instagramactivity.png"];
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
    
    for (id item in activityItems)
    {
        if ([item isKindOfClass:[NSString class]])
        {
            self.shareString = [(self.shareString ? self.shareString : @"") stringByAppendingFormat:@"%@%@",(self.shareString ? @" " : @""), item]; // concat, with space if already exists.
        }
        else NSLog(@"Unknown item type %@", item);
    }
}

- (UIViewController *)activityViewController
{
    NSLog(@"%s",__FUNCTION__);
    return nil;
}

- (void)performActivity
{
    NSData *imageData = UIImageJPEGRepresentation(self.shareImage, 1.0);
    
    NSString *writePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"instagram.igo"];
    if (![imageData writeToFile:writePath atomically:YES])
    {
        // failure
        NSLog(@"image save failed to path %@", writePath);
        [self activityDidFinish:NO];
        return;
    }
    else
    {
        // success.
    }
    
    // send it to instagram.
    NSURL *fileURL = [NSURL fileURLWithPath:writePath];
    self.documentController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.documentController.delegate = self;
    [self.documentController setUTI:@"com.instagram.exclusivegram"];
    
    NSLog(@"Intended caption :: %@", self.shareString);
    
    if (self.shareString)
    {
        [self.documentController setAnnotation:@{@"InstagramCaption" : self.shareString}];
    }
    
    [self activityDidFinish:YES];
    
    [self performSelector:@selector(showdocumentcontroller) withObject:nil afterDelay:1.0f];
    
}

- (void) showdocumentcontroller {
    
    [self.documentController presentOpenInMenuFromRect:appd.window.frame inView:appd.viewController.centerPanel.view animated:YES];
}

@end
