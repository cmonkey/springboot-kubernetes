package org.excavator.boot.kubernetes.controller

import org.excavator.boot.kubernetes.entity.UserInfo
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.{GetMapping, RequestMapping, RestController}
import reactor.core.publisher.Mono

@RestController
@RequestMapping(Array("/v1"))
class GreetController {

  @GetMapping(Array("/home"))
  def home(): Mono[ResponseEntity[UserInfo]] = {
    val userInfo = new UserInfo(10L, "cmonkey", "18888888888")
    Mono.just(ResponseEntity.ok(userInfo))
  }
}
