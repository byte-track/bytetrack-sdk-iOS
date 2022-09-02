//
//  ViewController.m
//  bytetrackDemo_OC
//
//  Created by 孙良 on 2022/9/2.
//

#import "ViewController.h"
#import <Bytetrack/Bytetrack.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton*openBtn=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-50, 200, 100, 100)];
    [openBtn setTitle:@"打开信使" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openBtn];
    // Do any additional setup after loading the view.
}

//MARK: 打开信使
-(void)openClick{
    
    [Bytetrack presentMessenger];
}

@end
