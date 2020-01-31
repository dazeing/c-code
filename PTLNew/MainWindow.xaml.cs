using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Security.Cryptography;
using System.Reflection;
using System.Diagnostics;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public static string Sha256Encrypt(string phrase)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            SHA256Managed sha256hasher = new SHA256Managed();
            byte[] hashedDataBytes = sha256hasher.ComputeHash(encoder.GetBytes(phrase));
            return Convert.ToBase64String(hashedDataBytes);
        }

        private User User { get; set; }

        private bool Verification(string password, string login)
        {
            var hashedPassword = Sha256Encrypt(password);
            try
            {
                using (PTLEntities db = new PTLEntities())
                {
                    User = db.User.Where(x => x.Login == login && x.PasswordHash == hashedPassword).FirstOrDefault();
                    if (Equals(User, null))
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return true;
        }

        private void Hyperlink_Click(object sender, RoutedEventArgs e)
        {
            new Registration().ShowDialog();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Verification(Password.Password, Username.Text))
            {
                if (Equals(User.IsAdmin, 1))
                {
                    new ManageUsers(User.User_Id).ShowDialog();
                }
                else
                {
                    new EditUser(User.User_Id, false).ShowDialog();
                }
            }
            else
            {
                MessageBox.Show("Ошибка!");
                Password.Password = "";
                Username.Focus();
            }
        }

        private void ManualLink_Click(object sender, RoutedEventArgs e)
        {
            var directory = System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            var file = System.IO.Path.Combine(directory, "help.txt");
            Process.Start(file);
        }
    }
}
