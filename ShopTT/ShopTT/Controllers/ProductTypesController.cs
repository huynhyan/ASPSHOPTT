using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Controllers
{
    public class ProductTypesController : Controller
    {
        // GET: ProductTypes
        ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PartialProductTypes()
        {
            var loaisanpham = _dbContext.ProductTypes.OrderBy(x => x.typeName).ToList();
            return PartialView(loaisanpham);
        }
    }
}