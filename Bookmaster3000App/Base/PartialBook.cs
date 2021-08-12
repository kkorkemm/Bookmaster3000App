using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bookmaster3000App.Base
{
    partial class Books
    {
        public string AuthorList
        {
            get
            {
                var authors = Authors.ToList();
                string list = "";
                int count = authors.Count;

                if (count > 0)
                {
                    for (int i = 0; i < count - 1; i++)
                    {
                        list += authors[i].Name.ToString() + ", ";
                    }
                    list += authors[count - 1].Name.ToString();
                }
                

                return list;
            }
        } 

        public string SubjectList
        {
            get
            {
                var subjects = BookSubjects.ToList();
                int count = subjects.Count;
                string list = "";

                if (count > 0)
                {
                    for (int i = 0; i < count - 1; i++)
                    {
                        list += subjects[i].Subject.ToString() + ", ";
                    }
                    list += subjects[count - 1].Subject.ToString();
                }

                

                return list;
            }
        }
    }
}
