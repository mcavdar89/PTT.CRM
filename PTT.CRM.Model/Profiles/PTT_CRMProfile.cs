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

            CreateMap<Mesaj, MesajDto>()
               .ForMember(dest => dest.MusteriAd, opts => opts.MapFrom(src => src.Musteri.Ad))
               .ForMember(dest => dest.MusteriSoyad, opts => opts.MapFrom(src => src.Musteri.Soyad))
               .ForMember(dest => dest.KurumAd, opts => opts.MapFrom(src => src.Kurum.Ad))
               .ForMember(dest => dest.MesajTurKod, opts => opts.MapFrom(src => src.MesajTur.Kod))
               .ForMember(dest => dest.HizmetTipKod, opts => opts.MapFrom(src => src.HizmetTip.Kod))
               .ForMember(dest => dest.HizmetTipAltKod, opts => opts.MapFrom(src => src.HizmetTipAlt.Kod))
               .ForMember(dest => dest.MesajDurumKod, opts => opts.MapFrom(src => src.MesajDurum.Kod))
                ;


        }
    }
}
