//
//  ViewController.m
//  TextMatch
//
//  Created by 真有 津坂 on 12/03/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize myField;
@synthesize myLabel;
@synthesize hantei;
@synthesize myimage;
@synthesize myimage2;
@synthesize chikan;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyField:nil];
    [self setMyLabel:nil];
    [self setHantei:nil];
    [self setMyimage:nil];
    [self setMyimage2:nil];
    [self setChikan:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)textInput:(id)sender {
    //追加
    myLabel.text = myField.text;
}


- (IBAction)hanteiButton:(id)sender {
 
    //以下追加
    
    /* TextFieldに入力した文字列の検索、検索結果はhantei.textに出力
     ・「あか」があれば黒いちょうちょをxは20-150、yは120-320の範囲のランダムな位置に表示して、
     白いちょうちょを消します
     ・「さた」があれば白いちょうちょをxは20-150、yは120-320の範囲のランダムな位置に表示して、
     黒いちょうちょを消します
     ・該当する文字列がないときは黒いちょうちょ・白いちょうちょともに消します
    */
    
    //文字列検索の準備
    //NSRange 変数 = [《NSString*》 rangeOfString:《NSString*》];
    NSRange searchResult = [myField.text rangeOfString:@"あか"];
    NSRange searchResult2 = [myField.text rangeOfString:@"さた"];
    
    //入力した文字列に「あか」があった場合の処理
    if (searchResult.location != NSNotFound){
        hantei.text = @"あるよ";
        myimage.image = [UIImage imageNamed:@"fly1omin.png"];
        
        //Xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage.center = CGPointMake(x, y);
        myimage2.image = nil;

    }
    
    //入力した文字列に「さた」があった場合の処理
    else if (searchResult2.location != NSNotFound) {
        hantei.text = @"あるよ";
        myimage2.image = [UIImage imageNamed:@"fly4mino.png"];
        
        //Xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage2.center = CGPointMake(x, y);
        myimage.image = nil;

    }

     //入力した文字列に「あか」も「さた」もなかった場合の処理
    else{
        hantei.text = @"ないよ";
        //画像を消す
        myimage.image = nil;
        myimage2.image = nil;
    }
    
    
//「あか」があった場合、「なはなは」と置き換えてラベルに表示　例:「あかいいろ」→「なはなはいいろ」
     NSString *str1 = myField.text;
     NSString *str2 = [str1 stringByReplacingOccurrencesOfString:@"あか" withString:@"なはなは"];
     chikan.text = [NSString stringWithFormat:@"%@",str2];
  


    /*
     以下は入力したテキストが「あか」「さた」に完全に一致した場合の処理。
     NSRange 変数 = [《NSString*》 rangeOfString:《NSString*》];は「あかご」や「さたけ」でも
     「あか」や「さた」があるよ、と返すが、これは「あかご」「さたけ」の場合ないよと返す(「あか」「さた」なら
     あるよと返す)
     
    NSString *hoge2 = @"あか";
    NSString *hoge3 = @"さた";
    if ([myField.text isEqualToString:hoge2]) {
        hantei.text = @"あるよ";
        myimage.image = [UIImage imageNamed:@"fly1omin.png"];
        //xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage.center = CGPointMake(x, y);
       
    }
    else if ([myField.text isEqualToString:hoge3]) {
        hantei.text = @"あるよ";
        myimage2.image = [UIImage imageNamed:@"fly4mino.png"];
        //Xは20-150、yは120-320の範囲でランダムな数を出力、それを画像の表示位置に
        x = arc4random() % 131 + 20;
        y = arc4random() % 201 + 120;
        myimage2.center = CGPointMake(x, y);
        myimage.hidden = YES;

    }
    else {
        hantei.text = @"ないよ";
     myimage.image = nil;
     myimage2.image = nil;
    }

   */
    
  }
@end
