package pl.vm.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.vm.app.model.Playing;

@RestController
public class PlayController {

    @RequestMapping("/play")
    public Playing play() {
        return new Playing("Chess", "Piotr");
    }

}
