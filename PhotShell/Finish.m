//
//  Finish.m
//  PhotShell
//
//  Created by MC MINI on 8/20/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import "Finish.h"

@interface Finish ()

@end

@implementation Finish

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
    
    self.finishBtn.clipsToBounds = YES;
    self.finishBtn.layer.cornerRadius=5.0f;
    
    [UIView animateWithDuration:0.5 delay:2.8 options:0 animations:^{
        self.top.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.top.hidden = YES;
        [self middleHandle];
        
    }];
    // Do any additional setup after loading the view.
}
-(void)middleHandle{
    [UIView animateWithDuration:0.5 delay:2.8 options:0 animations:^{
        self.middle.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.middle.hidden = YES;
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonLast:(id)sender{


    exit(1);
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

@end
