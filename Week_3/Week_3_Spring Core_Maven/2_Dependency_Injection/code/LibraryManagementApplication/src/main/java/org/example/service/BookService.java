package org.example.service;

import org.example.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository){
        this.bookRepository = bookRepository;
    }

    public void addBook(String name){
        System.out.println("Book Service : Book Added - "+name);
        bookRepository.saveBook(name);
    }
}
