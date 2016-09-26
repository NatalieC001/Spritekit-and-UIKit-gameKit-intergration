//
//  GameViewController.h
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import <UIKit/UIKit.h>

//leaderboards
#import <GameKit/GameKit.h>

//import the skgamescene to acces its functions and load sprites in
#import "GameScene.h"
@class GameScene;

@interface GameViewController : UIViewController  <GameSceneDelegate> //UIActionSheetDelegate, GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate


//https://developer.apple.com/search/?q=gamecenter


//GameViewController is a container UIViewCOntroller that loads the skview into it.

//link the SKScene & GameSceneDelegate <NSObject> to acces its two functions
/*//the two functions
 -(void) gameStop;
 -(void) gameOver;*/
- (void)eventStart;


@end
