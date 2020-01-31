using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        public Registration()
        {
            InitializeComponent();
            LoadCountries();
        }

        private void LoadCountries()
        {
            try
            {
                using (PTLEntities db = new PTLEntities())
                {
                    var coutries = db.Country.Select(x => x.Title).ToList();
                    Country.ItemsSource = coutries;
                    Country.Text = Country.Items[0].ToString();
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool IsTextBoxEmpty()
        {
            foreach (var item in panel.Children.OfType<StackPanel>())
            {
                var textbox = item.Children.OfType<TextBox>().FirstOrDefault();
                if (textbox != null)
                {
                    if (textbox.Text == "" && textbox.TabIndex != 1000)
                    {
                        MessageBox.Show("Поля не должны быть пустыми");
                        return true;
                    }
                }
            }
            return false;
        }

        private bool IsLengthCorrect()
        {
            if (Login.Text.Length < 4 || Password.Text.Length < 4)
            {
                MessageBox.Show("Количество символов должно быть больше 3-х");
                return false;
            }
            return true;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!IsTextBoxEmpty() && IsLengthCorrect())
            {
                try
                {
                    using (PTLEntities db = new PTLEntities())
                    {
                        var login = db.User.Where(x => x.Login == Login.Text).FirstOrDefault();
                        if (Equals(login, null))
                        {
                            var countryId = db.Country.Where(x => x.Title == Country.Text).Select(x => x.Country_Id).FirstOrDefault();
                            string hashPassword = MainWindow.Sha256Encrypt(Password.Text);
                            User user = new User() { IsAdmin = 0, Login = Login.Text, PasswordHash = hashPassword };
                            var person = new Person
                            {
                                Name = PersonName.Text,
                                Surname = Surname.Text,
                                Patronymic = Patronymic.Text,
                                IsPrimary = 1,
                                Phone = Phone.Text,
                                PassportNumber = PassportNumber.Text,
                                Country_Id = countryId,
                                User_Id = user.User_Id
                            };
                            db.User.Add(user);
                            db.Person.Add(person);
                            db.SaveChanges();
                            Close();
                        }
                        else
                        {
                            MessageBox.Show("Такой пользователь уже существует!");
                        }
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
