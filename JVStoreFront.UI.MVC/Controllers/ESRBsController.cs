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
    public class ESRBsController : Controller
    {
        private GameStoreEntities db = new GameStoreEntities();

        // GET: ESRBs
        public ActionResult Index()
        {
            return View(db.ESRBs.ToList());
        }

        // GET: ESRBs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ESRB eSRB = db.ESRBs.Find(id);
            if (eSRB == null)
            {
                return HttpNotFound();
            }
            return View(eSRB);
        }

        // GET: ESRBs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ESRBs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ESRBID,ESRBName")] ESRB eSRB)
        {
            if (ModelState.IsValid)
            {
                db.ESRBs.Add(eSRB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(eSRB);
        }

        // GET: ESRBs/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ESRB eSRB = db.ESRBs.Find(id);
            if (eSRB == null)
            {
                return HttpNotFound();
            }
            return View(eSRB);
        }

        // POST: ESRBs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ESRBID,ESRBName")] ESRB eSRB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(eSRB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(eSRB);
        }

        // GET: ESRBs/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ESRB eSRB = db.ESRBs.Find(id);
            if (eSRB == null)
            {
                return HttpNotFound();
            }
            return View(eSRB);
        }

        // POST: ESRBs/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ESRB eSRB = db.ESRBs.Find(id);
            db.ESRBs.Remove(eSRB);
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
