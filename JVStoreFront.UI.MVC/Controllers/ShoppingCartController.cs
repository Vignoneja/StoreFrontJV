using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JVStoreFront.UI.MVC.Models; //Added for access to our CartItemViewModel class


namespace JVStoreFront.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                ViewBag.Message = "There are currently no items in your cart.";

                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            else
            {
                ViewBag.Message = null;
            }

            return View(shoppingCart);
        }
        public ActionResult RemoveFromCart(int id)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart.Remove(id);

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }
        public ActionResult UpdateCart(int productID, int qty)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart[productID].Qty = qty;

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }
    }
}