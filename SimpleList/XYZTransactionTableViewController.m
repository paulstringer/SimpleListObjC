#import "XYZTransactionTableViewController+TransactionDataSource.h"
#import "XYZTransactionTableViewControllerPrivate.h"
#import "XYZTransactionDetailViewController.h"

@implementation XYZTransactionTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"Transactions";
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  
    [self.view addSubview:_tableView];
  
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewTransaction:)];
}

- (NSMutableArray *)transactions {
  if (_transactions == nil) {
    _transactions = [[NSMutableArray alloc] init];
  }
  return _transactions;
}

- (void)insertNewTransaction:(id)sender {
  XYZTransaction *transaction = [[XYZTransaction alloc] init];
  [self.transactions addObject:transaction];
  [_tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  [super setEditing:editing animated:true];
  [_tableView setEditing:editing animated:true];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  XYZTransactionDetailViewController *detailViewController = [[XYZTransactionDetailViewController alloc] init];
  [detailViewController displayTransaction:_transactions[indexPath.row]];
  [self.navigationController pushViewController:detailViewController animated:TRUE];
}

@end
