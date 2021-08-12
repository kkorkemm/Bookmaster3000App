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
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(TextLogin.Text))
                errors.AppendLine("Введите логин!");
            if (string.IsNullOrWhiteSpace(TextPass.Password))
                errors.AppendLine("Введите пароль!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            else
            {
                var user = AppData.GetContext().User.ToList().Where(p => p.Username == TextLogin.Text && p.Password == TextPass.Password).FirstOrDefault();

                if (user == null)
                {
                    MessageBox.Show("Неверные логин и пароль!");
                    return;
                }
                else
                {
                    AppData.currentUser = user;
                    MessageBox.Show("Вход выполнен успешно!");                 
                }

                Close();
            }
        }

        /// <summary>
        /// Actions for cancel login
        /// </summary>
        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
