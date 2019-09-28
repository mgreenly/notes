use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn index() -> impl Responder {
    HttpResponse::Ok().body("hello")
}

fn liveness() -> impl Responder {
    HttpResponse::Ok().body("alive")
}

fn rediness() -> impl Responder {
    HttpResponse::Ok().body("ready")
}

fn main() {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(index))
            .route("/liveness", web::get().to(liveness))
            .route("/readiness", web::get().to(rediness))
    })
    .bind("0.0.0.0:8088")
    .unwrap()
    .run()
    .unwrap();
}
