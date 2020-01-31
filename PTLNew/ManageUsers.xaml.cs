using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Window = System.Windows.Window;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для ManageUsers.xaml
    /// </summary>
    public partial class ManageUsers : Window
    {
        public ManageUsers(int userid)
        {
            UserId = userid;
            InitializeComponent();
            LoadData();
        }

        public int UserId { get; set; }
        private List<string> Table = new List<string>();

        private void LoadData()
        {
            try
            {
                using (PTLEntities db = new PTLEntities())
                {
                    var Table = db.User.Include("Person").SelectMany(x => x.Person)
                    .Where(x => x.IsPrimary == 1)
                    .Select(x => new
                    {
                        userid = x.User_Id,
                        login = x.User.Login,
                        surname = x.Surname,
                        name = x.Name,
                        country = x.Country.Title
                    }).ToList();
                    DataGrid.ItemsSource = Table;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (DataGrid.SelectedCells.Count != 0)
            {
                DataGridRow row = (DataGridRow)DataGrid.ItemContainerGenerator.ContainerFromIndex(DataGrid.SelectedIndex);
                DataGridCell RowColumn = DataGrid.Columns[0].GetCellContent(row).Parent as DataGridCell;
                int userId = Convert.ToInt32(((TextBlock)RowColumn.Content).Text);
                new EditUser(userId, true).ShowDialog();
            }
            else
            {
                MessageBox.Show("Строка не выбрана");
            }
        }
    }
}

