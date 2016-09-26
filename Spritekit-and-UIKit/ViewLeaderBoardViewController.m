//
//  ViewHighscoreViewController.m
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import "ViewLeaderBoardViewController.h"
//1. Import ABGameKitHelper header where you intend to use it (Don't forget to link GameKit.framework)

@interface ViewLeaderBoardViewController ()

@end

@implementation ViewLeaderBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

 //gameAddViewContoller.delegate=self;
}




- (IBAction)actionShowHighScores:(id)sender {
    [self presentLeaderboards];
}

- (IBAction)actionShowAchievements:(id)sender {
    [self presentAchievements];
}

- (void) presentLeaderboards {
    GKGameCenterViewController* gameCenterController = [[GKGameCenterViewController alloc] init];
    gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
    gameCenterController.gameCenterDelegate = self;
    [self presentViewController:gameCenterController animated:YES completion:nil];
}

- (void) gameCenterViewControllerDidFinish:(GKGameCenterViewController*) gameCenterViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) achievementViewControllerDidFinish:(GKGameCenterViewController*) gameCenterViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void) presentAchievements {
    GKGameCenterViewController* gameCenterController = [[GKGameCenterViewController alloc] init];
    gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
    gameCenterController.gameCenterDelegate = self;
    [self presentViewController:gameCenterController animated:YES completion:nil];
}

- (void) reportHighScore:(NSInteger) highScore forLeaderboardId:(NSString*) leaderboardId {
    if ([GKLocalPlayer localPlayer].isAuthenticated) {
        GKScore* score = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardId];
        score.value = highScore;
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error: %@", error);
            }
        }];
    }
}


-(void) leaderboard
{
    //https://itunesconnect.apple.com  apps> /your app /gamecenter /LEADERBOARD_ID
   // [[ABGameKitHelper sharedHelper] showLeaderboard:@"My_Demo_Leaderboard"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
