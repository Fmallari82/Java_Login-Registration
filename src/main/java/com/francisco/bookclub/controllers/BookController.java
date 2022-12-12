package com.francisco.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.francisco.bookclub.models.Book;
import com.francisco.bookclub.models.User;
import com.francisco.bookclub.services.BookService;
import com.francisco.bookclub.services.UserService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	private final BookService bookServ;
	private final UserService userServ;
	public BookController(BookService bookServ, UserService userServ) {
		this.bookServ = bookServ;
		this.userServ = userServ;
	}
	
	@GetMapping ("/create")
	public String createBook( @ModelAttribute("book") Book book, HttpSession session) {
		//must be logged in to access directory
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		return "books/create.jsp";
	}
	
	@PostMapping("/create")
	public String processCreateBook(
			@Valid
			@ModelAttribute("book") Book book,
			BindingResult result){
		
		if(result.hasErrors()) {
			return "books/create.jsp";
		}
		bookServ.create(book);
		return "redirect:/books";
	}
	@GetMapping("/edit/{id}")
	public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		//must be logged in to access directory
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Book book = bookServ.getOne(id);
		model.addAttribute("book", book);
		return "books/edit.jsp";
	}
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/books";
	}
	@PutMapping("/edit/{id}")
	public String processEditBook(
			@PathVariable("id") Long id, 
			@Valid
			@ModelAttribute("book") Book book,
			BindingResult result) {
		if(result.hasErrors()) {
			return "books/edit.jsp";
		}
		bookServ.update(book);
		return "redirect:/books";
	}
	@GetMapping("/view/{id}")
	public String viewBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		//must be logged in to access directory
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Book book = bookServ.getOne(id);
		model.addAttribute("book", book);
    	User user = userServ.getUser((Long)session.getAttribute("user_id"));
    	model.addAttribute("user", user);
		return "books/show.jsp";
	}
}