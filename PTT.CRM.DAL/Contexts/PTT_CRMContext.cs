using Microsoft.EntityFrameworkCore;
using PTT.CRM.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.DAL.Contexts
{
    public class PTT_CRMContext:DbContext
    {
        public PTT_CRMContext(DbContextOptions options):base(options) 
        {
            
        }
        DbSet<Musteri> Musteri { get; set; }
        DbSet<Kullanici> Kullanici { get; set; }
    }
}
