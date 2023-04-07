using Core.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.DAL.Abstruct
{
    public interface IPTT_CRMRepository
    {
        public void Add<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        public void Update<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        public void Delete<TEntity>(TEntity entity) where TEntity : BaseEntity, new();
        void SaveChanges();

        public TEntity Get<TEntity>(Expression<Func<TEntity, bool>> fillter) where TEntity : BaseEntity, new();
        public List<TEntity> List<TEntity>(Expression<Func<TEntity, bool>> fillter = null) where TEntity : BaseEntity, new();
    }
}
