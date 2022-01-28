using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JVStoreFront.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace JVStoreFront.UI.MVC.Models
{    
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)]
        public int Qty { get; set; }
        public Product Product { get; set; }

        //FQCTOR
        public CartItemViewModel(int qty, Product product)
        {
            Qty = qty;
            Product = product;
        }
    }
}