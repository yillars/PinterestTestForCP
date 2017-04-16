//
//  PinterestLoginController.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinterestLoginView.h"

@interface PinterestLoginController : UIViewController

    @property(strong, nonatomic) IBOutlet PinterestLoginView *viewPinterestLogin;

    @property(nonatomic) BOOL loggedIn;
@end
