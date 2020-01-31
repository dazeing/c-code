using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PTLNew
{
    /// <summary>
    /// Логика взаимодействия для ManageRoutes.xaml
    /// </summary>
    public partial class ManageRoutes : Window
    {
        public ManageRoutes()
        {
            InitializeComponent();
            LoadComboBoxes();
        }

        private class Routes
        {
            public int Number { get; set; }
            public string Name { get; set; }
            public int Stops { get; set; }
            public string Departure { get; set; }
            public string Ending { get; set; }
        }

        private class Place
        {
            public int Id { get; set; }
            public string Title { get; set; }
        }

        private void LoadData()
        {

        }

        private List<Place> places = new List<Place>();
        private List<Dictionary<int, string>> comboBoxData = new List<Dictionary<int, string>>();

        private void LoadComboBoxes()
        {

            var countries = new Dictionary<int, string>();
            using (PTLEntities db = new PTLEntities())
            {
                foreach (var item in places)
                {

                }
                countries = db.Country.Select(x => new
                {
                    countryId = x.Country_Id,
                    title = x.Title
                }).AsEnumerable().Select(x => new Country
                {
                    Country_Id = x.countryId,
                    Title = x.title
                }).ToDictionary(k => k.Country_Id, v => v.Title);
                CountryDepartureBox.ItemsSource = countries.Values;
                CountryArrivalBox.ItemsSource = db.Country.Select(x => x.Title).ToList();
                CityArrivalBox.ItemsSource = db.City.Select(x => x.Title).ToList();
                CityDepartureBox.ItemsSource = db.City.Select(x => x.Title).ToList();
                RegionArrivalBox.ItemsSource = db.Region.Select(x => x.Title).ToList();
                RegionDepartureBox.ItemsSource = db.Region.Select(x => x.Title).ToList();
            }
        }

        private void ClearBtn_Click(object sender, RoutedEventArgs e)
        {
            var arrivalCombo = ArrivalPanel.Children.OfType<ComboBox>();
            foreach (var item in arrivalCombo)
            {
                item.Text = "";
            }
            var departureCombo = DeparturePanel.Children.OfType<ComboBox>();
            foreach (var item in departureCombo)
            {
                item.Text = "";
            }
        }

        private void CountryDepartureBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (PTLEntities db = new PTLEntities())
            {
                RegionDepartureBox.ItemsSource = db.Region.Select(x => x.Title);
            }
        }
    }
}
