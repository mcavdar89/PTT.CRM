using PTT.CRM.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.BL.Abstruct
{
    public interface IMesajServis
    {
        Result ListMesaj();
        Result KaydetMesaj(MesajDto item);
    }
}
