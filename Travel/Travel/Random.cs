using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Travel
{
    public class Random
    {
        public static string link;
        public static string randomNumber;
        public static System.Random rnd = new System.Random();
        public Random()
        {
            Init();
        }

        public void Init()
        {
            const int MAXIMUM_LINK_ATTEMPTS = 10000;
            bool includeLowercase = true;
            bool includeUppercase = true;
            bool includeNumeric = true;
            bool includeSpecial = false;
            int lengthOfLink = 16;
            LinkGeneratorSettings settings = new LinkGeneratorSettings(includeLowercase, includeUppercase, includeNumeric, includeSpecial, lengthOfLink);

            if (!settings.IsValidLength())
            {
                link = settings.LengthErrorMessage();
            }
            else
            {
                int LinkAttempts = 0;
                do
                {
                    link = LinkGenerator.GenerateLink(settings);
                    LinkAttempts++;
                    ////string rem = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    //string codeVal = link.Substring(0, 6);
                    ////code = link.Remove(link.Length - 3, 3);
                }
                while (LinkAttempts < MAXIMUM_LINK_ATTEMPTS && !LinkGenerator.LinkIsValid(settings, link));
                link = LinkGenerator.LinkIsValid(settings, link) ? link : "Try again";
                randomNumber = rnd.Next(100000, 900000).ToString();

            }
            Console.WriteLine(link);
            Console.WriteLine(randomNumber);
        }
    }
    public class LinkGeneratorSettings
    {
        const string LOWERCASE_CHARACTERS = "abcdefghijklmnopqrstuvwxyz";
        const string UPPERCASE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const string NUMERIC_CHARACTERS = "0123456789";
        const string SPECIAL_CHARACTERS = @"!#$%&*@\";
        const int LINK_LENGTH_MIN = 8;
        const int LINK_LENGTH_MAX = 128;
        public bool IncludeLowercase { get; set; }
        public bool IncludeUppercase { get; set; }
        public bool IncludeNumbers { get; set; }
        public bool IncludeSpecial { get; set; }
        public int LinkLength { get; set; }
        public string CharacterSet { get; set; }
        public int MaximumAttempts { get; set; }
        public LinkGeneratorSettings(bool includeLowercase, bool includeUppercase, bool includeNumbers, bool includeSpecial, int linkLength)
        {
            IncludeLowercase = includeLowercase;
            IncludeUppercase = includeUppercase;
            IncludeNumbers = includeNumbers;
            IncludeSpecial = includeSpecial;
            LinkLength = linkLength;
            StringBuilder characterSet = new StringBuilder();
            if (includeLowercase)
            {
                characterSet.Append(LOWERCASE_CHARACTERS);
            }
            if (includeUppercase)
            {
                characterSet.Append(UPPERCASE_CHARACTERS);
            }
            if (includeNumbers)
            {
                characterSet.Append(NUMERIC_CHARACTERS);
            }
            if (includeSpecial)
            {
                characterSet.Append(SPECIAL_CHARACTERS);
            }
            CharacterSet = characterSet.ToString();
        }

        public bool IsValidLength()
        {
            return LinkLength >= LINK_LENGTH_MIN && LinkLength <= LINK_LENGTH_MAX;
        }

        public string LengthErrorMessage()
        {
            return string.Format("Password length must be between {0} and {1} characters", LINK_LENGTH_MIN, LINK_LENGTH_MAX);
        }
    }
    public static class LinkGenerator
    {
        public static string GenerateLink(LinkGeneratorSettings settings)
        {
            const int MAXIMUM_IDENTICAL_CONSECUTIVE_CHARS = 2;
            char[] password = new char[settings.LinkLength];
            int characterSetLength = settings.CharacterSet.Length;
            System.Random random = new System.Random();
            for (int characterPosition = 0; characterPosition < settings.LinkLength; characterPosition++)
            {
                password[characterPosition] = settings.CharacterSet[random.Next(characterSetLength - 1)];
                bool moreThanTwoIdenticalInARow = characterPosition > MAXIMUM_IDENTICAL_CONSECUTIVE_CHARS && password[characterPosition] == password[characterPosition - 1] && password[characterPosition - 1] == password[characterPosition - 2];
                if (moreThanTwoIdenticalInARow)
                {
                    characterPosition--;
                }
            }
            return string.Join(null, password);
        }

        //Summary
        public static bool LinkIsValid(LinkGeneratorSettings settings, string password)
        {
            const string REGEX_LOWERCASE = @"[a-z]";
            const string REGEX_UPPERCASE = @"[A-Z]";
            const string REGEX_NUMERIC = @"[\d]";
            const string REGEX_SPECIAL = @"([!#$%&*@\\])+";
            bool lowerCaseIsValid = !settings.IncludeLowercase || (settings.IncludeLowercase && Regex.IsMatch(password, REGEX_LOWERCASE));
            bool upperCaseIsValid = !settings.IncludeUppercase || (settings.IncludeUppercase && Regex.IsMatch(password, REGEX_UPPERCASE));
            bool numericIsValid = !settings.IncludeNumbers || (settings.IncludeNumbers && Regex.IsMatch(password, REGEX_NUMERIC));
            bool symbolsAreValid = !settings.IncludeSpecial || (settings.IncludeSpecial && Regex.IsMatch(password, REGEX_SPECIAL));
            return lowerCaseIsValid && upperCaseIsValid && numericIsValid && symbolsAreValid;
        }
    }
}