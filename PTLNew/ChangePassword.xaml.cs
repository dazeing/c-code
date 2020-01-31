using System.Windows;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для ChangePassword.xaml
    /// </summary>
    public partial class ChangePassword : Window
    {
        public ChangePassword(string password, int userId)
        {
            HashedPasswrod = password;
            UserId = userId;
            InitializeComponent();
        }

        public int UserId { get; set; }
        public string HashedPasswrod { get; set; }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private bool LengthVer()
        {
            if (NewBox.Password.Length < 4)
            {
                MessageBox.Show("Длина пароля должна быть не меньше 4-х знаков");
                return false;
            }
            return true;
        }

        private bool MatchVer()
        {
            if (NewBox.Password != RepeatBox.Password)
            {
                MessageBox.Show("Пароли должны совпадать");
                return false;
            }
            return true;
        }

        private bool CurrentPassVer()
        {
            var password = MainWindow.Sha256Encrypt(CurrentBox.Password);
            if (password != HashedPasswrod)
            {
                MessageBox.Show("Неверный текущий пароль");
                return false;
            }
            return true;
        }

        private void ChangePassBtn_Click(object sender, RoutedEventArgs e)
        {
            if (CurrentPassVer() && MatchVer() && LengthVer())
            {
                try
                {
                    using (PTLEntities db = new PTLEntities())
                    {
                        var user = db.User.Find(UserId);
                        user.PasswordHash = MainWindow.Sha256Encrypt(NewBox.Password);
                        db.SaveChanges();
                        Close();
                    }
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
