using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string publicKey = "PFJTQUtleVZhbHVlPjxNb2R1bHVzPnhkakRoM252eUNSbmFBaW93K1VPSFcyYlcrVEIwL3hSUmpvd1ZNZjhUREdJZUU3VG55YWIxblNXLzVUQlhheU41Y0x1cXB3MjlnVkdhQmZtNktOSFBBNEpDbWh6WnBBTHBCbVR5a2hOYWhXRmdwL1MwNTdMN2xERld1RzVIWWRoZEpPUERQZ0FNanFDNStzOWZoZnZKNXVvU09ha1pDZFZWejVGSHBBb054RT08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
            Auth.Authentication auth = new Auth.Authentication();
            auth.Url = "http://localhost/UOF_TaiMall"+"/PublicAPI/System/Authentication.asmx";
            string token= auth.GetToken(
                "ERP",
                RSAEncrypt(publicKey, "admin"),
                 RSAEncrypt(publicKey, "123456")
                );

            Console.WriteLine(token);

            WKF.Wkf wkf = new WKF.Wkf();
            wkf.Url = "http://localhost/UOF_TaiMall"+"/PublicAPI/WKF/Wkf.asmx";

            string result = wkf.GetFormList(token);

            Console.WriteLine(result);

        }

         /// <summary>
        /// RSA 加密
        /// </summary>
        /// <param name="privateKey"></param>
        /// <param name="crTexturlparam>
        /// <returns></returns>
        private static string RSAEncrypt(string publicKey, string crText)
        {

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            byte[] base64PublicKey = Convert.FromBase64String(publicKey);
            rsa.FromXmlString(System.Text.Encoding.UTF8.GetString(base64PublicKey));

            byte[] ctTextArray = Encoding.UTF8.GetBytes(crText);
            byte[] decodeBs = rsa.Encrypt(ctTextArray, false);

            return Convert.ToBase64String(decodeBs);
        }
    }
}
