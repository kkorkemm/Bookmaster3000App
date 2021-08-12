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
    /// Логика взаимодействия для AddEditCustomerPage.xaml
    /// </summary>
    public partial class AddEditCustomerPage : Page
    {
        Customers currentCustomer = new Customers();

        public AddEditCustomerPage(Customers customer)
        {
            InitializeComponent();

            if (customer != null)
            {
                currentCustomer = customer;
            }

            DataContext = currentCustomer;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(currentCustomer.Name))
                errors.AppendLine("Введите имя клиента!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            else
            {
                var customers = AppData.GetContext().Customers.ToList().LastOrDefault();
                int number = int.Parse(customers.ID.Replace("C", ""));

                if (currentCustomer.ID == null)
                {
                    currentCustomer.ID = "C" + (number + 1).ToString();

                    AppData.GetContext().Customers.Add(currentCustomer);
                }

                try
                {
                    AppData.GetContext().SaveChanges();
                    MessageBox.Show("Клиент успешно сохранен!");

                    Navigation.MainFrame.Navigate(new Pages.ManageCustomerPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        /// <summary>
        /// Actions for cancel adding/editing customer
        /// </summary>
        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new Pages.ManageCustomerPage());
        }
    }
}
