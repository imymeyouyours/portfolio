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

}
