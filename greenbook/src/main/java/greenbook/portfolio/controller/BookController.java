package greenbook.portfolio.controller;

import greenbook.portfolio.domain.AuthorDto;
import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.domain.RegistrationDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
import greenbook.portfolio.service.BookService;
import greenbook.portfolio.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class BookController {

    @Autowired
    BookService bookService;

    @Autowired
    MemberService memberService;

    @GetMapping("/catagory")
    public ResponseEntity<Map<String, Object>> catagory(
            @RequestParam String re_catagory,
            Criteria cri) {

        cri.setPerPageNum(5);

        PageMaker pm = new PageMaker();
        pm.setCriteria(cri);
        pm.setDisplayPageNum(5);

        int totalCount =
                bookService.getTotalCountCatagory(re_catagory, cri);

        pm.setTotalCount(totalCount);
        pm.calcData();
        List<BookDto> registration =
                bookService.getRegistration(re_catagory, cri);

        Map<String, Object> result = new HashMap<>();
        result.put("registration", registration);
        result.put("pm", pm);

        return ResponseEntity.ok(result);
    }

    @GetMapping("/details")
    public ResponseEntity<Map<String, Object>> details(
            @RequestParam BigInteger re_bk_isbn) {

        BookDto book =
                bookService.getBookDetails(re_bk_isbn);

        List<AuthorDto> author =
                memberService.getAuthorList(re_bk_isbn);

        RegistrationDto regi = bookService.getRegi(re_bk_isbn);

        Map<String, Object> result =
                new HashMap<>();

        result.put("book", book);
        result.put("author", author);
        result.put("regi", regi);

        return ResponseEntity.ok(result);
    }
}