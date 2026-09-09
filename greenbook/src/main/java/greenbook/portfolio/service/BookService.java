package greenbook.portfolio.service;

import greenbook.portfolio.dao.BookDao;
import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.domain.RegistrationDto;
import greenbook.portfolio.pagination.Criteria;
import greenbook.portfolio.utils.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.awt.print.Book;
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

    public int getTotalCount(Criteria cri) {
        return bookDao.getTotalCount(cri);
    }

    public List<BookDto> getBookList(Criteria cri) {
        return bookDao.getBookList(cri);
    }

    private String uploadPath =
            "/Users/apache-tomcat-9.0.117/webapps/img";

    public boolean bookRegister(BookDto book, MultipartFile file) {

        if (book == null || file == null || file.isEmpty()) {
            return false;
        }

        try {
            String name = UploadFileUtils.uploadFile(
                    uploadPath,
                    file.getOriginalFilename(),
                    file.getBytes()
            );

            book.setBk_mainImg(name);

            int result = bookDao.getBookInfo(book);

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int updateBook(BookDto book, MultipartFile file) {

        try {

            if (file != null && !file.isEmpty()) {

                String name = UploadFileUtils.uploadFile(
                        uploadPath,
                        file.getOriginalFilename(),
                        file.getBytes()
                );

                book.setBk_mainImg(name);
            }

            return bookDao.updateBook(book);

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getTotalCountRegi(){
        return bookDao.getTotalCountRegi();
    }

    public List<RegistrationDto> regiBookList(Criteria cri) {
        return bookDao.regiBookList(cri);
    }

    public RegistrationDto getRegiBook(Integer re_code) {
        if(re_code == null) return null;
        return bookDao.getRegiBook(re_code);
    }

    public int updateRegi(RegistrationDto regi) {

        if (regi == null) {
            return 0;
        }

        return bookDao.updateRegi(regi);
    }

    public int regiBook(RegistrationDto regi) {
        if(regi == null) return 0;
        return bookDao.regiBook(regi);
    }
}
