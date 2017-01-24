
#import <UIKit/UIKit.h>
#import "DGInterfaceCount.h"
#import "DGSound.h"
#import <AVFoundation/AVFoundation.h>

#import "DGViewController.h"

@interface DGSettingsController : UIViewController{
    DGInterfaceCount *interfaceCount;
    DGSound *sound;
}

@property (weak, nonatomic) IBOutlet UIImageView *selectImagePlayer1;
@property (weak, nonatomic) IBOutlet UIImageView *selectImagePlayer2;

@property (weak, nonatomic) IBOutlet UIImageView *player1Label;
@property (weak, nonatomic) IBOutlet UIImageView *player2Label;

@property (weak, nonatomic) IBOutlet UIButton *buttonBack;

@property (weak, nonatomic) IBOutlet UIButton *button1PlayerSkin1;
@property (weak, nonatomic) IBOutlet UIButton *button1PlayerSkin2;
@property (weak, nonatomic) IBOutlet UIButton *button1PlayerSkin3;

@property (weak, nonatomic) IBOutlet UIButton *button2PlayerSkin1;
@property (weak, nonatomic) IBOutlet UIButton *button2PlayerSkin2;
@property (weak, nonatomic) IBOutlet UIButton *button2PlayerSkin3;

- (IBAction)buttonBack:(id)sender;

- (IBAction)buttonPlayer1Skin1:(id)sender;
- (IBAction)buttonPlayer1Skin2:(id)sender;
- (IBAction)buttonPlayer1Skin3:(id)sender;

- (IBAction)buttonPlayer2Skin1:(id)sender;
- (IBAction)buttonPlayer2Skin2:(id)sender;
- (IBAction)buttonPlayer2Skin3:(id)sender;

@end
