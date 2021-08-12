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
    /// Логика взаимодействия для ManageCustomerPage.xaml
    /// </summary>
    public partial class ManageCustomerPage : Page
    {
        public ManageCustomerPage()
        {
            InitializeComponent();

            UpdateCustomers();
        }

        /// <summary>
        /// Обновление таблицы с клиентами
        /// </summary>
        private void UpdateCustomers()
        {
            var customers = AppData.GetContext().Customers.ToList();

            if (!string.IsNullOrWhiteSpace(TextCustomerID.Text))
                customers = customers.Where(p => p.ID.Contains(TextCustomerID.Text)).ToList();
            if (!string.IsNullOrWhiteSpace(TextName.Text))
                customers = customers.Where(p => p.Name.ToLower().Contains(TextName.Text)).ToList();

            GridCustomers.ItemsSource = customers;
        }


        /// <summary>
        /// Фильтрация
        /// </summary>
        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            UpdateCustomers();
        }


        /// <summary>
        /// Редактирование клиента
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedCustomer = GridCustomers.SelectedItem as Customers;

            if (selectedCustomer == null)
            {
                MessageBox.Show("Выберите клиента для редактирования!");
            }
            else
            {
                Navigation.MainFrame.Navigate(new AddEditCustomerPage(selectedCustomer));
            }
        }


        /// <summary>
        /// Добавление клиента
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new AddEditCustomerPage(null));
        }
    }
}
