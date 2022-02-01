using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JVStoreFront.DATA.EF;

namespace JVStoreFront.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class StockStatusController : Controller
    {
        private GameStoreEntities db = new GameStoreEntities();

        // GET: StockStatus
        public ActionResult Index()
        {
            return View(db.StockStatus1.ToList());
        }

        // GET: StockStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatus1.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // GET: StockStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: StockStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StockStatusID,StockStatusName,Notes")] StockStatus stockStatus)
        {
            if (ModelState.IsValid)
            {
                db.StockStatus1.Add(stockStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stockStatus);
        }

        // GET: StockStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatus1.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // POST: StockStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StockStatusID,StockStatusName,Notes")] StockStatus stockStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stockStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stockStatus);
        }

        // GET: StockStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatus1.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // POST: StockStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            StockStatus stockStatus = db.StockStatus1.Find(id);
            db.StockStatus1.Remove(stockStatus);
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
