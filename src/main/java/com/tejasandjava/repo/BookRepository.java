package com.tejasandjava.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tejasandjava.entity.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
