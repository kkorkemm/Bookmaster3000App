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
    /// Логика взаимодействия для BookDetailsPage.xaml
    /// </summary>
    public partial class BookDetailsPage : Page
    {
        Books currentBook = new Books();

        public BookDetailsPage(Books book)
        {
            InitializeComponent();
            currentBook = book;
            DataContext = currentBook;
        }

        private void LinkAuthors_Click(object sender, RoutedEventArgs e)
        {
            var count = currentBook.Authors.Count;

            if (count == 0)
            {
                MessageBox.Show("Нет информации об авторах");
                return;
            }

            Windows.AuthorInfoWindow authorInfoWindow = new Windows.AuthorInfoWindow(currentBook);
            authorInfoWindow.Title = "Authors of " + currentBook.Title;
            authorInfoWindow.Show();
        }
    }
}
