using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Entities
{
    public class Musteri:BaseEntity
    {
        public int Id { get; set; }
        public short KimlikTurId { get; set; }
        public string KimlikNo { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string EPosta { get; set; }
        public string GSM { get; set; }
    }
}
