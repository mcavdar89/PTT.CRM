using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Entities
{
    public class Kurum:BaseEntity
    {
        public int Id { get; set; }
        public string VergiNo { get; set; }
        public string Ad { get; set; }
        public string Adres { get; set; }
        public short SehirId { get; set; }

        public Sehir Sehir { get; set; }

        public virtual ICollection<Mesaj> Mesaj { get; set; }

    }
}
