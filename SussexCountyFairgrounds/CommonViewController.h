//
//  CommonViewController.h
//  eSims
//
//  Created by Administrator on 1/15/14.
//  Copyright (c) 2014 TCG S/W Inc.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppDelegate;
@interface CommonViewController : UIViewController
@property (nonatomic,retain) NSUserDefaults *standardAppDefaults;
@property (nonatomic, retain) UIView *topview;
@property BOOL isLoaderActive;
-(UIColor *)lighterColorForColor:(UIColor *)c;
-(UIColor *)darkerColorForColor:(UIColor *)c;
-(void)setHeaderBar:(NSString *)title;
-(UIBarButtonItem *)customiseButtonBar:(NSString *)title;
-(void)setCustomFont:(id)objectname fontSize:(CGFloat)fontsize fontStyle:(NSString *)fontStyle;
-(void)goback;
-(void)gotoroot;
-(void)show;
- (void)fadeInLayer:(CALayer *)l;
-(void)hide;
-(UIButton*)setRightBarButton:(NSString*)str;
@property (assign,nonatomic) AppDelegate *appd;
@end
