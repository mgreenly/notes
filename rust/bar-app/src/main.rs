use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn index1() -> impl Responder {
    HttpResponse::Ok().body("in: ''")
}

fn index2() -> impl Responder {
    HttpResponse::Ok().body("in: '/'")
}

fn bar1() -> impl Responder {
    HttpResponse::Ok().body("in: '/bar'")
}

fn bar2() -> impl Responder {
    HttpResponse::Ok().body("in: '/bar/'")
}

fn bar3() -> impl Responder {
    HttpResponse::Ok().body("in: 'bar'")
}

fn bar4() -> impl Responder {
    HttpResponse::Ok().body("in: 'bar/'")
}



fn main() {

    HttpServer::new(|| {
        App::new()
            .route("", web::get().to(index1))
            .route("/", web::get().to(index2))
            .route("/bar", web::get().to(bar1))
            .route("/bar/", web::get().to(bar2))
            .route("bar", web::get().to(bar3))
            .route("bar/", web::get().to(bar4))

    })
    .bind("0.0.0.0:8088")
    .unwrap()
    .run()
    .unwrap();
}
