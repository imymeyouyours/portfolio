package greenbook.portfolio.controller;

import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
import greenbook.portfolio.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class BookController {

    @Autowired
    BookService bookService;

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
}