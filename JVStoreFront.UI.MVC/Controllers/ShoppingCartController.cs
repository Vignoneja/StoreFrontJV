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
        // GET: ShoppingCart -- We will generate the Index View with the List template for the CartItemViewModel objects
        //with no data Context Class.
        public ActionResult Index()
        {
            //Pull the session-based cart into a local variable, which we can then pass to the View.
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //User either hasn't put anything in the cart, removed all cart items, or their session expired
                //Set the cart to an empty object. This allows us to still be able to send that object to the View,
                //which is unlike NULL.

                //Create a message about the empty cart:
                ViewBag.Message = "There are no items in your cart.";

                //Create the empty cart object:
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            else
            {
                //Explicitly clear out the ViewBag.Message variable.
                ViewBag.Message = null;
            }

            return View(shoppingCart);
        }
        public ActionResult RemoveFromCart(int id)
        {
            //Get the cart from the session and bring it in to a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Remove the item
            shoppingCart.Remove(id);
            //Update Session:
            Session["cart"] = shoppingCart;

            //Return them to the View:
            return RedirectToAction("Index");
        }
        public ActionResult UpdateCart(int productID, int qty)
        {
            //Get the session cart and store it in a local variable:
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Target the correct cart item using the bookID for the key. Then change the Qty property with the qty parameter they provide.
            shoppingCart[productID].Qty = qty;

            //Return the local cart to the session:
            Session["cart"] = shoppingCart;

            //Return them to the Shopping Cart Index to see the latest results/items:
            return RedirectToAction("Index");
        }
    }
}