use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn bar1() -> impl Responder {
    HttpResponse::Ok().body("in: '/bar'")
}

fn bar2() -> impl Responder {
    HttpResponse::Ok().body("in: '/bar/'")
}

fn main() {

    HttpServer::new(|| {
        App::new()
            .route("/bar", web::get().to(bar1))
            .route("/bar/", web::get().to(bar2))

    })
    .bind("0.0.0.0:8088")
    .unwrap()
    .run()
    .unwrap();
}
