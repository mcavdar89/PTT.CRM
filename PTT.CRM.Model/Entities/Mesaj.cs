using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Entities
{
    public class Mesaj:BaseEntity
    {
        public Guid Id { get; set; }
        public int MusteriId { get; set; }
        public int? KurumId { get; set; }
        public short MesajTurId { get; set; }
        public short HizmetTipId { get; set; }
        public short? HizmetTipAltId { get; set; }
        public string Icerik { get; set; }
        public string? IpAdress { get; set; }
        public short MesajDurumId { get; set; }

        public DateTime? OlusturmaTarih { get; set; }

        public virtual Musteri Musteri { get; set; }
        public virtual Kurum? Kurum { get; set; }

        //[ForeignKey("MesajTurId")]
        public virtual MesajTur MesajTur { get; set; }
        //[ForeignKey("HizmetTipId")]
        public virtual HizmetTip HizmetTip { get; set; }
        //[ForeignKey("HizmetTipAltId")]
        public virtual HizmetTipAlt? HizmetTipAlt { get; set; }
        [ForeignKey("MesajDurumId")]
        public virtual MesajDurum MesajDurum { get; set; }
    }
}
