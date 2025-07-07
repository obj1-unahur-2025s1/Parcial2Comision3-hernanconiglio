class TipoStream {
  method impacto(unInfluencer)
  method mejoraCarisma() = 0
  method mejoraElocuencia() = 0
  method mejoraHabilidadGaming() = 0

}

object gaming inherits TipoStream {
  override method impacto(unInfluencer) = unInfluencer.habilidadGaming() * 5
  override method mejoraHabilidadGaming() = 2
}

class Charla inherits TipoStream {
  const clasificacion
  override method impacto(unInfluencer) = unInfluencer.elocuencia() * 6 + clasificacion.adicional()
  override method mejoraElocuencia() = 2
}

  object atp {
    method adicional() = 5
  }
  object mas13 {
    method adicional() = 3
  }
  object mas16 {
    method adicional() = 0
  }

object creativo inherits TipoStream {
  override method impacto(unInfluencer) = (unInfluencer.carisma() + unInfluencer.elocuencia()) / 2 * 8
  override method mejoraCarisma() = 2
  override method mejoraElocuencia() = 1
}

class Influencer {
  const property alias
  var seguidores
  var carisma
  var elocuencia
  var habilidadGaming

  method carisma() = carisma
  method elocuencia() = elocuencia
  method habilidadGaming() = habilidadGaming
  method seguidores() = seguidores
  method registrarStream() {self.efectoStream(self.tipoStream())}
  method efectoStream(unTipoStream) {
    seguidores = seguidores + unTipoStream.impacto(self)
    carisma = carisma + unTipoStream.mejoraCarisma()
    elocuencia = elocuencia + unTipoStream.mejoraElocuencia()
    habilidadGaming = habilidadGaming + unTipoStream.mejoraHabilidadGaming()
  }
  method tipoStream()
}

class Profesional inherits Influencer{
  const property tipoStream
  method initialize() {
    if(seguidores < igba.minimoSeguidores()) {
      self.error("No puede ser profesional porque no alcanza el minimo de seguidores que tiene actualmente igba, que es " + igba.minimoSeguidores().toString())
    }
  }
}

object igba {
  var property minimoSeguidores = 1000
}

class CreadorMultifacetico inherits Influencer {
  var property tipoStream
  method cambiarTipoStream(unTipoStream) {tipoStream=unTipoStream}
}

class InfluencerComercial inherits Influencer {
  const property tiposStreamAprendidos = #{}

  method initialize() {
    if(tiposStreamAprendidos.isEmpty()) {
      self.error("Un influencer comercial debe conocer al menos 1 tipo de stream")
    }
  }

  method obtenerMejorTipoStream() = tiposStreamAprendidos.max({t=>t.impacto(self)})
  override method tipoStream() = self.obtenerMejorTipoStream()
  method hacerStreamAdquisicion(unTipoStream) {
    if(tiposStreamAprendidos.contains(unTipoStream)) {
      self.error("el influencer ya conoce el tipo de stream")
    }
    tiposStreamAprendidos.add(unTipoStream)
    seguidores = (seguidores - seguidores * 0.1).truncate(0)
  }
}

class Stream {
  const property cantidadMaximaAudiencia
  const property tipoDeStream 
  const property influencer

}

class PlataformaAbierta {
  const property streams = []
  const property influencers = #{}
  method registrarInfluencer(unInfluencer) {
    if(self.aliases().contains(unInfluencer.alias())) {
      self.error("el alias del influencer ya está registrado")
    }
    influencers.add(unInfluencer)
  }
  method aliases() = influencers.map{i=>i.alias()}
  method registrarStream(unInfluencer,cantidadMaximaAudiencia) {
    if(!influencers.contains(unInfluencer)) {
      self.error("el influencer no pertenece a la plataforma")
    }
    streams.add(new Stream(
      cantidadMaximaAudiencia=cantidadMaximaAudiencia
      ,tipoDeStream=unInfluencer.tipoStream()
      ,influencer=unInfluencer
    ))
    unInfluencer.registrarStream()
  }
  method influencersImportantes() = influencers.filter({i=>i.seguidores()>igba.minimoSeguidores()})
  method totalSeguidores() = influencers.seguidores().sum({i=>i.seguidores()})
  method streamMayorAudiencia() = streams.max({s=>s.cantidadMaximaAudiencia()})
  method streamerConMayorAudiencia() = self.streamMayorAudiencia().influencer().alias()
  method influencersImportantesOrdenados() = 
    self.influencersImportantes().sortBy({i1,i2=> i1.seguidores()>i2.seguidores()})
  method reasignarLos3Mejores(plataformaSelectiva) {
    if(self.influencersImportantes().size()>=3) {
      self.influencersImportantesOrdenados().take(3).forEach({i=>plataformaSelectiva.registrarInfluencer(i)})
      influencers.removeAll(self.influencersImportantesOrdenados().take(3))
    }
  }

}

class PlataformaSelectiva inherits PlataformaAbierta {

  method admite(unInfluencer) = unInfluencer.seguidores() > igba.minimoSeguidores() * 2
  override method registrarInfluencer(unInfluencer) {
    if(!self.admite(unInfluencer)) {
      self.error("no se admite el influencer")
    }
    super(unInfluencer)
  }

}