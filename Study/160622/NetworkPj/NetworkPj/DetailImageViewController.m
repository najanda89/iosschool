//
//  DetailImageViewController.m
//  NetworkPj
//
//  Created by Jyo on 2016. 6. 22..
//  Copyright © 2016년 Jyo. All rights reserved.
//

#import "DetailImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailImageViewController ()

@property (nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL isHideNavi;

@end

@implementation DetailImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.imageTitle;
    
    // Here we use the new provided sd_setImageWithURL: method to load the web image
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageName]
                      placeholderImage:nil options:SDWebImageProgressiveDownload | SDWebImageCacheMemoryOnly];
    
    self.isHideNavi = NO;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideNavigationBar)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapGesture];
    
}

- (void)hideNavigationBar {
    
    [self.navigationController setNavigationBarHidden:!self.isHideNavi animated:YES];
    
    self.isHideNavi = !self.isHideNavi;
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
