using ShopTT.Areas.Admin.Models;
using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Areas.Admin.Controllers
{
    public class KhachHangController : Controller
    {
        // GET: Admin/KhachHang
        private ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            var lstkh = _dbContext.Customers.Select(x => new KhachHangModel()
            {
                cusFullName = x.cusFullName,
                cusPhone = x.cusPhone,
                cusAddress = x.cusAddress,
                cusEmail = x.cusEmail
            }).ToList();
            return View(lstkh);
        }
    }
}