using AutoMapper;
using Core.Model.Entities;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.DAL.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.DAL.Concrate
{
    public class PTT_CRMRepository : IPTT_CRMRepository
    {
        private readonly PTT_CRMContext _context;

        private readonly IMapper _mapper;
        public PTT_CRMRepository(PTT_CRMContext context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }


        public void Add<TEntity>(TEntity entity) where TEntity : BaseEntity, new()
        {
            _context.Add(entity);
        }

        public void Update<TEntity>(TEntity entity) where TEntity : BaseEntity, new()
        {
            _context.Update(entity);
        }
        public void Delete<TEntity>(TEntity entity) where TEntity : BaseEntity, new()
        {
            _context.Remove(entity);
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public TEntity Get<TEntity>(Expression<Func<TEntity, bool>> fillter) where TEntity : BaseEntity, new()
        {
            return _context.Set<TEntity>().FirstOrDefault(fillter);

        }
        public TDto GetToDto<TEntity,TDto>(Expression<Func<TEntity, bool>> fillter) where TEntity : BaseEntity, new()
        {
            var result = _context.Set<TEntity>().Where(fillter);
            return _mapper.ProjectTo<TDto>(result).FirstOrDefault();


            //return _context.Set<TEntity>().FirstOrDefault(fillter);

        }
        public List<TEntity> List<TEntity>(Expression<Func<TEntity, bool>> fillter = null) where TEntity : BaseEntity, new()
        {
            return fillter == null ? 
                _context.Set<TEntity>().ToList() 
                : _context.Set<TEntity>().Where(fillter).ToList();
        }
        public List<TDto> ListToMap<TEntity,TDto>(Expression<Func<TEntity, bool>> fillter = null) where TEntity : BaseEntity, new()
        {
            var result = fillter == null ? _context.Set<TEntity>() : _context.Set<TEntity>().Where(fillter);
            return _mapper.ProjectTo<TDto>(result).ToList();

            
        }

    }
}
