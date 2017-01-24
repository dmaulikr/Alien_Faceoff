

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "DGInterfaceCount.h"
#import "DGSound.h"
#import "DGGameController.h"
#import "DGSettingsController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DGViewController : UIViewController{
    DGInterfaceCount *interfaceCount;
    DGSound *sound;
    IBOutlet UIImageView *image;
}

@property (weak, nonatomic) IBOutlet ADBannerView *iAdBanner;
@property (weak, nonatomic) IBOutlet UIImageView *logoGame;
@property (weak, nonatomic) IBOutlet UIImageView *sunTexture;
@property (weak, nonatomic) IBOutlet UIImageView *player1Image;
@property (weak, nonatomic) IBOutlet UIButton *buttonSingle;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwoPlayer;
@property (weak, nonatomic) IBOutlet UIButton *buttonSetting;

- (IBAction)buttonSingleUp:(id)sender;
- (IBAction)buttonTwoPlayerUp:(id)sender;
- (IBAction)buttonSettingUp:(id)sender;
- (IBAction)tutorial:(id)sender;

@end
