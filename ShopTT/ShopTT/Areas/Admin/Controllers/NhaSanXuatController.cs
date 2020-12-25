using ShopTT.Areas.Admin.Models;
using ShopTT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopTT.Areas.Admin.Controllers
{
    public class NhaSanXuatController : Controller
    {
        // GET: Admin/NhaSanXuat
        private ShopTTEntities _dbContext = new ShopTTEntities();
        public ActionResult Index()
        {
            var lstnsx = _dbContext.Producers.Select(x => new NhaSanXuatModel()
            {
                pdcID = x.pdcID,
                pdcName = x.pdcName,
                pdcInfo = x.pdcInfo,
                pdcPhone = x.pdcPhone,
                pdcEmail = x.pdcEmail,
                pdcAddress = x.pdcAddress
            }).ToList();
            return View(lstnsx);
        }

        public ActionResult Creat()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Creat(NhaSanXuatModel nsx)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (nsx.pdcID == null)
                    {
                        ViewBag.message = "ID nhà sản xuất is null";
                        return View();
                    }

                    var itemDB = _dbContext.Producers.FirstOrDefault(x => x.pdcID == nsx.pdcID);
                    if (itemDB != null)
                    {
                        ViewBag.message = "Nhà sản xuất tồn tại";
                        return View();
                    }
                    var obj = new Producer();
                    obj.pdcID = nsx.pdcID;
                    obj.pdcName = nsx.pdcName;
                    obj.pdcPhone = nsx.pdcPhone;
                    obj.pdcEmail = nsx.pdcEmail;
                    obj.pdcAddress = nsx.pdcAddress;
                    obj.pdcInfo = nsx.pdcInfo;

                    _dbContext.Producers.Add(obj);

                    _dbContext.SaveChanges();

                    if (obj.pdcID != null)
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
            return RedirectToAction("Index", "NhaSanXuat");

        }
    }
}