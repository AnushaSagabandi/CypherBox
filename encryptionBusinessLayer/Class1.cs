using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BO;
using System.Data;
using System.Data.SqlTypes;


namespace encryptionBusinessLayer
{
    public class clsXor1
    {
        public static string _b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk.mnopqrstuvwxyz-123456789+/=";

        public string encryption(string data,string key)
        {
            

            int keypos = 0;
            string binarydata = "";

            foreach (char c in data)
            {
                int xor = ((int)c ^ (int)key[keypos]) + (key.Length);

                if (++keypos >= key.Length)
                    keypos = 0;

                binarydata += DecToBinary(xor, 8);
            }


            int m = 0;
            string cipher = "";
            // splitt the binary string to 4 byte chunks and assign each chunk the proper b64 value
            for (int i = 0; i < binarydata.Length; i += 4)
            {
                int v = BinToDec(binarydata.Substring(i, 4));
                cipher += GetB64FromN(v * 4 + m);

                if (++m > 3)
                    m = 0;
            }

             
            return cipher;
        }

        public string decryption(string data,string key)
        {
            
            int m = 0;
            string binarydata = "";
            // convert the b64 string to binary string
            foreach (char c in data)
            {
                int v = (GetNFromB64(c) - m) / 4;
                binarydata += DecToBinary(v, 4);
                Console.WriteLine("{0}", DecToBinary(v, 4));
                if (++m > 3)
                    m = 0;
            }

            // chop the 8bit binaries and mix back the key into it
            int keypos = 0;
            string decoded = "";
            for (int i = 0; i < binarydata.Length; i += 8)
            {
                if (i + 8 > binarydata.Length)
                    break;
                int c = BinToDec(binarydata.Substring(i, 8));
                int dc = (c - key.Length) ^ (int)key[keypos];
               
                if (++keypos >= key.Length)
                    keypos = 0;

                decoded += new string((char)dc, 1);
            }
            return decoded;
        }
        private static string GetB64FromN(int n)
        {
            if (n > _b64.Length)
                return "="; // well, we shouldn't reach this line. If we do, the encoding will be garbage anyway...

            return new string(_b64[n], 1);
        }

        private static int GetNFromB64(char n)
        {
            return _b64.IndexOf(n);
        }


        private static string DecToBinary(int value, int length)
        {
            // Declare a few variables we're going to need
            string binString = "";

            while (value > 0)
            {
                binString += value % 2;
                value /= 2;
            }

            // we need to reverse the binary string
            // that's why we are using this array stuff here.

            string reverseString = "";
            foreach (char c in binString)
                reverseString = new string((char)c, 1) + reverseString;
            binString = reverseString;

            // do the padding here
            binString = new string((char)'0', length - binString.Length) + binString;

            return binString;
        }

        private static int BinToDec(string Binary)
        {
            return Convert.ToInt32(Binary, 2);
        }

     


    }
}
