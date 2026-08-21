package greenbook.portfolio.service;

import greenbook.portfolio.dao.BookDao;
import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.domain.RegistrationDto;
import greenbook.portfolio.pagination.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookService {

    @Autowired
    BookDao bookDao;

    public List<BookDto> getChoice() {
        return bookDao.getChoice();
    }

    public BookDto getBookToday() {
        return bookDao.getBookTody();
    }

    public List<BookDto> getBestSeller() {
        return bookDao.getBestSeller();
    }

    public List<BookDto> getRegistration(
            String reCatagory,
            Criteria cri) {

        return bookDao.getRegistration(reCatagory, cri);
    }

    public int getTotalCountCatagory(
            String reCatagory,
            Criteria cri) {

        return bookDao.getTotalCountCatagory(
                reCatagory,
                cri
        );
    }

    public BookDto getBookDetails(BigInteger re_bk_isbn) {
        return bookDao.getBookDetails(re_bk_isbn);
    }

    public RegistrationDto getRegi(BigInteger re_bk_isbn) {
        return bookDao.getRegi(re_bk_isbn);
    }

}
