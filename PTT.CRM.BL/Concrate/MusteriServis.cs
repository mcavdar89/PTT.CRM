using PTT.CRM.BL.Abstruct;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.Model.Entities;

namespace PTT.CRM.BL.Concrate
{
    public class MusteriServis : IMusteriServis
    {
        private readonly IPTT_CRMRepository _repository;
        public MusteriServis(IPTT_CRMRepository repository )
        {
            _repository = repository;
        }

        public List<Musteri> List(string? ad)
        {
            return _repository.List<Musteri>(d => String.IsNullOrEmpty(ad) || d.Ad.Contains(ad));
        }
    }
}
