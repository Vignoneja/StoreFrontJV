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
    public class NumPlayersController : Controller
    {
        private GameStoreEntities db = new GameStoreEntities();

        // GET: NumPlayers
        public ActionResult Index()
        {
            return View(db.NumPlayers.ToList());
        }

        // GET: NumPlayers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NumPlayer numPlayer = db.NumPlayers.Find(id);
            if (numPlayer == null)
            {
                return HttpNotFound();
            }
            return View(numPlayer);
        }

        // GET: NumPlayers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NumPlayers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PlayerID,NumPlayers")] NumPlayer numPlayer)
        {
            if (ModelState.IsValid)
            {
                db.NumPlayers.Add(numPlayer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(numPlayer);
        }

        // GET: NumPlayers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NumPlayer numPlayer = db.NumPlayers.Find(id);
            if (numPlayer == null)
            {
                return HttpNotFound();
            }
            return View(numPlayer);
        }

        // POST: NumPlayers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PlayerID,NumPlayers")] NumPlayer numPlayer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(numPlayer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(numPlayer);
        }

        // GET: NumPlayers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NumPlayer numPlayer = db.NumPlayers.Find(id);
            if (numPlayer == null)
            {
                return HttpNotFound();
            }
            return View(numPlayer);
        }

        // POST: NumPlayers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NumPlayer numPlayer = db.NumPlayers.Find(id);
            db.NumPlayers.Remove(numPlayer);
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
