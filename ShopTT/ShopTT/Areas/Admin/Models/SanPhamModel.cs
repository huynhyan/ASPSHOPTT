using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTT.Areas.Admin.Models
{
    public class SanPhamModel
    {
        public string proID { get; set; }
        public Nullable<int> pdcID { get; set; }
        public Nullable<int> typeID { get; set; }
        public string proName { get; set; }
        public string proSize { get; set; }
        public string proPrice { get; set; }
        public Nullable<int> proDiscount { get; set; }
        public string proPhoto { get; set; }
        public string proUpdateDate { get; set; }
        public string proDescription { get; set; }
        public string typeName { get; set; }
        public string pdcName { get; set; }
    }
}