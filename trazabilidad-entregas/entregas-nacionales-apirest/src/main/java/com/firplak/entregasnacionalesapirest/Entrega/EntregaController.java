package com.firplak.entregasnacionalesapirest.Entrega;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/entrega")
@RequiredArgsConstructor
public class EntregaController {
    private final EntregaService entregaService;
    @PostMapping()
    public void createEntrega(@RequestBody Entrega entrega){
          entregaService.createEntrega(entrega);
    }
    
}
