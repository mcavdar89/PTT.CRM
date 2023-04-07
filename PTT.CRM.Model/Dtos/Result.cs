using Core.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.Model.Dtos
{
    public class Result : BaseResult
    {
        public Result()
        {
        }

        public Result(short status) : base(status)
        {
        }

        public Result(object data) : base(data)
        {
        }

        public Result(short status, string mesaj) : base(status, mesaj)
        {
        }

        public Result(short status, string mesaj, object data) : base(status, mesaj, data)
        {
        }
    }
}
