using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Entities
{
    public class HizmetTip : BaseEntity
    {
        public int Id { get; set; }
        public string Kod { get; set; }

        public virtual ICollection<Mesaj> Mesaj { get; set; }


    }
}
