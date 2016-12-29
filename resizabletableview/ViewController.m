//
//  ViewController.m
//  resizabletableview
//
//  Created by C N Soft Net on 28/12/16.
//  Copyright © 2016 C N Soft Net. All rights reserved.
//

#import "ViewController.h"
#import "bookCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bookDescVw.delegate=self;
    _bookDescVw.dataSource=self;
//    _bookDescVw.backgroundColor=[UIColor blackColor];
    _bookDescVw.frame=CGRectMake(0, 50,self.view.frame.size.width-10, self.view.frame.size.height);
    
    
    bookData= [[NSArray alloc] initWithObjects:@"This is first book of author but i feel this rocks",@"This is second book of author this book rocks in terms of monetization blah blah blah blajh",@"This is third book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk fhjk",@"This is four book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk end",@"This is five book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk hdskjfhsdjkhfkjdshfjksdhjkfhdsjkhfjkdshfjkdshkjfhdsjkffhjk end",@"This is six book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk end",@"This is five book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk hdskjfhsdjkhfkjdshfjksdhjkfhdsjkhfjkdshfjkdshkjfhdsjkffhjk end",@"This is seven book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk end",@"This is five book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk hdskjfhsdjkhfkjdshfjksdhjkfhdsjkhfjkdshfjkdshkjfhdsjkffhjk end",@"This is eight book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk end",@"This is five book of author but i feel this rocks sdfsdkj hsdlk lkdshflkhds lkhjkl hjklh jfjds hfjkdsh jk jkfdjk hdskjfhsdjkhfkjdshfjksdhjkfhdsjkhfjkdshfjkdshkjfhdsjkffhjk end", nil];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return bookData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat Size = [self calculateHeightForLbl:[bookData objectAtIndex:indexPath.row] width:self.view.frame.size.width/2-20];
    return CGSizeMake(self.view.frame.size.width/2-20,Size+30);
}

-(float)calculateHeightForLbl:(NSString*)text width:(float)width{
    CGSize constraint = CGSizeMake(width,20000.0f);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [text boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                            context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width)/2, ceil(boundingBox.height));
    
    return size.height;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"bookCellId";
    bookCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.bookDetail.text=[NSString stringWithFormat:@"%@",[bookData objectAtIndex:indexPath.row]];
    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
