use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn foo1() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo'")
}

fn foo2() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo/'")
}

fn main() {

    HttpServer::new(|| {
        App::new()
            .route("/foo", web::get().to(foo1))
            .route("/foo/", web::get().to(foo2))

    })
    .bind("0.0.0.0:8088")
    .unwrap()
    .run()
    .unwrap();
}
