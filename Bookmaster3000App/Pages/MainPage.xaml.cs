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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();

            UpdateBooks();

            int count = AppData.GetContext().Books.ToList().Count();
            TextBookCount.Text = count.ToString() + " Books found";

            BookInfoFrame.Navigate(new Pages.BookDetailsDefaultPage());
        }


        /// <summary>
        /// Update books' grid
        /// </summary>
        private void UpdateBooks()
        {
            var books = AppData.GetContext().Books.ToList();

            if (!string.IsNullOrWhiteSpace(TextTitle.Text))
                books = books.Where(p => p.Title.ToLower().Contains(TextTitle.Text.ToLower())).ToList();

            if (!string.IsNullOrWhiteSpace(TextAuthor.Text))
                books = books.Where(p => p.AuthorList.ToLower().Contains(TextAuthor.Text.ToLower())).ToList();

            if (!string.IsNullOrWhiteSpace(TextSubject.Text))
                books = books.Where(p => p.SubjectList.ToLower().Contains(TextSubject.Text.ToLower())).ToList();

            GridBooks.ItemsSource = books;
        }

        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            UpdateBooks();
        }

        private void TextPageNumber_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void BtnInfo_Click(object sender, RoutedEventArgs e)
        {
            var book = (sender as Button).DataContext as Books;

            if (book != null)
            {
                BookInfoFrame.Navigate(new BookDetailsPage(book));
            }
        }
    }
}
