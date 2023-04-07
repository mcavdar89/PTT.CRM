using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Model.Dtos
{
    public abstract class BaseResult
    {
        public BaseResult()
        {
            
        }

        public BaseResult(short status)
        {
            Status = status;
        }
        public BaseResult(short status, string mesaj) : this(status)
        {
            Mesaj = mesaj;
        }
        public BaseResult(short status, string mesaj,object data) : this(status,mesaj)
        {
            Data = data;
        }
        public BaseResult(object data) : this(1, "Başarılı")
        {
            Data = data;
        }
        public short Status { get; set; } //0 hatalı,1 başarılı
        public string Mesaj { get; set; }

        public object Data { get; set; }


    }
}
