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

        public User()
        {

        }

        public User(string Id, string Name, string Password, string Email)
        {
            this.id = Id;
            this.name = Name;
            this.password = Password;
            this.email = Email;
        }

        public User(string Name, string Password, string Email)
        {
            this.name = Name;
            this.password = Password;
            this.email = Email;
        }

        public bool InsertUser(string name, string email, string password)
        {
            User u1 = new User(name, password, email);
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

        public User GetUserByEmail(string email)
        {
            UserDAO dao = new UserDAO();
            return dao.GetUserByEmail(email);
        }

    }
}