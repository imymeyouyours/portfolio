package greenbook.portfolio.controller;

import greenbook.portfolio.domain.AuthorDto;
import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.domain.BooksDto;
import greenbook.portfolio.domain.PublisherDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
import greenbook.portfolio.service.BookService;
import greenbook.portfolio.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class AdminController {

    @Autowired
    MemberService memberService;

    @Autowired
    BookService bookService;

    @GetMapping("/publisherlist")
    public ResponseEntity<Map<String, Object>> publisherList(Criteria cri) {

        Map<String, Object> map = new HashMap<>();

        try {
            cri.setPerPageNum(5);

            PageMaker pm = new PageMaker();
            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount = memberService.getTotalCountPublish(cri);

            pm.setTotalCount(totalCount);
            pm.calcData();

            List<PublisherDto> publish =
                    memberService.getPublisherList(cri);

            map.put("publish", publish);
            map.put("pm", pm);

            return ResponseEntity.ok(map);

        } catch (Exception e) {
            e.printStackTrace();

            map.put("message", "출판사 목록을 불러오는데 실패했습니다.");

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(map);
        }
    }


    @PostMapping("/publisher")
    public ResponseEntity<Map<String, Object>> publisherPost(
            @RequestBody PublisherDto publisher) {

        Map<String, Object> result = new HashMap<>();

        try {
            boolean isPubRegister =
                    memberService.pubRegister(publisher);

            if (!isPubRegister) {
                result.put("success", false);
                result.put("message", "출판사 등록에 실패했습니다.");

                return ResponseEntity
                        .badRequest()
                        .body(result);
            }

            result.put("success", true);
            result.put("message", "출판사가 등록되었습니다.");

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();

            result.put("success", false);
            result.put("message", "출판사 등록 중 오류가 발생했습니다.");

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(result);
        }
    }

    @GetMapping("/booklist")
    public ResponseEntity<Map<String, Object>> bookList(Criteria cri) {

        Map<String, Object> result = new HashMap<>();

        try {
            cri.setPerPageNum(5);

            PageMaker pm = new PageMaker();
            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount = bookService.getTotalCount(cri);

            pm.setTotalCount(totalCount);
            pm.calcData();

            List<BookDto> list = bookService.getBookList(cri);

            result.put("list", list);
            result.put("pm", pm);

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();

            result.put("message", "도서 목록을 불러오는데 실패했습니다.");

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(result);
        }
    }

    @PostMapping("/book")
    public ResponseEntity<Boolean> adminBookPost(
            BookDto book,
            @RequestParam("file") MultipartFile file) {

        boolean isBookRegister = bookService.bookRegister(book, file);

        if (isBookRegister) {
            return ResponseEntity.ok(true);
        }

        return ResponseEntity.badRequest().body(false);
    }


    @GetMapping("/bookdetails")
    public ResponseEntity<BookDto> bookDetails(
            @RequestParam("bk_isbn") BigInteger bk_isbn) {

        try {

            BookDto book = bookService.getBookDetails(bk_isbn);

            if (book == null) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(book);

        } catch (Exception e) {
            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

    @PostMapping("/bookdetails")
    public ResponseEntity<Boolean> modifyBookPost(
            BookDto book,
            @RequestParam(value = "file", required = false) MultipartFile file) {

        int result = bookService.updateBook(book, file);

        if (result > 0) {
            return ResponseEntity.ok(true);
        }

        return ResponseEntity.badRequest().body(false);
    }


    @GetMapping("/authorlist")
    public ResponseEntity<Map<String, Object>> authorList(Criteria cri) {

        try {

            cri.setPerPageNum(5);

            PageMaker pm = new PageMaker();
            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount =
                    memberService.getTotalCountAuthor(cri);

            pm.setTotalCount(totalCount);
            pm.calcData();

            List<AuthorDto> author =
                    memberService.authorList(cri);

            Map<String, Object> result = new HashMap<>();

            result.put("author", author);
            result.put("pm", pm);

            return ResponseEntity.ok(result);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

    @GetMapping("/authordetails")
    public ResponseEntity<AuthorDto> authorDetails(
            @RequestParam("au_num") Integer au_num) {

        try {

            AuthorDto author =
                    memberService.getAuthor(au_num);

            if (author == null) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok(author);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

    @PostMapping("/authordetails")
    public ResponseEntity<Boolean> modifyAuthPost(
            AuthorDto author) {

        try {

            int result =
                    memberService.updateAuth(author);

            if (result > 0) {
                return ResponseEntity.ok(true);
            }

            return ResponseEntity
                    .badRequest()
                    .body(false);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(false);
        }
    }

    @PostMapping("/author")
    public ResponseEntity<Boolean> authorPost(AuthorDto author) {

        try {

            int result =
                    memberService.authRegister(author);

            if (result > 0) {
                return ResponseEntity.ok(true);
            }

            return ResponseEntity
                    .badRequest()
                    .body(false);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(false);
        }
    }


    @GetMapping("/bookslist")
    public ResponseEntity<Map<String, Object>> booksList(Criteria cri) {

        try {

            cri.setPerPageNum(5);

            PageMaker pm = new PageMaker();
            pm.setCriteria(cri);
            pm.setDisplayPageNum(5);

            int totalCount =
                    memberService.getTotalCountBooks();

            pm.setTotalCount(totalCount);
            pm.calcData();

            List<BooksDto> books =
                    memberService.getbooksList(cri);

            Map<String, Object> result =
                    new HashMap<>();

            result.put("books", books);
            result.put("pm", pm);

            return ResponseEntity.ok(result);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

    @GetMapping("/booksdetails")
    public ResponseEntity<BooksDto> booksDetails(
            @RequestParam("bs_num") Integer bs_num) {

        try {

            BooksDto books =
                    memberService.getBooks(bs_num);

            if (books == null) {
                return ResponseEntity
                        .notFound()
                        .build();
            }

            return ResponseEntity.ok(books);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

    @PostMapping("/booksdetails")
    public ResponseEntity<Boolean> booksDetailsPost(
            BooksDto books) {

        try {

            int result =
                    memberService.updateBooks(books);

            if (result > 0) {
                return ResponseEntity.ok(true);
            }

            return ResponseEntity
                    .badRequest()
                    .body(false);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(false);
        }
    }

    @PostMapping("/books")
    public ResponseEntity<Boolean> booksPost(BooksDto books) {

        try {

            int result =
                    memberService.booksRegi(books);

            if (result > 0) {
                return ResponseEntity.ok(true);
            }

            return ResponseEntity
                    .badRequest()
                    .body(false);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(false);
        }
    }

}
