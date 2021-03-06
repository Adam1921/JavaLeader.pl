package pl.javaleader.injcectionspringapp.controllers;

import pl.javaleader.injcectionspringapp.service.Printer;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseBody;

@RestController
public class AppInjectionManagerByConstructorRestController {

    private final Printer printer;

    public AppInjectionManagerByConstructorRestController(@Qualifier("printerImpl") Printer printer) {
        this.printer = printer;
    }

    @GetMapping(path="/printerInjectedByConstructor")
    @ResponseBody
    public String getPrinterInjectedByConstructor() {
        return printer.print("printer injected by constructor");
    }
}