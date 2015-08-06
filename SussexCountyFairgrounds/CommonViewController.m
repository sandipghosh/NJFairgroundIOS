//
//  CommonViewController.m
//  MobileBanking
//
//  Created by Administrator on 12/4/13.
//  Copyright (c) 2013 TCG S/W Inc.com. All rights reserved.
//

#import "CommonViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "MFSideMenu.h"
@interface CommonViewController ()

@end

@implementation CommonViewController
@synthesize topview,appd,standardAppDefaults,isLoaderActive;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillDisappear:(BOOL)animated{
    //    CATransition *animation = [CATransition animation];
    //    [animation setDuration:0.6];
    //    [animation setType:kCATransitionPush];
    //    if (![appd.viewsidebar isHidden]) {
    //        [appd.viewsidebar setHidden:YES];
    //        [animation setSubtype:kCATransitionFromTop];
    //    }
    //
    //    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    //
    //    [[appd.viewsidebar layer] addAnimation:animation forKey:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    appd = (id)[[UIApplication sharedApplication] delegate];
    standardAppDefaults = [NSUserDefaults standardUserDefaults];
    self.view.backgroundColor = UIColorFromRGB(0xffffff) ;
     self.isLoaderActive=FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.3, 1.0)
                               green:MIN(g + 0.1, 1.0)
                                blue:MIN(b + 0.1, 1.0)
                               alpha:a];
    return nil;
}

-(UIColor *)darkerColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.1, 0.0)
                               green:MAX(g - 0.07, 0.0)
                                blue:MAX(b - 0.07, 0.0)
                               alpha:a];
    return nil;
}
-(void)setHeaderBar:(NSString *)title{
    if ([title isEqualToString:NSLocalizedString(@"SOCIAL MEDIA", nil)]) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                 forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
         self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = YES;
                                                               
                                                               
    }
    else{
        self.navigationController.navigationBar.barTintColor =THEMECOLOR;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = NO;
    }
    
  UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(118, 5, 130, 30)];
    [self setCustomFont:lbl fontSize:16.0 fontStyle:@""];
    lbl.textColor = [UIColor whiteColor];
    lbl.backgroundColor= [UIColor clearColor];
    
    lbl.text=title;
    lbl.textAlignment = NSTextAlignmentCenter;
    [lbl sizeToFit];
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 1, 70, 55)];
    imgv.image = [UIImage imageNamed:@"logoHm.png"];
    
    
    self.navigationItem.titleView = lbl;
   
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 30)];
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"Logoback.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"Logoback.png"] forState:UIControlStateHighlighted];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *backButtonLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    if([title isEqualToString:@"SELECT METAL"] || [title isEqualToString:@"STORE LOCATOR"])
        self.navigationItem.leftBarButtonItem = buttonItem;
    else
        self.navigationItem.leftBarButtonItem = backButtonLeft;
 
    
    UIBarButtonItem *backButtonRight = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gridiconsmall.png"] style:UIBarButtonItemStylePlain target:self action:@selector(opensidebar)];
    
        self.navigationItem.rightBarButtonItem =  backButtonRight ;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}
-(void)gomenu{
    
    
}
-(void)setCustomFont:(id)objectname fontSize:(CGFloat)fontsize fontStyle:(NSString *)fontstyle{
    
    NSString *fontname = @"Avenir-Light";              //Regular
    
    if([fontstyle isEqualToString:@"Light"])
        fontname =@"AvenirNext-UltraLight";
    if([fontstyle isEqualToString:@"Medium"])
        fontname =@"AvenirNext-Medium";
    if([fontstyle isEqualToString:@"DemiBold"])
        fontname =@"AvenirNext-DemiBold";
    if([fontstyle isEqualToString:@"Bold"])
        fontname =@"AvenirNext-Bold";
    
    if([objectname isKindOfClass:[UILabel class]]){
        
        
        UILabel *lbl = (UILabel *)objectname;
        [lbl setFont:[UIFont fontWithName:fontname size:fontsize]];
    }
    if([objectname isKindOfClass:[UIButton class]]){
        
        UIButton *lbl = (UIButton *)objectname;
        [lbl.titleLabel setFont:[UIFont fontWithName:fontname size:fontsize]];
    }
    if([objectname isKindOfClass:[UITextField class]]){
        UITextField *lbl = (UITextField *)objectname;
        [lbl setFont:[UIFont fontWithName:fontname size:fontsize]];
    }
    if([objectname isKindOfClass:[UITextView class]]){
        UITextView *lbl = (UITextView *)objectname;
        [lbl setFont:[UIFont fontWithName:fontname size:fontsize]];
    }
}
-(UIBarButtonItem *)customiseButtonBar:(NSString *)title{
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:nil];
    [btn2 setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:14.0],
                                   NSForegroundColorAttributeName: [UIColor whiteColor]
                                   } forState:UIControlStateNormal];
    
    //    UIImage *faceImage = [UIImage imageNamed:@"done.png"];
    //    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    //    face.bounds = CGRectMake( 0, 0, faceImage.size.width, faceImage.size.height );
    //    [face setImage:faceImage forState:UIControlStateNormal];
    //    UIBarButtonItem *faceBtn = [[UIBarButtonItem alloc] initWithCustomView:face];
    
    return btn2;
}
-(void)goback{
    
//        CATransition* transition = [CATransition animation];
//        transition.duration = 0.3;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        transition.type = kCATransitionFade;
//    
//        [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
     [[self navigationController] popViewControllerAnimated:YES];
   
    
}
-(void)goback2{
    
    
    [[self navigationController] popViewControllerAnimated:YES];
}
-(void)gotoroot{
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
}
- (void)show {
    self.isLoaderActive=TRUE;
    //[SVProgressHUD showWithStatus:@"Loading"];
    [appd.window addSubview:appd.vLoader];
   // [self spinLayer:appd.imgvLogo.layer duration:1 direction:1];
    [self rotateImage:appd.imgvLogo withDuration:2.0 isHorizzonal:YES];
    
    
}
- (void)hide {
    //[appd.window.layer removeAllAnimations];
    self.isLoaderActive=FALSE;
    [appd.imgvLogo.layer removeAllAnimations];
    [appd.vLoader removeFromSuperview];
    
}
- (void)showWithStatus:(NSString *)msg {
	[SVProgressHUD showWithStatus:msg];
}

static float progress = 0.0f;

- (void)showWithProgress:(id)sender {
    progress = 0.0f;
    [SVProgressHUD showProgress:0 status:@"Loading"];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3];
}

- (void)increaseProgress:(NSString *)msg {
    progress+=0.1f;
    [SVProgressHUD showProgress:progress status:msg];
    
    if(progress < 1.0f)
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3];
    else
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.4f];
}
-(UIButton *)setRightBarButton:(NSString*)str{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backBtn setTitle:str forState:UIControlStateNormal];
    
    [backBtn.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:14]];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[self darkerColorForColor:THEMECOLOR]];
    
    backBtn.frame = CGRectMake(0, 0, 64, 44);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, -16, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.rightBarButtonItem = backButton;
    
    return backBtn;
}

-(void)setFilterOptions:(id)Object forKey:(NSString*)keyName{
   /* [self.standardAppDefaults setObject:self.metalID forKey:@"METALID"];
    [self.standardAppDefaults setObject:self.selectedRows forKey:@"PRODUCTTYPES"];
    [self.standardAppDefaults setObject:@"" forKey:@"PRICERANGE"];
    [self.standardAppDefaults setObject:@"" forKey:@"GEMS"];
    [self.standardAppDefaults setObject:@"" forKey:@"OCASSIONS"];*/
}
- (void)opensidebar {
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

-(void)rotateImage:(UIImageView*)image withDuration:(float)duration isHorizzonal:(BOOL)horizontal{
    [UIView animateWithDuration:duration/2.0 animations:^{image.transform = horizontal?
        CGAffineTransformMake(image.transform.a * -1, 0, 0, 1, image.transform.tx, 0)
        :CGAffineTransformMake(1, 0, 0, image.transform.d * -1, 0, image.transform.ty);}
                     completion:^(BOOL finished)
     {
         if (self.isLoaderActive)
             [self rotateImage:image withDuration:2.0 isHorizzonal:YES];
     }];
    
    
}
- (void)fadeInLayer:(CALayer *)l
{
    CABasicAnimation *fadeInAnimate   = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAnimate.duration            = 0.5;
    fadeInAnimate.repeatCount         = 1;
    fadeInAnimate.autoreverses        = NO;
    fadeInAnimate.fromValue           = [NSNumber numberWithFloat:0.0];
    fadeInAnimate.toValue             = [NSNumber numberWithFloat:1.0];
    fadeInAnimate.removedOnCompletion = YES;
    [l addAnimation:fadeInAnimate forKey:@"animateOpacity"];
    return;
}

@end
