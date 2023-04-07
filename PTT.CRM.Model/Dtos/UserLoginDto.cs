using Core.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Dtos
{
    public class UserLoginDto:BaseDto
    {
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
    }
}
