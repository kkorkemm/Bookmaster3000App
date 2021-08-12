using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Bookmaster3000App.Pages
{
    using Base;

    /// <summary>
    /// Логика взаимодействия для CirculationPage.xaml
    /// </summary>
    public partial class CirculationPage : Page
    {
        Customers currentCustomer = new Customers();
        Books currentBook = new Books();

        public CirculationPage()
        {
            InitializeComponent();

            BtnReturn.IsEnabled = false;
            BtnIssue.IsEnabled = false;
        }

        private void UpdateTables()
        {
            var issues = AppData.GetContext().Issues.Where(p => p.CustomerID == currentCustomer.ID).ToList();

            GridHistory.ItemsSource = issues.Where(p => p.Returned || p.DateOfIssue.AddDays(21).Date < DateTime.Now.Date).ToList();
            GridIssues.ItemsSource = issues.Where(p => p.DateOfIssue.AddDays(21) >= DateTime.Now).ToList().OrderByDescending(p => p.ReturnDate);
        }

        private void BtnCirculate_Click(object sender, RoutedEventArgs e)
        {
            var customer = AppData.GetContext().Customers.Where(p => p.ID == TextID.Text).FirstOrDefault();

            if (customer == null)
            {
                MessageBox.Show("Такого клиента не существует!");
                return;
            }

            currentCustomer = customer;
            DataContext = currentCustomer;

            UpdateTables();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (currentCustomer == null)
            {
                MessageBox.Show("Введите ID клиента!");
                return;
            }
            else
            {
                Navigation.MainFrame.Navigate(new Pages.AddEditCustomerPage(currentCustomer));
            }
        }

        private void BtnIssue_Click(object sender, RoutedEventArgs e)
        {
            if (currentBook != null && currentCustomer != null)
            {
                Issues newIssue = new Issues()
                {
                    DateOfIssue = DateTime.Now,
                    ReturnDate = DateTime.Now.AddDays(21),
                    BookID = currentBook.Key,
                    CustomerID = currentCustomer.ID,
                    Returned = false
                };

                AppData.GetContext().Issues.Add(newIssue);

                try
                {
                    AppData.GetContext().SaveChanges();

                    MessageBox.Show("Выдача книги прошла успешно!");

                    UpdateTables();

                    FindBook();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Подтвердите клиента \t" + ex.Message);
                }
            }
        }

        private void BtnReturn_Click(object sender, RoutedEventArgs e)
        {
            var lastissue = AppData.GetContext().Issues.Where(p => p.CustomerID == currentCustomer.ID && p.BookID == currentBook.Key).ToList().LastOrDefault();

            if (lastissue != null)
            {
                lastissue.Returned = true;
                lastissue.ReturnDate = DateTime.Now;

                try
                {
                    AppData.GetContext().SaveChanges();

                    MessageBox.Show("Возврат завершен!");

                    UpdateTables();

                    FindBook();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void BtnRenew_Click(object sender, RoutedEventArgs e)
        {
            var selected = GridIssues.SelectedItem as Issues;

            if (selected == null)
            {
                MessageBox.Show("Выберите книгу для продления!");
                return;
            }
            else
            {
                if (selected.DateOfIssue.AddDays(21) > selected.ReturnDate)
                {
                    MessageBox.Show("Вы уже продлевали книгу!");
                    return;
                }

                selected.ReturnDate.Value.AddDays(7);

                try
                {
                    AppData.GetContext().SaveChanges();
                    MessageBox.Show("Продление усшпено!");
                    UpdateTables();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        /// <summary>
        /// Searching for book by ID
        /// </summary>
        private void TextBookID_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBookID.Text))
            {
                var book = AppData.GetContext().Books.Where(p => p.Key == TextBookID.Text).FirstOrDefault();

                if (book != null)
                {
                    currentBook = book;
                    TextBookTitle.Text = book.Title;
                    FindBook();
                }
                else
                {
                    TextBookTitle.Text = "";
                }
            }
            else
            {
                TextBookTitle.Text = "";
            }
        }

        /// <summary>
        /// Actions for enable Issue and Return buttons
        /// </summary>
        private void FindBook()
        {
            if (currentBook != null)
            {
                var issues = AppData.GetContext().Issues.Where(p => p.BookID == currentBook.Key).ToList();
                var lastissue = issues.OrderBy(p => p.ReturnDate).LastOrDefault();

                if (lastissue != null)
                {
                    if (lastissue.Returned)
                    {
                        BtnIssue.IsEnabled = true;
                    }
                    else
                    {
                        BtnReturn.IsEnabled = true;
                    }
                }
                else
                {
                    BtnIssue.IsEnabled = true;
                }
            }
            else
            {
                BtnIssue.IsEnabled = false;
                BtnReturn.IsEnabled = false;
            }
        }
    }
}
