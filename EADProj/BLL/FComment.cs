﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using EADProj.DLL;

namespace EADProj.BLL
{
    public class FComment
    {
        public string fcomment_id { get; set; }
        public string user_id { get; set; }
        public string comment { get; set; }
        public int votes { get; set; }
        public int post_id { get; set; }
        public string img { get; set; }

        public FComment()
        {

        }

        public FComment(string user_id, string comment, int votes, int post_id, string img)
        {
            // this.fcomment_id = fcomment_id;
            this.user_id = user_id;
            this.comment = comment;
            this.votes = votes;
            this.post_id = post_id;
            this.img = img;

        }

        public bool InsertFComment(string user_id, string comment, int votes, int post_id, string img)
        {
            FComment comment1 = new FComment(user_id, comment, votes, post_id, img);
            FCommentDAO dao = new FCommentDAO();

            dao.Insert(comment1);
            return true;

        }

        public int DelComment(int fcomment_id)
        {
            FCommentDAO dao = new FCommentDAO();
            return dao.DeleteComment(fcomment_id);
        }

        public int UpdVotes(int fcomment_id, int votes)
        {
            FCommentDAO dao = new FCommentDAO();
            return dao.UpdateVotes(fcomment_id, votes);
        }

    }

}