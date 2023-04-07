using Core.Model.Entities;
using System.Linq.Expressions;

namespace PTT.CRM.DAL.Abstruct
{
    public interface IPTT_CRMRepository
    {
        void Add<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        void Update<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        void Delete<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        void SaveChanges();

        TEntity Get<TEntity>(Expression<Func<TEntity, bool>> fillter) where TEntity : BaseEntity, new();
        TDto GetToDto<TEntity, TDto>(Expression<Func<TEntity, bool>> fillter) where TEntity : BaseEntity, new();
        public List<TEntity> List<TEntity>(Expression<Func<TEntity, bool>> fillter = null) where TEntity : BaseEntity, new();
        List<TDto> ListToMap<TEntity, TDto>(Expression<Func<TEntity, bool>> fillter = null) where TEntity : BaseEntity, new();
    }
}
