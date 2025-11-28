package com.tejasandjava;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tejasandjava.entity.Book;
import com.tejasandjava.repo.BookRepository;

@Controller
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    // Load form
    @GetMapping("/bookForm")
    public String loadBookForm() {
        return "bookForm";  
    }

    // Search by ID
    @GetMapping("/search")
    public String searchBook(@RequestParam("bookId") int id, Model model) {
        Optional<Book> bookOpt = bookRepository.findById(id);
        if (bookOpt.isPresent()) {
            model.addAttribute("book", bookOpt.get());
        } else {
            model.addAttribute("msg", "❌ Book Not Found with ID: " + id);
        }
        return "bookForm";
    }

    // Add new book
    @PostMapping("/add")
    public String addBook(Book book, Model model) {
        bookRepository.save(book);
        model.addAttribute("msg", "✔ Book Added Successfully!");
        return "bookForm";
    }

    // Update existing book
    @PostMapping("/update")
    public String updateBook(Book book, Model model) {
        if (bookRepository.existsById(book.getId())) {
            bookRepository.save(book);
            model.addAttribute("msg", "✔ Book Updated Successfully!");
        } else {
            model.addAttribute("msg", "❌ Cannot Update — Book Not Found!");
        }
        return "bookForm";
    }

    // Delete book (POST for safety)
    @PostMapping("/delete")
    public String deleteBook(@RequestParam("bookId") int id, RedirectAttributes redirectAttrs) {
        if (bookRepository.existsById(id)) {
            bookRepository.deleteById(id);
            redirectAttrs.addFlashAttribute("msg", "🗑 Book Deleted Successfully!");
        } else {
            redirectAttrs.addFlashAttribute("msg", "❌ Cannot Delete — Book Not Found!");
        }
        return "redirect:/bookForm";  // redirect to avoid resubmission
    }
}
