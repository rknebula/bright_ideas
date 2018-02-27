using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using bright_ideas.Models;

namespace bright_ideas.Controllers
{
    public class HomeController : Controller
    {
        private IdeasContext _context;

        public HomeController(IdeasContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("")]
        public IActionResult Index()
        {
            if (HttpContext.Session.GetInt32("UserId") != null)
            {
                return RedirectToAction("Home", "Ideas");
            }
            else
            {
                return View("Index");
            }
        }

        [HttpPost]
        [Route("register")]
        public IActionResult Register(RegViewModel model)
        {
            if (HttpContext.Session.GetInt32("UserId") != null)
            {
                return RedirectToAction("Home", "Ideas");
            }

            if (ModelState.IsValid)
            {
                User ExistingUser = _context.Users.SingleOrDefault(u => u.Email == model.Email);
                if (ExistingUser != null)
                {
                    ViewBag.Message = "Email is already in use.";
                    return View("Index", model);
                }
                User NewUser = new User
                {
                    Name = model.Name,
                    Alias = model.Alias,
                    Email = model.Email,
                    Password = model.Password
                };
                PasswordHasher<User> Hasher = new PasswordHasher<User>();
                NewUser.Password = Hasher.HashPassword(NewUser, model.Password);
                _context.Add(NewUser);
                _context.SaveChanges();
                int UserId = _context.Users.Last().UserId;
                HttpContext.Session.SetInt32("UserId", UserId);
                return RedirectToAction("Home", "Ideas");
            }

            return View("Index", model);
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Login(LogViewModel LogUser)
        {
            if (HttpContext.Session.GetInt32("UserId") != null)
            {
                return RedirectToAction("Home", "Ideas");
            }

            User CurUser = _context.Users.SingleOrDefault(u => u.Email == LogUser.LogEmail);

            if (CurUser == null)
            {
                ViewBag.Message = "There is no user associated with this email.";
                return View("Index");
            }

            else
            {
                PasswordHasher<User> Hasher = new PasswordHasher<User>();
                if (Hasher.VerifyHashedPassword(CurUser, CurUser.Password, LogUser.LogPassword) == PasswordVerificationResult.Success)
                {
                    HttpContext.Session.SetInt32("UserId", CurUser.UserId);
                    return RedirectToAction("Home", "Ideas");
                }
                else
                // (Hasher.VerifyHashedPassword(CurUser, CurUser.Password, LogUser.LogPassword) != PasswordVerificationResult.Success)
                {
                    ViewBag.Message = "Password is invalid";
                    return View("Index");
                }
            }
        }

        [HttpGet]
        [Route("logout")]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
