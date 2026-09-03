package greenbook.portfolio.controller;

import greenbook.portfolio.domain.PublisherDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.pagination.PageMaker;
import greenbook.portfolio.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class AdminController {

    @Autowired
    MemberService memberService;

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

}
