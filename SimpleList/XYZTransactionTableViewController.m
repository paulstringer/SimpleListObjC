#import "XYZTransactionTableViewController+TransactionDataSource.h"
#import "XYZTransactionTableViewControllerPrivate.h"
#import "XYZTransactionDetailViewController.h"

@implementation XYZTransactionTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (NSMutableArray *)transactions {
  if (_transactions == nil) {
    _transactions = [[NSMutableArray alloc] init];
  }
  return _transactions;
}

- (IBAction)insertNewTransaction:(id)sender {
  XYZTransaction *transaction = [[XYZTransaction alloc] init];
  [self.transactions addObject:transaction];
  [self.transactions sortUsingComparator:^NSComparisonResult(XYZTransaction  *obj1, XYZTransaction *obj2) {
    return [obj2.date compare:obj1.date];
  }];
  [_tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  [super setEditing:editing animated:true];
  [_tableView setEditing:editing animated:true];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSIndexPath* selectedTransactionIndexPath = _tableView.indexPathForSelectedRow;
  XYZTransactionDetailViewController *detailViewController = segue.destinationViewController;
  [detailViewController displayTransaction:_transactions[selectedTransactionIndexPath.row]];
  [detailViewController setDeleteBlock:^{
    [self.navigationController popViewControllerAnimated:YES];
    [_transactions removeObjectAtIndex:selectedTransactionIndexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[selectedTransactionIndexPath] withRowAnimation:UITableViewRowAnimationFade];
  }];
}

@end
