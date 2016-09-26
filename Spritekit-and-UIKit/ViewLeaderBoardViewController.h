//
//  ViewHighscoreViewController.h
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>

@interface ViewLeaderBoardViewController : UIViewController <GKGameCenterControllerDelegate>




- (IBAction)actionShowHighScores:(id)sender;
- (IBAction)actionShowAchievements:(id)sender;


//Segue identifier "ViewLeaderBoard"


// A flag indicating whether the Game Center features can be used after a user has been authenticated.
//@property (nonatomic) BOOL gameCenterEnabled;
//// The player's score. Its type is int64_t so as to match the expected type by the respective method of GameKit.
//@property (nonatomic) int64_t score;
//
//-(void)authenticateLocalPlayer;


//intergrate game center
//https://www.appcoda.com/ios-game-kit-framework/

/*1.
 
 
 
 //https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html
 //If you enter information about your app and assign a team to your app, Xcode creates the necessary signing identities and provisioning profiles for you.
 Specifically, Xcode creates a team provisioning profile that allows your app to run on all your devices and use app services.
 Automate Tasks Using Xcode    Xcode 5 has accepted great improvements, and some of them include the ability to perform 
 certain tasks automatically, such as to create a new App ID for the application you develop, without you have to visit your Apple 
 developer’s account and do it manually. The only basic precondition is to have it provided with your Apple ID info, 
 and everything will be done for you. Adding your Apple ID to Xcode is easy, and here is how it’s done:
 
 adding gamecenter: project info>Capabilities tab >xpand the Game Center row>switch on.
 https://www.appcoda.com/ios-game-kit-framework/
 Create an App Record on iTunes Connect
 
 
  //setting up acheivements leaderboard
 https://www.appcoda.com/ios-game-kit-framework/
 
 
 
 //full source including GameCenter setup here:

 
 Create Test Users
 During an application building,  always create Test Users with FAKE Apple IDs to try out features such as Game Center
 
 
 Setting up leaerboard
 Leaderboard Reference Name (used internally by the iTunes Connect platform)
 In here, set the "MyDemoLeaderboard " value.
 
 Leaderboard ID ~ "My_Demo_Leaderboard"
 
 Score Format Type: pick Integer scores
 
 Score Submission Type: Best score, High to low
 
 Score Range:  empty
 
 specify a name for the localized leaderboard, which in our example is the MonsterMath Leaderboard
 
 Score Format Suffix score format suffix, such as point and points, coin and coins
 Image (optional)
 
 
 //Acheivments
 A new form appears on-screen, which you have to fill in for every achievement you want to add to a game.
 Don’t worry though, is not that hard as you’ll see right next. Once you have made your mind what the achievements are going to be, the rest is easy.
 
 
 Images must be in the JPG, TIF, or PNG file format, at least 512x512 or 1024x1024 pixels in size, and in the RGB color space.
 */


@end
