package greenbook.portfolio.controller;

import java.math.BigInteger;
import java.text.DateFormat;
import java.util.*;

import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/api")
public class HomeController {

    @Autowired
    BookService bookService;

    @GetMapping("/home")
    public List<BookDto> bookChoice() {
        return bookService.getChoice();
    }

    @GetMapping("/today")
    public BookDto bookToday() {
        return bookService.getBookToday();
    }

    @GetMapping("/best")
    public List<BookDto> bestSeller() {
        System.out.println("bookService.getBestSeller() = " + bookService.getBestSeller());
        return bookService.getBestSeller();
    }

}
