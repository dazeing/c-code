using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using SWF = System.Windows.Forms;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для EditUser.xaml
    /// </summary>
    public partial class EditUser : Window
    {
        public EditUser(int userId, bool isAdmin)
        {
            IsAdmin = isAdmin;
            UserId = userId;
            InitializeComponent();
            RoleVer();
            LoadData();
        }

        public bool IsAdmin { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }

        private void RoleVer()
        {
            if (!IsAdmin)
            {
                PasswordPanel.Visibility = Visibility.Hidden;
                ChangePassBnt.Visibility = Visibility.Visible;
                WindowTitle.Text = "Личный кабинет";
            }
        }

        public void LoadData()
        {
            try
            {
                using (PTLEntities db = new PTLEntities())
                {
                    var Table = db.Person
                    .Where(x => x.User_Id == UserId)
                    .OrderByDescending(x => x.IsPrimary)
                    .Select(x => new
                    {
                        surname = x.Surname,
                        name = x.Name,
                        patronymic = x.Patronymic,
                        country = x.Country.Title,
                        phone = x.Phone,
                        passport = x.PassportNumber,
                        isprimary = x.IsPrimary,
                        personid = x.Person_Id
                    }).AsEnumerable().Select(x => new Persons
                    {
                        Surname = x.surname,
                        Name = x.name,
                        Patronymic = x.patronymic,
                        Country = x.country,
                        Phone = x.phone,
                        PassportNumber = x.passport,
                        IsPrimary = x.isprimary,
                        Person_Id = x.personid
                    }).ToList();
                    User = db.User.Find(UserId);
                    UsernameBox.Text = User.Login;
                    PasswordBox.Password = User.PasswordHash;
                    DataGrid.ItemsSource = Table;
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private class Persons
        {
            public string Surname { get; set; }
            public string Name { get; set; }
            public string Patronymic { get; set; }
            public string Country { get; set; }
            public string Phone { get; set; }
            public string PassportNumber { get; set; }
            public int IsPrimary { get; set; }
            public int Person_Id { get; set; }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void SelectMainBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DataGrid.SelectedCells.Count != 0)
            {
                DataGridRow row = (DataGridRow)DataGrid.ItemContainerGenerator.ContainerFromIndex(DataGrid.SelectedIndex);
                if (row.GetIndex() != 0)
                {
                    MessageBoxResult result = MessageBox.Show("Сменить основную персону?", "Confirm", MessageBoxButton.YesNoCancel, MessageBoxImage.Asterisk);
                    if (result == MessageBoxResult.Yes)
                    {
                        try
                        {
                            using (PTLEntities db = new PTLEntities())
                            {
                                var data = DataGrid.ItemsSource as List<Persons>;
                                var personId = data[DataGrid.SelectedIndex].Person_Id;
                                var selectedPerson = db.Person.Where(x => x.Person_Id == personId).FirstOrDefault();
                                var currentMainPerson = db.Person.Where(x => User.User_Id == x.User_Id).Where(x => x.IsPrimary == 1)
                                .FirstOrDefault();
                                currentMainPerson.IsPrimary = 0;
                                selectedPerson.IsPrimary = 1;
                                db.SaveChanges();
                                LoadData();
                            }
                        }
                        catch (System.Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Персона уже является основной");
                }
            }
            else
            {
                MessageBox.Show("Строка не выбрана");
            }
        }

        private void ChangePassBnt_Click(object sender, RoutedEventArgs e)
        {
            new ChangePassword(User.PasswordHash, UserId).ShowDialog();
        }

        private void EditPersonBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DataGrid.SelectedIndex != -1 && DataGrid.SelectedIndex != 0)
            {
                var persons = DataGrid.ItemsSource as List<Persons>;
                var personId = persons[DataGrid.SelectedIndex].Person_Id;
                var window = new AddEditPerson(personId, UserId)
                {
                    Owner = this
                };
                window.ShowDialog();
            }
            else
            {
                MessageBox.Show("Строка не выбрана или невозможно редактировать основную персону");
            }
        }

        private void AddPersonBtn_Click(object sender, RoutedEventArgs e)
        {
            
            var window = new AddEditPerson(0, UserId);
            window.Owner = this;
            window.ShowDialog();

        }

        private void ExportBtn_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Office.Interop.Excel.Application exApp = new Microsoft.Office.Interop.Excel.Application();
            exApp.Workbooks.Add();
            Microsoft.Office.Interop.Excel.Worksheet workSheet = (Microsoft.Office.Interop.Excel.Worksheet)exApp.ActiveSheet;
            workSheet.Cells[1, 1] = "Фамилия";
            workSheet.Cells[1, 2] = "Имя";
            workSheet.Cells[1, 3] = "Отчество";
            workSheet.Cells[1, 4] = "Гражданство";
            workSheet.Cells[1, 5] = "Телефон";
            workSheet.Cells[1, 6] = "Паспорт";
            int rowExcel = 2;
            var table = DataGrid.ItemsSource as List<Persons>;
            for (int i = 0; i < DataGrid.Items.Count; i++)
            {
                workSheet.Cells[rowExcel, "A"] = table[i].Surname;
                workSheet.Cells[rowExcel, "B"] = table[i].Name;
                workSheet.Cells[rowExcel, "C"] = table[i].Patronymic;
                workSheet.Cells[rowExcel, "D"] = table[i].Country;
                workSheet.Cells[rowExcel, "E"] = table[i].Phone;
                workSheet.Cells[rowExcel, "F"] = table[i].PassportNumber;
                ++rowExcel;
            }
            Microsoft.Office.Interop.Excel.Range range = workSheet.Range[workSheet.Cells[1, 1], workSheet.Cells[100, 100]];
            range.EntireColumn.AutoFit();
            range.EntireRow.AutoFit();
            SWF.SaveFileDialog saveDialog = new SWF.SaveFileDialog
            {
                AddExtension = true,
                Filter = "Excel files (*.xlsx)|*.xlsx"
            };
            if (saveDialog.ShowDialog() == SWF.DialogResult.OK)
            {
                workSheet.SaveAs(saveDialog.FileName);
            }
            exApp.Visible = true;
            exApp.Workbooks.Open(saveDialog.FileName);
        }
    }
}
