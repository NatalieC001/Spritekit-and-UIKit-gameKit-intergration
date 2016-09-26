//
//  GameViewController.m
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end




@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    /*Even though the GameViewCOntroller has buttons
     these wont be visible as theuiviewcontroler empties to  the game SKScene
     
     but using and identifying the segues we can direct the flow*/
    
    SKView * skView = [[SKView alloc]initWithFrame:self.view.frame]; //(SKView *)self.view;
    [self.view addSubview:skView];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    GameScene *gameScene = [GameScene sceneWithSize:skView.bounds.size];
    gameScene.scaleMode = SKSceneScaleModeResizeFill; //SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:gameScene];
    
    //set the delegateContainerViewController property for the Scene
    gameScene.delegateContainerViewController=self;
}


- (void)eventStart
{
    NSLog(@"eventStart");
  //  [UIView animateWithDuration:.2 animations:^{
//        self.gameOverView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:.5 animations:^{
//            self.getReadyView.alpha = 1;
//        }];
//    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) gameStop {
    [self performSegueWithIdentifier: @"BackToStart" sender: self];
}

-(void) viewHighScoreOnLeaderBoard {
    [self performSegueWithIdentifier: @"ViewLeaderBoard" sender: self];
}





-(void) gameOver {
    
    //GameSCene SKScene sends message to this after showGameOverAlert is triggered
    [self performSegueWithIdentifier: @"AddHighScore" sender: self];
    NSLog(@"GameOver");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

