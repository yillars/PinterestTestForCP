//
//  PinterestLoginView.h
//  Cookpad Grid Photo Viewer
//
//  Created by SERDAR YILLAR on 16/04/2017.
//  Copyright © 2017 Cookpad Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PinterestButtonType : NSUInteger {
    PinterestButtonType_Authenticate, PinterestButtonType_LoggedIn, PinterestButtonType_Failed, PinterestButtonType_Loading
} PinterestButtonType;

@interface PinterestLoginView : UIView

    @property(weak, nonatomic) IBOutlet UIButton                *btnPinterestAuthenticate;
    @property(weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

    @property(nonatomic) PinterestButtonType currentButtonType;
    - ( void )changePinterestButtonType:( PinterestButtonType )buttonType;
@end
