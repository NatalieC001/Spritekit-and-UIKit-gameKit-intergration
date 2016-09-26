//
//  GameScene.m
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import "GameScene.h"
#import "Score.h"
#import <GameplayKit/GameplayKit.h>

//storing scores on game center
//#import "GameCenterManager.h"
@class GKLocalPlayer;

@implementation GameScene
@synthesize scoreLabel, score;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
       
        self.userInteractionEnabled = YES;
        [self createHUD];
        [self addMockUpButtons];
        
       
    }
    return self;
}

- (void)update:(NSTimeInterval)currentTime
{
//    if(gameOverd){
//        return;
//    }
    

    [self updateScore:currentTime];
}

//https://www.youtube.com/watch?v=KjqPCxIySys
-(IBAction)GameCentersignIn:(id)sender
{
    

}




+(BOOL) isGameCenterAvailable
{
    // Check for presence of GKLocalPlayer class.
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    // The device must be running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer
                                           options:NSNumericSearch] != NSOrderedAscending);
    
    return (localPlayerClassAvailable && osVersionSupported);
}



-(void)createHUD
{
    SKSpriteNode* hud = [[SKSpriteNode alloc] initWithColor:[UIColor blackColor] size:CGSizeMake(self.size.width, self.size.height*0.10)];
    hud.anchorPoint=CGPointMake(0, 0);
    hud.position = CGPointMake(0, self.size.height-hud.size.height);
    [self addChild:hud];
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithText:@"SKScene Loaded"];
    [self addChild:myLabel];
    myLabel.position = CGPointMake(self.size.width/2, self.size.height -hud.size.height/2);
    
    [self createScore];
}


-(void)addMockUpButtons {
    
//    SKSpriteNode* lifeLost = [[SKSpriteNode alloc] initWithColor:[UIColor redColor] size:CGSizeMake(self.size.width/3, self.size.height*0.1)];
//    lifeLost.name=@"lifeLost";
//    lifeLost.position=CGPointMake(self.size.width/2, lifeLost.size.height);
//    [self addChild:lifeLost];
    
    SKLabelNode *lifeLost = [SKLabelNode labelNodeWithText:@"GameOver"];
    lifeLost.position =  CGPointMake(self.size.width/2, lifeLost.frame.size.height);
    lifeLost.name=@"GameOver";
     [self addChild:lifeLost];
    
    SKLabelNode *ViewScores = [SKLabelNode labelNodeWithText:@"ViewLeaderBoard"];
    
    ViewScores.position =  CGPointMake(self.size.width/2, ViewScores.frame.size.height + lifeLost.position.y+ViewScores.frame.size.height  );
    ViewScores.name=@"ViewLeaderBoard";
    [self addChild:ViewScores];
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Get the element which is touched:
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    // Trigger actions
    if ([node.name isEqualToString:@"GameOver"]) {
     [self showGameOverAlert];
        
        
//    } else if ([node.name isEqualToString:@"lifeLost"]) {
//      //  [self lifeLost];
//    } else if ([node.name isEqualToString:@"addScore"]) {
//       // [self addScore];
        
        
      
     }
    
    //testing eact tap =  point
      isCorrect = YES;
    
    if ([node.name isEqualToString:@"ViewLeaderBoard"]) {
   [self ViewLeaderBoard];
    }
    
}

- (void) updateScore:(NSTimeInterval) currentTime
{
    
     if (isCorrect) {
        self.score +=1;
         isCorrect=NO;
     }
            scoreLabel.text = [NSString stringWithFormat:@"%lu",self.score];
    
   int playerScore=[NSString stringWithFormat:@"%lu",(unsigned long)self.score];

}

//https://www.youtube.com/watch?v=KjqPCxIySys

- (void) createScore
{
    self.score=0;
    
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica-Bold"];
    scoreLabel.text = @"0";
    scoreLabel.fontSize = 500;
    scoreLabel.position = CGPointMake( CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-scoreLabel.frame.size.height/2);
    scoreLabel.alpha = 0.2;
    [self addChild:scoreLabel];
}



-(void)ViewLeaderBoard
{
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ViewLeaderBoard"
                                                     message:@""
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil, nil, nil];
    alert.tag=3;
    [alert show];
}

// show GameOver Alerttag
-(void)showGameOverAlert {

    
    
}

// React on Alert
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1) {
        if (buttonIndex==1) {
            // Notify Delegate
            [self.delegateContainerViewController gameStop];
        }
   
        } else if (alertView.tag==2)
        {
        // Notify Delegate
        [self.delegateContainerViewController gameOver];
        }
    
      else if (alertView.tag==3)
      {
  NSLog(@"alertView.tag==3 Notify Delegate viewHighScore");
       [self.delegateContainerViewController viewHighScoreOnLeaderBoard];
}
}


@end
