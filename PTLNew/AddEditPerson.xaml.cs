using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для AddEditPerson.xaml
    /// </summary>
    public partial class AddEditPerson : Window
    {
        public AddEditPerson(int personId, int userId)
        {
            PersonId = personId;
            UserId = userId;
            InitializeComponent();
            InitializeWindow();
        }

        public int PersonId { get; set; }
        public int UserId { get; set; }
        public Person Person { get; set; }

        private void InitializeWindow()
        {
            if (PersonId != 0)
            {
                WindowTitle.Text = "Редактирование персоны";
                DeleteBtn.Visibility = Visibility.Visible;
                AddBtn.Content = "Сохранить";
                try
                {
                    using (PTLEntities db = new PTLEntities())
                    {
                        Person = db.Person.Find(PersonId);
                        SurnameBox.Text = Person.Surname;
                        NameBox.Text = Person.Name;
                        PatBox.Text = Person.Patronymic;
                        PhoneBox.Text = Person.Phone;
                        PassportBox.Text = Person.PassportNumber;
                        CountryComboBox.ItemsSource = db.Country.Select(x => x.Title).ToList();
                        CountryComboBox.Text = Person.Country.Title;
                    }
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
            else
            {
                using (PTLEntities db = new PTLEntities())
                {
                    CountryComboBox.ItemsSource = db.Country.Select(x => x.Title).ToList();
                    CountryComboBox.Text = CountryComboBox.Items[0].ToString();
                }
            }
        }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Удалить персону?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    using (PTLEntities db = new PTLEntities())
                    {
                        db.Person.Remove(db.Person.Find(PersonId));
                        db.SaveChanges();
                        var ownerWindow = Owner as EditUser;
                        ownerWindow.LoadData();
                        Close();
                    }
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private bool Validation()
        {
            var textBoxes = FirstColumnPanel.Children.OfType<TextBox>().Concat(SecondColumnPanel.Children.OfType<TextBox>());
            var isEmpty = textBoxes.Any(x => x.Text == "" || x.Text.Length < 4);
            if (isEmpty)
            {
                return false;
            }
            return true;
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (PTLEntities db = new PTLEntities())
                {
                    var countryId = db.Country.Where(x => x.Title == CountryComboBox.Text).FirstOrDefault().Country_Id;
                    if (Validation())
                    {
                        if (PersonId == 0)
                        {
                            Person person = new Person
                            {
                                Surname = SurnameBox.Text,
                                Name = NameBox.Text,
                                Patronymic = PatBox.Text,
                                Phone = PhoneBox.Text,
                                PassportNumber = PassportBox.Text,
                                IsPrimary = 0,
                                Country_Id = countryId,
                                User_Id = UserId
                            };
                            db.Person.Add(person);
                        }
                        else
                        {
                            var person = db.Person.Find(PersonId);
                            person.Surname = SurnameBox.Text;
                            person.Name = NameBox.Text;
                            person.Patronymic = PatBox.Text;
                            person.Phone = PhoneBox.Text;
                            person.PassportNumber = PassportBox.Text;
                            person.Country_Id = countryId;
                        }
                        db.SaveChanges();
                        var ownerWindow = Owner as EditUser;
                        ownerWindow.LoadData();
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Validation Error");
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
