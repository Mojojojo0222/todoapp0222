package com.todoapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.todoapp.entity.Todo;

public interface TodoRepository extends JpaRepository<Todo, Long> {
	}


