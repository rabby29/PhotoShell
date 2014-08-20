//
//  ViewController.h
//  PhotShell
//
//  Created by MC MINI on 8/20/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface ViewController : UIViewController{
    BOOL checkboxFlage;
    LoadingView *loading;
    ALAssetsLibrary *library;
}

@property (strong,nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) IBOutlet UIButton *goBtn;
@property (strong,nonatomic) IBOutlet UIButton *checkboxBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textHeight;

@end
