use actix_web::{web, App, HttpResponse, HttpServer, Responder};

fn index1() -> impl Responder {
    HttpResponse::Ok().body("in: '                index1'")
}

fn index2() -> impl Responder {
    HttpResponse::Ok().body("in: '/               index2'")
}

fn api1() -> impl Responder {
    HttpResponse::Ok().body("in: '/api            api1'")
}

fn api2() -> impl Responder {
    HttpResponse::Ok().body("in: '/api/           api2'")
}

fn main() {

    HttpServer::new(|| {
        App::new()
            .route("", web::get().to(index1))
            .route("/", web::get().to(index2))
            .route("/api", web::get().to(api1))
            .route("/api/", web::get().to(api2))

    })
    .bind("0.0.0.0:8080")
    .unwrap()
    .run()
    .unwrap();
}
