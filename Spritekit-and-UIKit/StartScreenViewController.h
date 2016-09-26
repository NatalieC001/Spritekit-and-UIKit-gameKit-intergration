//
//  ViewController.h
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartScreenViewController : UIViewController
extern NSString *const PLAYER_ID;
extern NSString *const RANDOM_NUMBER;

extern NSString *const AUTHENTICATED_NOTIFICATION;
extern NSString *const UNAUTHENTICATED_NOTIFICATION;

//@property (weak,nonatomic) IBOutlet UILabel * currentScore;
//@property (weak,nonatomic) IBOutlet UILabel * bestScoreLabel;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *aliasLabel;

//StartScreen is the root view controller
//GameScene is 


@end

