use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn index1() -> impl Responder {
    HttpResponse::Ok().body("in: '                index1'")
}

fn index2() -> impl Responder {
    HttpResponse::Ok().body("in: '/               index2'")
}

fn foo1() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo            foo1'")
}

fn foo2() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo/           foo2'")
}

fn main() {

    HttpServer::new(|| {
        App::new()
            .route("", web::get().to(index1))
            .route("/", web::get().to(index2))
            .route("/foo", web::get().to(foo1))
            .route("/foo/", web::get().to(foo2))

    })
    .bind("0.0.0.0:8080")
    .unwrap()
    .run()
    .unwrap();
}
