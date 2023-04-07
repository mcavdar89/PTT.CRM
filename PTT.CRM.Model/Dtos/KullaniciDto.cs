using Core.Model.Dtos;
using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Dtos
{
    public class KullaniciDto:BaseDto
    {
        public int Id { get; set; }
        public string KullaniciAdi { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string EPosta { get; set; }


        public List<string> YetkiList { get; set; }
    }
}
