using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EADProj.DLL;

namespace EADProj.BLL
{
    public class User
    {
        public string id { get; set; }
        public string name { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public bool emailVerified { get; set; }
        public string hash { get; set; }
        public string imageURL { get; set; }

        public User()
        {

        }

        public User(string Id, string Name, string Password, string Email, bool emailVerified, string hash)
        {
            this.id = Id;
            this.name = Name;
            this.password = Password;
            this.email = Email;
            this.emailVerified = emailVerified;
            this.hash = hash;
        }

        public User(string Id, string Name, string Password, string Email, bool emailVerified)
        {
            this.id = Id;
            this.name = Name;
            this.password = Password;
            this.email = Email;
            this.emailVerified = emailVerified;
        }

        public User(string Id, string Name, string Password, string Email)
        {
            this.id = Id;
            this.name = Name;
            this.password = Password;
            this.email = Email;
        }

        public User(string Name, string Email, string ImageURL, bool emailVerified)
        {
            this.name = Name;
            this.email = Email;
            this.imageURL = ImageURL;
            this.emailVerified = emailVerified;
        }

        public User(string Name, string Email, string Password)
        {
            this.name = Name;
            this.email = Email;
            this.password = Password;
        }

        public bool InsertUser(string name, string email, string password)
        {
            User u1 = new User(name, email, password);
            UserDAO dao = new UserDAO();

            if (dao.CheckByEmail(email) == false)
            {
                dao.Insert(u1);
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool CheckUserByEmail(string email)
        {
            UserDAO dao = new UserDAO();
            if (dao.CheckByEmail(email))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool loginUserCheck(string email, string password)
        {
            UserDAO dao = new UserDAO();
            if (dao.CheckUserLogin(email: email, password: password))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public User GetUserByHash(string hash)
        {
            UserDAO dao = new UserDAO();
            return dao.GetUserByHash(hash);
        }

        public User GetUserByEmail(string email)
        {
            UserDAO dao = new UserDAO();
            return dao.GetUserByEmail(email);
        }

        public void VerifyUser(string email)
        {
            UserDAO dao = new UserDAO();
            dao.VerifyUser(email);
        }

        public User OAuthLogin(string name, string email, string imageURL)
        {
            User u1 = new User(name, email, imageURL, true);

            UserDAO dao = new UserDAO();
            return dao.oauthLogin(u1);
        }

        public bool checkOauthUser(string email)
        {
            UserDAO dao = new UserDAO();
            return dao.checkOauthUser(email);
        }

    }
}