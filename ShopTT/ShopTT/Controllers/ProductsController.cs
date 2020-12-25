using PagedList;
using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Controllers
{
    public class ProductsController : Controller
    {
        ShopTTEntities _dbContext = new ShopTTEntities();
        // GET: SanPham
        public ActionResult Index(int? page)
        {
            //so sach tren trang
            int pageSize = 8;
            //so trang
            int pageNumber = (page ?? 1);
            var LstAllSanPham = _dbContext.Products.OrderByDescending(x => x.proPrice).ToList();
            var LsAllSanPham = _dbContext.Products.OrderByDescending(x => x.proPrice).ToPagedList(pageNumber, pageSize);
            if (LsAllSanPham.Count > 0)
            {
                ViewBag.message = "Tổng sản phẩm: " + LsAllSanPham.Count.ToString();
            }
            return View(LsAllSanPham);

        }

        public ActionResult DetailProducts(string idpro)
        {

            var detailsanpham = _dbContext.Products.SingleOrDefault(x => x.proID == idpro);
            if (detailsanpham == null)
            {
                ViewBag.message = "Sản phẩm chưa có thông tin chi tiết....";
                return null;
            }
            return View(detailsanpham);
        }


        public ActionResult ProductbyType(int idproType)
        {
            //check topic exit?
            var lsanpham = _dbContext.ProductTypes.FirstOrDefault(x => x.typeID == idproType);
            if (lsanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var lstloaiSP = _dbContext.Products.Where(x => x.typeID == idproType).OrderByDescending(x => x.proPrice).ToList();
            if (lstloaiSP.Count > 0)
            {
                ViewBag.message = "Tổng sản phẩm: " + lstloaiSP.Count.ToString();
            }
            if (lstloaiSP.Count == 0)
            {
                ViewBag.message = "Sản phẩm hiện chưa mở bán";
            }
            return View(lstloaiSP);
        }


        public ActionResult Productbyproduce(int idpdc)
        {
            //check topic exit?
            var lsanpham = _dbContext.Producers.FirstOrDefault(x => x.pdcID == idpdc);
            if (lsanpham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var lstnhasx = _dbContext.Products.Where(x => x.pdcID == idpdc).OrderByDescending(x => x.proPrice).ToList();
            if (lstnhasx.Count > 0)
            {
                ViewBag.message = "Tổng sản phẩm: " + lstnhasx.Count.ToString();
            }
            if (lstnhasx.Count == 0)
            {
                ViewBag.message = "Sản phẩm hiện chưa mở bán";
            }
            return View(lstnhasx);
        }
    }
}