using Core.Model.Dtos;
using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Dtos
{
    public class MesajDto : BaseDto
    {
        public Guid Id { get; set; }
        public int MusteriId { get; set; }
        public string MusteriAd { get; set; }
        public string MusteriSoyad { get; set; }

        public int KurumId { get; set; }
        public string KurumAd { get; set; }
        public short MesajTurId { get; set; }
        public string MesajTurKod { get; set; }
        public short HizmetTipId { get; set; }
        public string HizmetTipKod { get; set; }
        public short HizmetTipAltId { get; set; }
        public string HizmetTipAltKod { get; set; }
        public string Icerik { get; set; }
        public string IpAdress { get; set; }
        public short MesajDurumId { get; set; }
        public string MesajDurumKod { get; set; }

        public DateTime OlusturmaTarih { get; set; }
        
    }
}
