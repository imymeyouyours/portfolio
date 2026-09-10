package greenbook.portfolio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class viewController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "/member/login";
    }

    @GetMapping("/find/id")
    public String findId() {
        return "/member/findid";
    }

    @GetMapping("/signup")
    public String signup() {
        return "/member/signup";
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "/member/mypage";
    }

    @GetMapping("/greenpoint")
    public String greenPoint() {
        return "/member/greenpoint";
    }

    @GetMapping("/memberinfo")
    public String memberinfo() {
        return "/member/memberinfo";
    }

    @GetMapping("/memberout")
    public String memberout() {
        return "/member/memberout";
    }

    @GetMapping("/catagory")
    public String catagory() {
        return "/book/catagory";
    }

    @GetMapping("/details")
    public String details() {
        return "/book/details";
    }

    @GetMapping("/cart")
    public String cart() {
        return "/order/cart";
    }

    @GetMapping("/payment")
    public String payment() {
        return "/order/payment";
    }

    @GetMapping("/find/pw")
    public String findpw() {
        return "/member/findpw";
    }

    // admin - 관리자 페이지
    @GetMapping("/publisherlist")
    public String publisherlist() {
        return "/admin/publisherlist";
    }

    @GetMapping("/publisher")
    public String publisher() {
        return "/admin/publisher";
    }

    @GetMapping("/publisherdetails")
    public String publisherDetails() {
        return "/admin/publisherdetails";
    }

    @GetMapping("/booklist")
    public String booklist() {
        return "/admin/booklist";
    }

    @GetMapping("/book")
    public String book() {
        return "/admin/book";
    }

    @GetMapping("/bookdetails")
    public String bookdetails() {
        return "/admin/bookdetails";
    }

    @GetMapping("/authorlist")
    public String authorlist() {
        return "/admin/authorlist";
    }

    @GetMapping("/authordetails")
    public String authordetails() {
        return "/admin/authordetails";
    }

    @GetMapping("/author")
    public String author() {
        return "/admin/author";
    }

    @GetMapping("/bookslist")
    public String bookslist() {
        return "/admin/bookslist";
    }

    @GetMapping("/booksdetails")
    public String booksdetails() {
        return "/admin/booksdetails";
    }

    @GetMapping("/books")
    public String books() {
        return "/admin/books";
    }

    @GetMapping("/registrationlist")
    public String registerationlist() {
        return "/admin/registrationlist";
    }

    @GetMapping("/registrationdetails")
    public String registrationdetails() {
        return "/admin/registrationdetails";
    }

    @GetMapping("/registration")
    public String registration() {
        return "/admin/registration";
    }
}
