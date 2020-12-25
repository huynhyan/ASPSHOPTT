using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Controllers
{
    public class ProducersController : Controller
    {
        // GET: Producers
        ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            return View();
        }

         public ActionResult PartialProducer()
        {
            var pdc = _dbContext.Producers.OrderBy(x => x.pdcName).ToList();
            return PartialView(pdc);
        }
    }
}