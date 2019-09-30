use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn index1() -> impl Responder {
    HttpResponse::Ok().body("in: ''")
}

fn index2() -> impl Responder {
    HttpResponse::Ok().body("in: '/'")
}

fn foo1() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo'")
}

fn foo2() -> impl Responder {
    HttpResponse::Ok().body("in: '/foo/'")
}

fn foo3() -> impl Responder {
    HttpResponse::Ok().body("in: 'foo'")
}

fn foo4() -> impl Responder {
    HttpResponse::Ok().body("in: 'foo/'")
}



fn main() {

    HttpServer::new(|| {
        App::new()
            .route("", web::get().to(index1))
            .route("/", web::get().to(index2))
            .route("/foo", web::get().to(foo1))
            .route("/foo/", web::get().to(foo2))
            .route("foo", web::get().to(foo3))
            .route("foo/", web::get().to(foo4))

    })
    .bind("0.0.0.0:8088")
    .unwrap()
    .run()
    .unwrap();
}
