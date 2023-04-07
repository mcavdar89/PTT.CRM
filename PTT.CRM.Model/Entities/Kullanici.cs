using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Entities
{
    public class Kullanici:BaseEntity
    {
        public int Id { get; set; }
        public string KullaniciAdi { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string EPosta { get; set; }
    }
}
