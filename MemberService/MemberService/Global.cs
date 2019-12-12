using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MemberSignature
{
    public class Global
    {

        static string _importantData;
        static List<string> _dataList;
        public static string ImportantData
        {
            get
            {
                return _importantData;
            }
            set
            {
                _importantData = value;
            }
        }

        public static List<string> dataList
        {
            get
            {
                return _dataList;
            }
            set
            {
                _dataList = value;
            }
        }
    }
}