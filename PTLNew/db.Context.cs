﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PTLNew
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PTLEntities : DbContext
    {
        public PTLEntities()
            : base("name=PTLEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Person> Person { get; set; }
        public virtual DbSet<Region> Region { get; set; }
        public virtual DbSet<Ride> Ride { get; set; }
        public virtual DbSet<RideStop> RideStop { get; set; }
        public virtual DbSet<Route> Route { get; set; }
        public virtual DbSet<RouteStop> RouteStop { get; set; }
        public virtual DbSet<Stop> Stop { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Ticket> Ticket { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Vehicle> Vehicle { get; set; }
    }
}
