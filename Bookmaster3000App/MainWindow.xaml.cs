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

namespace Bookmaster3000App
{
    using Base;

    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new Pages.MainPage());
            Navigation.MainFrame = MainFrame;

            CheckUser();
        }


        /// <summary>
        /// Проверка на выполнение входа 
        /// </summary>
        private void CheckUser()
        {
            if (AppData.currentUser != null)
            {
                MenuLibrary.Visibility = Visibility.Visible;
                MenuLogin.IsEnabled = false;
                MenuLogout.IsEnabled = true;
            }
            else
            {
                MenuLibrary.Visibility = Visibility.Hidden;
                MenuLogout.IsEnabled = false;
                MenuLogin.IsEnabled = true;
            }
        }

        /// <summary>
        /// Actions for closing application
        /// </summary>
        private void MenuClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void MenuLogout_Click(object sender, RoutedEventArgs e)
        {
            AppData.currentUser = null;
            CheckUser();

            Navigation.MainFrame.Navigate(new Pages.MainPage());
        }

        private void MenuLogin_Click(object sender, RoutedEventArgs e)
        {
            Windows.LoginWindow loginWindow = new Windows.LoginWindow();
            loginWindow.ShowDialog();
            
            CheckUser();
        }

        private void MenuCustomers_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new Pages.ManageCustomerPage());
        }

        private void Circulation_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new Pages.CirculationPage());
        }

        private void MenuReports_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new Pages.ReportsPage());
        }
    }
}
