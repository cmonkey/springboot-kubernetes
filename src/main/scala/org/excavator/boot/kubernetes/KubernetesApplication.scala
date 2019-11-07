package org.excavator.boot.kubernetes

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class KubernetesApplication {

}

object KubernetesApplication{
  def main(args: Array[String]): Unit = {
    SpringApplication.run(classOf[KubernetesApplication], args:_*)
  }
}
