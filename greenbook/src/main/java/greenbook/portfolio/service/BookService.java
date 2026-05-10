package greenbook.portfolio.service;

import greenbook.portfolio.dao.BookDao;
import greenbook.portfolio.domain.BookDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
