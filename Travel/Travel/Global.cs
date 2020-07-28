using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travel
{
    public class Global
    {
        static string _importantData;
        static string _importantData1;
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
        public static string ImportantData1
        {
            get
            {
                return _importantData1;
            }
            set
            {
                _importantData1 = value;
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