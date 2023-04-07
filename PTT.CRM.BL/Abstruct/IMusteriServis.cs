using PTT.CRM.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.BL.Abstruct
{
    public interface IMusteriServis
    {
        List<Musteri> List(string? ad);
    }
}
