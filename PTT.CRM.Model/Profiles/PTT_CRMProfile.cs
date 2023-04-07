using AutoMapper;
using PTT.CRM.Model.Dtos;
using PTT.CRM.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Profiles
{
    public class PTT_CRMProfile:Profile
    {
        public PTT_CRMProfile()
        {
            CreateMap<Kullanici, KullaniciDto>();
            CreateMap<KullaniciDto, Kullanici>();
        }
    }
}
