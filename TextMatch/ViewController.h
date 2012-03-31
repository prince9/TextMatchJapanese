//
//  ViewController.h
//  TextMatch
//
//  Created by 真有 津坂 on 12/03/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int x;
    int y;
}
//テキスト入力
@property (weak, nonatomic) IBOutlet UITextField *myField;
//入力したテキストをそのまま表示
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
//文字列を検索して特定の文字列があるかどうか判定、あるかないかを表示
@property (weak, nonatomic) IBOutlet UILabel *hantei;
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
//特定の文字列を特定の文字列に置き換える
@property (weak, nonatomic) IBOutlet UILabel *chikan;

- (IBAction)textInput:(id)sender;

//文字列検索判定+置き換え開始ボタン
- (IBAction)hanteiButton:(id)sender;

@end
