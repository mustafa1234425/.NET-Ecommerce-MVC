﻿using ClickNBuy.Data;
using ClickNBuy.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace ClickNBuy.Controllers
{
    public class AdminController : Controller
    {
        ApplicationDbContext db = new ApplicationDbContext();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(tbl_admin adm)
        {
            tbl_admin ad = db.tbl_admin.Where(x => x.ad_name == adm.ad_name && x.ad_password == adm.ad_password).SingleOrDefault();
            if (ad!=null)
            {
                Session["ad_id"] = ad.ad_id.ToString();
                Session["ad_name"] = ad.ad_name;
                TempData["ToastMessage"] = "Hi, " + ad.ad_name + " You Successfully Logged In!";
                return RedirectToAction("Admin_Panel");
            }
            else
            {
                ViewBag.Error = "Invalid Username or Password";
            }
            return View();
        }

        [HttpGet]
        public ActionResult Admin_Panel()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login");
            }

            var userInvoices = (from u in db.tbl_user
                                join i in db.tbl_invoice on u.u_id equals i.in_fk_user
                                select new UserInvoiceViewModel
                                {
                                    in_id = (int)i.in_id,
                                    u_id = (int)u.u_id,
                                    u_name = u.u_name,
                                    in_totallbill = (int)i.in_totalbill,
                                    in_date = (DateTime)i.in_date
                                }).ToList();

            var products = db.tbl_product.ToList();
            var orders = db.tbl_order.ToList();

            ViewBag.Orders = orders;
            ViewBag.UserInvoices = userInvoices;
            ViewBag.Products = products;
            ViewBag.ToastMessage = TempData["ToastMessage"];

            int totalOrders = orders.Count;
            ViewBag.TotalOrders = totalOrders;

            int totalProducts = products.Count;
            ViewBag.totalProducts = totalProducts;

            return View();
        }


        [HttpGet]
        public ActionResult Add_Category()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Add_Category(tbl_category cat, HttpPostedFileBase imgfile)
        {
            tbl_admin ad = new tbl_admin();
            string path = uploadimage(imgfile);
            if (path.Equals(-1))
            {
                ViewBag.Error = "Image Couldn't Uploaded Try Again";
            }
            else
            {
                tbl_category ca = new tbl_category();
                ca.cat_name = cat.cat_name;
                ca.cat_image = path;
                ca.cat_status = 1;
                ca.ad_id_fk = Convert.ToInt32(Session["ad_id"].ToString());
                db.tbl_category.Add(ca);
                db.SaveChanges();
                return RedirectToAction("View_Category");
            }
            return View();
        }

        public ActionResult View_Category(int? page)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login");
            }

            int pageSize = 6;
            int pageIndex = 1;

            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;

            var list = db.tbl_category.Where(x => x.cat_status == 1).OrderByDescending(x => x.cat_id).ToList();
            IPagedList<tbl_category> cateList = list.ToPagedList(pageIndex, pageSize);

            return View(cateList);
        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            tbl_category ca = db.tbl_category.Where(x => x.cat_id == id).SingleOrDefault();
            return View(ca);
        }

        [HttpPost]
        public ActionResult Delete(int? id, tbl_category cat)
        {
            tbl_category ca = db.tbl_category.Where(x => x.cat_id == id).SingleOrDefault();
            db.tbl_category.Remove(ca);
            db.SaveChanges();
            return RedirectToAction("View_Category");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult Edit_Category(int id)
        {
            tbl_category category = db.tbl_category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        [HttpPost]
        public ActionResult Save_Category(tbl_category category, HttpPostedFileBase imgfile)
        {
            string path = uploadimage(imgfile);
            if (path.Equals(-1))
            {
                ViewBag.Error = "Image Couldn't Uploaded Try Again";
            }
            else
            {
                tbl_category ca = db.tbl_category.Find(category.cat_id);
                ca.cat_name = category.cat_name;
                if (imgfile != null)
                {
                    ca.cat_image = path;
                }
                db.SaveChanges();
                return RedirectToAction("View_Category");
            }
            return View(category);
        }

        public ActionResult ViewAllProducts()
        {

            List<tbl_product> pro_list = db.tbl_product.ToList();

            List<ProductViewModel> pvm_list = pro_list.Select(x => new ProductViewModel
            {
                cat_id = x.tbl_category.cat_id,
                cat_name = x.tbl_category.cat_name,
                pro_id = x.pro_id,
                pro_name = x.pro_name,
                pro_desc = x.pro_desc,
                pro_price = x.pro_price,
                pro_image = x.pro_image,
                u_id = x.tbl_user.u_id,
                u_name = x.tbl_user.u_name,
            }
            ).ToList();

            return View(pvm_list);
        }

        public ActionResult RegisteredUser()
        {
            List<tbl_user> user_list = db.tbl_user.ToList();
            return View(user_list);
        }

        public string uploadimage(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {
                        path = Path.Combine(Server.MapPath("~/Content/upload"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/Content/upload/" + random + Path.GetFileName(file.FileName);
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please select a file'); </script>");
                path = "-1";

            }
            return path;
        }
    }
}