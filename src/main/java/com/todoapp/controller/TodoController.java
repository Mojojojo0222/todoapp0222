package com.todoapp.controller;

import com.todoapp.entity.Todo;
import com.todoapp.service.TodoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TodoController {

    private final TodoService service;

    public TodoController(TodoService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("todos", service.getAll());
        return "index";
    }

    @PostMapping("/add")
    public String add(@RequestParam String title) {
        Todo todo = new Todo();
        todo.setTitle(title);
        todo.setCompleted(false);
        service.save(todo);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        service.delete(id);
        return "redirect:/";
    }
}

