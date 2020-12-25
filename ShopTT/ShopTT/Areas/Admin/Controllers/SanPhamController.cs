using ShopTT.Areas.Admin.Models;
using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Areas.Admin.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: Admin/Products
        private ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            var lstProduct = from sanpham in _dbContext.Products
                             join LSP in _dbContext.ProductTypes on sanpham.typeID equals LSP.typeID
                             join NSX in _dbContext.Producers on sanpham.pdcID  equals NSX.pdcID
                             orderby sanpham.proUpdateDate descending
                             select new SanPhamModel
                             {
                                 proID = sanpham.proID,
                                 proName = sanpham.proName,
                                 proPrice = sanpham.proPrice,
                                 proPhoto = sanpham.proPhoto,
                                 proSize = sanpham.proSize,
                                 proDescription = sanpham.proDescription,
                                 proUpdateDate = sanpham.proUpdateDate,
                                 proDiscount = sanpham.proDiscount,
                                 typeID = sanpham.typeID,
                                 typeName = LSP.typeName,
                                 pdcID = sanpham.pdcID,
                                 pdcName = NSX.pdcName
                             };
            return View(lstProduct.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SanPhamModel id, HttpPostedFileBase fileUpload)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (id.proID == null)
                    {
                        ViewBag.message = "ID sản phẩm is null";
                        return RedirectToAction("Index", "SanPham");
                    }
                    var newsp = new Product();
                    newsp.proID = id.proID;
                    newsp.proName = id.proName;
                    newsp.typeID = id.typeID;
                    newsp.pdcID = id.pdcID;
                    newsp.proSize = id.proSize;
                    newsp.proPrice = id.proPrice;
                    newsp.proDiscount = id.proDiscount;
                    newsp.proDescription = id.proDescription;
                    newsp.proUpdateDate = id.proUpdateDate;

                //    if (id.Image != null)
                //    {
                //        lay hinh anh
                //       var fileName = System.IO.Path.GetFileName(id.Image.FileName);
                //        LAY tu severs

                //       var path = Path.Combine(Server.MapPath("~/images/image_sp/"), fileName);
                //        if (System.IO.File.Exists(path))
                //        {
                //            ViewBag.message = "Image is exited";
                //        }
                //        else
                //        {
                //            fileUpload.SaveAs(path);
                //        }

                //        gan value image for anhbia

                //       newsp.SPAnh = id.Image.FileName;
                //    }
                //    SetViewBag1();
                //    SetViewBag();
                //}

                _dbContext.Products.Add(newsp);
                    _dbContext.SaveChanges();
                    if (newsp.proID != null)
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

            return RedirectToAction("Index", "SanPham");
        }

        [HandleError]
        public ActionResult Delete(string id, Product obj)
        {
            var deletesp = _dbContext.Products.FirstOrDefault(x => x.proID == id);
            if (deletesp == null)
            {
                ViewBag.message = "Sản phẩm Không tồn tại";
                return RedirectToAction("Index", "Products");
            }
            else
            {
                _dbContext.Products.Remove(deletesp);
                _dbContext.SaveChanges();
                ViewBag.message = "Thêm sản phẩm thành Công";
                return RedirectToAction("Index", "SanPham");
            }
        }
    }
}