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
using System.Windows.Shapes;

namespace Bookmaster3000App.Windows
{
    using Base;

    /// <summary>
    /// Логика взаимодействия для AuthorInfoWindow.xaml
    /// </summary>
    public partial class AuthorInfoWindow : Window
    {
        public AuthorInfoWindow(Books book)
        {
            InitializeComponent();

            ComboAuthors.ItemsSource = book.Authors.ToList();
            ComboAuthors.SelectedIndex = 0;

            var author = ComboAuthors.SelectedItem as Authors;
            DataContext = author;

            if (author.Wikipedia == null)
            {
                AuthorLink.Visibility = Visibility.Hidden;
            }
        }


        /// <summary>
        /// Actions for closing window
        /// </summary>
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        /// <summary>
        /// Choosing different author
        /// </summary>
        private void ComboAuthors_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var author = ComboAuthors.SelectedItem as Authors;
            DataContext = author;
        }
    }
}
