//
//  Home.m
//  Mi primera tabla
//
//  Created by MacL on 20/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "TableController.h"
#import "cellMainTable.h"
#import "InfoViewController.h"
@import Firebase;

@interface TableController ()
@property NSMutableArray *userNames;
@property NSMutableArray *userImgs;

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initController{
    self.userNames = [[NSMutableArray alloc] initWithObjects: @"ZAPATO 1", @"ZAPATO 2", @"ZAPATO 3", @"ZAPATO 4", nil ];
    self.userImgs =[[NSMutableArray alloc] initWithObjects: @"zapato1.jpeg", @"zapato2.jpeg", @"zapato3.jpeg", @"zapato4.jpeg", nil ];
}
//////TABLE

- (NSInteger)numberOfSectionTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.userNames.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    cell.labelName.text       = self.userNames[indexPath.row];
    cell.ImgUser.image      = [UIImage imageNamed:self.userImgs[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"TableToDetail" sender:self];
}


/////END TABLE


- (IBAction)btnAddPressed:(id)sender {
    //[self.userNames]
}

-(void) addCellWithName:(NSString*)name withAge:(NSString*)age withDescription:(NSString *)description andImage:(UIImage *)image {
    [self.userNames addObject:name];
    [self.userImgs addObject:image];
    [self.tableMain reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    InfoViewController *infoView = [segue destinationViewController];

    long index = [self.tableMain.indexPathForSelectedRow row];
    UIImage* image = nil;
    image = [UIImage imageNamed:self.userImgs[index]];

    [infoView setInfoWithName:self.userNames[index] andImage:image];
    [FIRAnalytics logEventWithName:@"Click_shoe" parameters:@{
                                                                @"index": [[NSNumber numberWithLong: index] stringValue]
                                                            }];
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

@end
