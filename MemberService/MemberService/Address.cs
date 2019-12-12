﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Script.Serialization;

namespace MemberSignature
{
    public class Address
    {
        public string IPAddress { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public string CityName { get; set; }
        public string RegionName { get; set; }
        public string ZipCode { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string TimeZone { get; set; }

    }
}