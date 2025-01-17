﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Koontabi.Repository
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using Koontabi.Domain; //Add Domain Referente
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class KoontabiDBEntities : DbContext
    {
        public KoontabiDBEntities()
            : base("name=KoontabiDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bodega> Bodegas { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<InvoiceDetail> InvoiceDetails { get; set; }
        public virtual DbSet<Kardex> Kardexes { get; set; }
        public virtual DbSet<Municipality> Municipalities { get; set; }
        public virtual DbSet<ProductDetail> ProductDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Province> Provinces { get; set; }
        public virtual DbSet<Tax> Taxes { get; set; }
        public virtual DbSet<TypeOfPay> TypeOfPays { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<GetInvoiceByIDView> GetInvoiceByIDViews { get; set; }
        public virtual DbSet<V_DisplayAllInvoices> V_DisplayAllInvoices { get; set; }
        public virtual DbSet<V_DisplayAllSales> V_DisplayAllSales { get; set; }
        public virtual DbSet<V_DisplayAllInvoicesByZone> V_DisplayAllInvoicesByZone { get; set; }
        public virtual DbSet<PaidAccount> PaidAccounts { get; set; }
        public virtual DbSet<PaidAccountDetail> PaidAccountDetails { get; set; }
    
        public virtual ObjectResult<sp_ExitCustomerCode> sp_ExitCustomerCode(string customerCode)
        {
            var customerCodeParameter = customerCode != null ?
                new ObjectParameter("CustomerCode", customerCode) :
                new ObjectParameter("CustomerCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_ExitCustomerCode>("sp_ExitCustomerCode", customerCodeParameter);
        }
    
        public virtual ObjectResult<Sp_GetAllBodega> Sp_GetAllBodega()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAllBodega>("Sp_GetAllBodega");
        }
    
        public virtual ObjectResult<Sp_GetAllCategories> Sp_GetAllCategories()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAllCategories>("Sp_GetAllCategories");
        }
    
        public virtual ObjectResult<sp_getAllMunicipalitiesById> sp_getAllMunicipalitiesById(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_getAllMunicipalitiesById>("sp_getAllMunicipalitiesById", idParameter);
        }
    
        public virtual ObjectResult<sp_getAllProvinces> sp_getAllProvinces()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_getAllProvinces>("sp_getAllProvinces");
        }
    
        public virtual ObjectResult<Sp_GetCategories> Sp_GetCategories()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetCategories>("Sp_GetCategories");
        }
    
        public virtual ObjectResult<Sp_GetUnits> Sp_GetUnits()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetUnits>("Sp_GetUnits");
        }
    
        public virtual ObjectResult<Sp_Taxes> Sp_Taxes()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_Taxes>("Sp_Taxes");
        }
    
        public virtual ObjectResult<Sp_GetAllProducts> Sp_GetAllProducts()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAllProducts>("Sp_GetAllProducts");
        }
    
        public virtual ObjectResult<Sp_ValidateProductCodeIfExit> Sp_ValidateProductCodeIfExit(string productCode)
        {
            var productCodeParameter = productCode != null ?
                new ObjectParameter("ProductCode", productCode) :
                new ObjectParameter("ProductCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_ValidateProductCodeIfExit>("Sp_ValidateProductCodeIfExit", productCodeParameter);
        }
    
        public virtual ObjectResult<Sp_TypeOfPay> Sp_TypeOfPay()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_TypeOfPay>("Sp_TypeOfPay");
        }
    
        public virtual ObjectResult<Sp_GetCustomerByParam> Sp_GetCustomerByParam(string customerParam)
        {
            var customerParamParameter = customerParam != null ?
                new ObjectParameter("CustomerParam", customerParam) :
                new ObjectParameter("CustomerParam", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetCustomerByParam>("Sp_GetCustomerByParam", customerParamParameter);
        }
    
        public virtual ObjectResult<Sp_GetEmployeeToComboBox> Sp_GetEmployeeToComboBox()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetEmployeeToComboBox>("Sp_GetEmployeeToComboBox");
        }
    
        public virtual ObjectResult<Sp_GetLastInvoiceNumber> Sp_GetLastInvoiceNumber()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetLastInvoiceNumber>("Sp_GetLastInvoiceNumber");
        }
    
        public virtual ObjectResult<SpValidateIfExitRefenceInvoice> SpValidateIfExitRefenceInvoice(string referenceInvoice)
        {
            var referenceInvoiceParameter = referenceInvoice != null ?
                new ObjectParameter("ReferenceInvoice", referenceInvoice) :
                new ObjectParameter("ReferenceInvoice", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SpValidateIfExitRefenceInvoice>("SpValidateIfExitRefenceInvoice", referenceInvoiceParameter);
        }
    
        public virtual ObjectResult<SpGetLastCustomerCode> Sp_GetLastCustomerCode()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SpGetLastCustomerCode>("Sp_GetLastCustomerCode");
        }
    
        public virtual ObjectResult<Sp_GetProductByID> Sp_GetProductByID(Nullable<int> productID)
        {
            var productIDParameter = productID.HasValue ?
                new ObjectParameter("ProductID", productID) :
                new ObjectParameter("ProductID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetProductByID>("Sp_GetProductByID", productIDParameter);
        }
    
        public virtual ObjectResult<sp_GetAllCustomerRadGridShowData> sp_GetAllCustomerRadGridShowData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetAllCustomerRadGridShowData>("sp_GetAllCustomerRadGridShowData");
        }
    
        public virtual ObjectResult<GetAllZoneProvince> GetAllZoneProvince()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAllZoneProvince>("GetAllZoneProvince");
        }
    
        public virtual ObjectResult<SP_GET_STATUS> SP_GET_STATUS(Nullable<int> sTATUS)
        {
            var sTATUSParameter = sTATUS.HasValue ?
                new ObjectParameter("STATUS", sTATUS) :
                new ObjectParameter("STATUS", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_GET_STATUS>("SP_GET_STATUS", sTATUSParameter);
        }
    
        public virtual ObjectResult<Sp_ValidateRefNumberInvoicePay> Sp_ValidateRefNumberInvoicePay(string refNumberInvoice)
        {
            var refNumberInvoiceParameter = refNumberInvoice != null ?
                new ObjectParameter("RefNumberInvoice", refNumberInvoice) :
                new ObjectParameter("RefNumberInvoice", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_ValidateRefNumberInvoicePay>("Sp_ValidateRefNumberInvoicePay", refNumberInvoiceParameter);
        }
    
        public virtual ObjectResult<Sp_ValidateInvoiceOldByPay> Sp_ValidateInvoiceOldByPay(Nullable<System.DateTime> dateToValidate, Nullable<int> customerid)
        {
            var dateToValidateParameter = dateToValidate.HasValue ?
                new ObjectParameter("DateToValidate", dateToValidate) :
                new ObjectParameter("DateToValidate", typeof(System.DateTime));
    
            var customeridParameter = customerid.HasValue ?
                new ObjectParameter("Customerid", customerid) :
                new ObjectParameter("Customerid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_ValidateInvoiceOldByPay>("Sp_ValidateInvoiceOldByPay", dateToValidateParameter, customeridParameter);
        }
    
        public virtual int Sp_GetInvoiceOverDue()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Sp_GetInvoiceOverDue");
        }
    
        public virtual int Sp_GetInvoiceDetailsOverDue()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Sp_GetInvoiceDetailsOverDue");
        }
    
        public virtual ObjectResult<Sp_GetAllInvoicesOverDue> Sp_GetAllInvoicesOverDue()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAllInvoicesOverDue>("Sp_GetAllInvoicesOverDue");
        }
    
        public virtual ObjectResult<Sp_GetAllInvoicesDetailsOverDue> Sp_GetAllInvoicesDetailsOverDue()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Sp_GetAllInvoicesDetailsOverDue>("Sp_GetAllInvoicesDetailsOverDue");
        }
    }
}
