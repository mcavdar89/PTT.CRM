using AutoMapper;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.Model.Dtos;
using PTT.CRM.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.BL.Concrate
{
    public class MesajServis : IMesajServis
    {
        private readonly IPTT_CRMRepository _repository;
        private readonly IMapper _mapper;
        public MesajServis(IPTT_CRMRepository repository,IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
        public Result ListMesaj()
        {
            var data = _repository.ListToMap<Mesaj, MesajDto>();
            return new Result(data);
        }


        public Result KaydetMesaj(MesajDto item)
        {
            var kayit = _mapper.Map<Mesaj>(item);
            _repository.Add(kayit);
            _repository.SaveChanges();  
            item.Id = kayit.Id; 
            return new Result(item);
        }
    }
}
