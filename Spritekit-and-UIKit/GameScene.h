//
//  GameScene.h
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
//@class GKLocalPlayer;

@protocol GameSceneDelegate <NSObject,UIAlertViewDelegate> //Make my delegate object here
@required
//the two functions
//https://code.tutsplus.com/tutorials/ios-sdk-game-center-achievements-and-leaderboards-part-2--mobile-5801
-(void) gameStop;
-(void) gameOver;
-(void) viewHighScoreOnLeaderBoard;

- (void) eventStart;
- (void) eventPlay;
- (void) eventWasted;

- (IBAction) showLeaderboard;
- (IBAction) showAchievements;
- (IBAction) submitScore;

@end



@interface GameScene : SKScene
{
      SKLabelNode * scoreLabel;
    BOOL isCorrect;
    BOOL isGameOver;
    
}
@property (readwrite,assign)BOOL isGameOver;
@property (readwrite,assign)BOOL isCorrect;
@property (nonatomic,strong)  SKLabelNode * scoreLabel;


//gameCenter
//@property(strong, nonatomic) GKLocalPlayer *localPlayer;
+(BOOL) isGameCenterAvailable;

//@property int Score;
@property (nonatomic) NSUInteger score;

@property int Level;
@property (nonatomic,strong)  id<GameSceneDelegate,UIAlertViewDelegate> delegateContainerViewController;
- (void) startGame;

@end
