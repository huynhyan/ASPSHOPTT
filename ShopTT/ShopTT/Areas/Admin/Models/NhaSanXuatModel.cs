using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTT.Areas.Admin.Models
{
    public class NhaSanXuatModel
    {
        public int pdcID { get; set; }
        public string pdcName { get; set; }
        public string pdcPhone { get; set; }
        public string pdcEmail { get; set; }
        public string pdcAddress { get; set; }
        public string pdcPhoto { get; set; }
        public string pdcInfo { get; set; }
    }
}