using ShopTT.Areas.Admin.Models;
using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Areas.Admin.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: Admin/LoaiSanPham
        private ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            var lsttlsp = _dbContext.ProductTypes.Select(x => new LoaiSanPhamModel()
            {
                typeID = x.typeID,
                typeName = x.typeName,
            }).ToList();
            return View(lsttlsp);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(LoaiSanPhamModel id, HttpPostedFileBase fileUpload)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (id.typeID == null)
                    {
                        ViewBag.message = "ID danh mục is null";
                        return RedirectToAction("Index", "LoaiSanPham");
                    }
                    var newsp = new ProductType();
                    newsp.typeID = id.typeID;
                    newsp.typeName = id.typeName;


                    _dbContext.ProductTypes.Add(newsp);
                    _dbContext.SaveChanges();
                    if (newsp.typeID != null)
                    {
                        ViewBag.message = "Insert success..";
                    }
                    ModelState.Clear();
                }
            }
            catch (System.Data.Entity.Validation.DbUnexpectedValidationException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return RedirectToAction("Index", "LoaiSanPham");
        }
    }
}