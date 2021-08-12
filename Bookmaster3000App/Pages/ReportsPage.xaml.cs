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
    /// Логика взаимодействия для ReportsPage.xaml
    /// </summary>
    public partial class ReportsPage : Page
    {
        Books currentBook;

        public ReportsPage()
        {
            InitializeComponent();

            var reminders = AppData.GetContext().Issues.Where(p => !p.Returned && p.ReturnDate < DateTime.Now).ToList().OrderBy(p => p.ReturnDate);
            GridReminders.ItemsSource = reminders;

        }


        /// <summary>
        /// Updating grid
        /// </summary>
        private void UpdateTable()
        {
            if (currentBook != null)
            {
                var history = AppData.GetContext().Issues.Where(p => !p.Returned && p.ReturnDate < DateTime.Now && p.BookID == currentBook.Key).ToList().OrderByDescending(p => p.DateOfIssue);
                Gridhistory.ItemsSource = history;
            }
        }

        private void BtnExport_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void TextBookID_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBookID.Text))
            {
                var book = AppData.GetContext().Books.Where(p => p.Key == TextBookID.Text || p.Title == TextBookID.Text).FirstOrDefault();

                if (book != null)
                {
                    currentBook = book;
                    TextBookTitle.Text = book.Title;
                    TextBookSubTitle.Text = book.Subtitle;

                    UpdateTable();
                }
                else
                {
                    TextBookTitle.Text = "";
                    TextBookSubTitle.Text = "";
                }
            }
            else
            {
                TextBookTitle.Text = "";
                TextBookSubTitle.Text = "";
            }
        }
    }
}
