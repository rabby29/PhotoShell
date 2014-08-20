//
//  ViewController.m
//  PhotShell
//
//  Created by MC MINI on 8/20/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Finish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.goBtn setBackgroundImage:[self imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
    [self.goBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:(112.0f/255.0f) green:(48.0f/255.0f) blue:(160.0f/255.0f) alpha:1.0f]] forState:UIControlStateHighlighted];
    
    [self initLoading];
    checkboxFlage=NO;
   
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *str=[ud objectForKey:@"PhotoShellWriteComplete"];
    if([str isEqualToString:@"yes"]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"You have the images in your Photos/PhotoShell Albhum" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [UIView animateWithDuration:1.0 delay:2.0 options:0 animations:^{
        NSLog(@"alpha");
        self.imageView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.imageView.hidden = YES;
        
    }];

    self.goBtn.clipsToBounds = YES;
    self.goBtn.layer.cornerRadius=5.0f;
     library=[[ALAssetsLibrary alloc]init];
   	// Do any additional setup after loading the view, typically from a nib.
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    float height =[UIScreen mainScreen].applicationFrame.size.height;
    NSLog(@"%f",height);
    if(height==460){
        [self.imageView setImage:[UIImage imageNamed:@"Page2.png"]];
        NSLog(@"choto");
        self.textHeight.constant=30;
        self.buttonHeight.constant=30;

    }else{
        [self.imageView setImage:[UIImage imageNamed:@"Page2_4.png"]];
        self.buttonHeight.constant=40;
        self.textHeight.constant=85;
        
    }
    
    
   
   
}

-(void)initLoading{
    CGFloat x= self.view.frame.size.width/2-65;
    CGFloat y =(self.view.frame.size.height)/2-25;
    
    loading=[[LoadingView alloc]initWithFrame:CGRectMake(x, y, 130, 50)];
    loading.hidden=YES;
    [self.view addSubview:loading];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)buttonPressed:(id)sender{
    if(!checkboxFlage){
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please accept the terms" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    loading.hidden=NO;
    [loading StartAnimating];
  
    //[self FinishPageShow];
    [self saveImage:0];
    NSLog(@"end");
   
}

-(void)saveImage:(int)i{
    i++;
    UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"Slide%d.JPG",i]];
    [library saveImage:image toAlbum:@"PhotoShell" withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }else {
            
            if(i==30){
                [loading StopAnimating];
                loading.hidden=YES;
                NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
                [ud setObject:@"yes" forKey:@"PhotoShellWriteComplete"];
                NSLog(@"%@",[ud objectForKey:@"PhotoShellWriteComplete"]);
                [self FinishPageShow];

            }else{
                NSLog(@" done %d",i);
                [self saveImage:i];
            }
           

        }
    }];

}
-(void)FinishPageShow{
    Finish *fvc=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Finish"];
    [self.navigationController pushViewController:fvc animated:YES];
}
-(IBAction)checkboxButton:(id)sender{
    checkboxFlage=!checkboxFlage;
    if(checkboxFlage){
        [self.checkboxBtn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
        NSLog(@"true");

    }else{
        [self.checkboxBtn setImage:nil forState:UIControlStateNormal];
        NSLog(@"false");

    }
}
@end
