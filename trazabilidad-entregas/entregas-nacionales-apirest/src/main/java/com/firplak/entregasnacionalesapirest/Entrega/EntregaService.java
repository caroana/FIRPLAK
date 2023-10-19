package com.firplak.entregasnacionalesapirest.Entrega;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EntregaService {
    private final EntregaRepository entregaRepo; 
    public void createEntrega(Entrega entrega){
      entregaRepo.save(entrega);
    }
}
