//
//  ViewController.h
//  resizabletableview
//
//  Created by C N Soft Net on 28/12/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *bookData;

}

@property (weak, nonatomic) IBOutlet UICollectionView *bookDescVw;

@end

