using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using bright_ideas.Models;

namespace bright_ideas.Controllers
{
    public class IdeasController : Controller
    {
        private IdeasContext _context;

        public IdeasController(IdeasContext context)
        {
            _context = context;
        }

        public bool LoggedIn()
        {
            if (HttpContext.Session.GetInt32("UserId") != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        [HttpGet]
        [Route("home")]
        public IActionResult Home()
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.User = _context.Users.Single(u => u.UserId == HttpContext.Session.GetInt32("UserId"));
                ViewBag.AllIdeas = _context.Ideas.Include(a => a.Likes).Include(b => b.User).OrderByDescending(c => c.Likes.Count).ToList();
                return View("Home");
            }
        }

        [HttpPost]
        [Route("addnew")]
        public IActionResult AddNew(IdeaViewModel model)
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                if (ModelState.IsValid)
                {
                    Idea NewIdea = new Idea
                    {
                        Description = model.Description,
                        UserId = (int)HttpContext.Session.GetInt32("UserId")
                    };
                    _context.Add(NewIdea);
                    _context.SaveChanges();
                    return RedirectToAction("Home");
                }
                ViewBag.User = _context.Users.Single(u => u.UserId == HttpContext.Session.GetInt32("UserId"));
                return View("Home", model);
            }
        }

        [HttpGet]
        [Route("like/{id}")]
        public IActionResult Like(int id)
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                User CurUser = _context.Users.SingleOrDefault(a => a.UserId == (int)HttpContext.Session.GetInt32("UserId"));
                Idea CurIdea = _context.Ideas.SingleOrDefault(a => a.IdeaId == id);
                Join NewJoin = new Join
                {
                    UserId = (int)HttpContext.Session.GetInt32("UserId"),
                    IdeaId = id
                };
                _context.Joins.Add(NewJoin);
                _context.SaveChanges();
                return RedirectToAction("Home");
            }
        }

        [HttpGet]
        [Route("idea/{id}")]
        public IActionResult Idea(int id)
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.User = _context.Users.SingleOrDefault(a => a.UserId == (int)HttpContext.Session.GetInt32("UserId"));
                ViewBag.Idea = _context.Ideas.Where(a => a.IdeaId == id).Include(d => d.User).Include(b => b.Likes).ThenInclude(c => c.User).SingleOrDefault();
                ViewBag.Likes = _context.Joins.Where(a => a.IdeaId == id).GroupBy(b => b.UserId).Select(c => c.FirstOrDefault()).Include(d => d.User).ToList();
                return View("Idea");
            }
        }

        [HttpGet]
        [Route("user/{id}")]
        public IActionResult UserInfo(int id)
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.CurUser = _context.Users.Where(a => a.UserId == id).Include(d => d.Ideas).Include(b => b.Likes).SingleOrDefault();
                return View("User");
            }
        }

        [HttpGet]
        [Route("delete/{id}")]
        public IActionResult Delete(int id)
        {
            if (!LoggedIn())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                List<Join> DelJoins = new List<Join>();
                DelJoins = _context.Joins.Where(a => a.IdeaId == id).ToList();
                foreach (var join in DelJoins)
                {
                    _context.Joins.Remove(join);
                    _context.SaveChanges();
                }
                Idea DeleteIdea = _context.Ideas.SingleOrDefault(a => a.IdeaId == id);
                _context.Ideas.Remove(DeleteIdea);
                _context.SaveChanges();
                return RedirectToAction("home");
            }
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
