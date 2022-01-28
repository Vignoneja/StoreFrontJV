using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JVStoreFront.DATA.EF;
using JVStoreFront.UI.MVC.Utilities;
using JVStoreFront.UI.MVC.Models;

namespace JVStoreFront.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private GameStoreEntities db = new GameStoreEntities();        

        // GET: Products
        public ActionResult Index()
        {            
            var products = db.Products.Include(p => p.ESRB).Include(p => p.MediaType).Include(p => p.NumPlayer).Include(p => p.Publisher).Include(p => p.StockStatus);
            return View(products.ToList());
        }
        //GET: Products/Upcoming
        [HttpGet]
        public ActionResult Upcoming()
        {
            var upcomingList = db.Products.OrderBy(p => p.ReleaseDate > DateTime.Now).Where(p => p.ReleaseDate > DateTime.Now).ToList();
            if (upcomingList == null)
            {
                return RedirectToAction("Index");
            }
            return View(upcomingList);
        }


        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }
        #region Custom Add to Cart Functionality (Called from the Details View)

        public ActionResult AddToCart(int qty, int productId)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            
            Product game = db.Products.Where(p => p.ProductId == productId).FirstOrDefault();

            if (game == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                CartItemViewModel item = new CartItemViewModel(qty, game);

                if (shoppingCart.ContainsKey(game.ProductId))
                {
                    shoppingCart[game.ProductId].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(game.ProductId, item);
                }
                Session["cart"] = shoppingCart;

            }
            return RedirectToAction("Index", "ShoppingCart");
        }

        #endregion

        // GET: Products/Create
        [Authorize(Roles ="Admin")]        
        public ActionResult Create()
        {
            ViewBag.ESRBID = new SelectList(db.ESRBs, "ESRBID", "ESRBName");
            ViewBag.MediaID = new SelectList(db.MediaTypes, "MediaID", "MediaType1");
            ViewBag.PlayerID = new SelectList(db.NumPlayers, "PlayerID", "NumPlayers");
            ViewBag.PublisherID = new SelectList(db.Publishers, "PublisherID", "PublisherName");
            ViewBag.StockStatusID = new SelectList(db.StockStatus1, "StockStatusID", "StockStatusName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles ="Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductId,ProductTitle,ProductDesc,PlayerID,ESRBID,ReleaseDate,Price,PublisherID,MediaID,StockStatusID,Quantity,GameImage,UnitsSold")] Product products, HttpPostedFileBase gameImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                
                string imageName = "noImage.png";
                
                if (gameImage != null)
                {                    
                    imageName = gameImage.FileName;
                    
                    string ext = imageName.Substring(imageName.LastIndexOf("."));
                    
                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };
                    
                    if (goodExts.Contains(ext.ToLower()) && gameImage.ContentLength <= 4194304)
                    {
                        imageName = Guid.NewGuid() + ext;

                        #region Resize Image Functionality
                        string savePath = Server.MapPath("~/Content/images/products/");

                        Image convertedImage = Image.FromStream(gameImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);

                        #endregion
                        
                    }//END IF
                    
               products.GameImage = imageName;                   

                }//END IF

                #endregion

                db.Products.Add(products);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ESRBID = new SelectList(db.ESRBs, "ESRBID", "ESRBName", products.ESRBID);
            ViewBag.MediaID = new SelectList(db.MediaTypes, "MediaID", "MediaType1", products.MediaID);
            ViewBag.PlayerID = new SelectList(db.NumPlayers, "PlayerID", "NumPlayers", products.PlayerID);
            ViewBag.PublisherID = new SelectList(db.Publishers, "PublisherID", "PublisherName", products.PublisherID);
            ViewBag.StockStatusID = new SelectList(db.StockStatus1, "StockStatusID", "StockStatusName", products.StockStatusID);
            return View(products);
        }

        // GET: Products/Edit/5
        [Authorize(Roles ="Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            ViewBag.ESRBID = new SelectList(db.ESRBs, "ESRBID", "ESRBName", products.ESRBID);
            ViewBag.MediaID = new SelectList(db.MediaTypes, "MediaID", "MediaType1", products.MediaID);
            ViewBag.PlayerID = new SelectList(db.NumPlayers, "PlayerID", "NumPlayers", products.PlayerID);
            ViewBag.PublisherID = new SelectList(db.Publishers, "PublisherID", "PublisherName", products.PublisherID);
            ViewBag.StockStatusID = new SelectList(db.StockStatus1, "StockStatusID", "StockStatusName", products.StockStatusID);
            return View(products);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles ="Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductId,ProductTitle,ProductDesc,PlayerID,ESRBID,ReleaseDate,Price,PublisherID,MediaID,StockStatusID,Quantity,GameImage,UnitsSold")] Product products, HttpPostedFileBase gameImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload

                string imageName = "noImage.png";

                if (gameImage != null)
                {
                    imageName = gameImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && gameImage.ContentLength <= 4194304)
                    {
                        imageName = Guid.NewGuid() + ext;

                        #region Resize Image Functionality
                        string savePath = Server.MapPath("~/Content/images/products");

                        Image convertedImage = Image.FromStream(gameImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);

                        #endregion

                    }//END IF

                    products.GameImage = imageName;

                }//END IF

                #endregion

                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ESRBID = new SelectList(db.ESRBs, "ESRBID", "ESRBName", products.ESRBID);
            ViewBag.MediaID = new SelectList(db.MediaTypes, "MediaID", "MediaType1", products.MediaID);
            ViewBag.PlayerID = new SelectList(db.NumPlayers, "PlayerID", "NumPlayers", products.PlayerID);
            ViewBag.PublisherID = new SelectList(db.Publishers, "PublisherID", "PublisherName", products.PublisherID);
            ViewBag.StockStatusID = new SelectList(db.StockStatus1, "StockStatusID", "StockStatusName", products.StockStatusID);
            return View(products);
        }

        // GET: Products/Delete/5       
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product products = db.Products.Find(id);

            string path = Server.MapPath("~/Content/images/products");

            ImageUtility.Delete(path, products.GameImage);

            db.Products.Remove(products);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
