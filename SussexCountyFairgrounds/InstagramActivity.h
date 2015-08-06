//
//  InstagramActivity.h
//  TunebashA
//
//  Created by Avik B on 24/12/13.
//  Copyright (c) 2013 Avik B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramActivity : UIActivity <UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIImage *shareImage;
@property (nonatomic, strong) NSString *shareString;


@property (nonatomic, strong) UIDocumentInteractionController *documentController;

@end
