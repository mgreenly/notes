// scaler - integers, floating-point numbers, Booleans, and characters. 
// i8, u8, to i128, u128
// f32 and f64

// let x;                       -- immutable without initialize
// let x = 6;                   -- immutable with initialize
// let x: i32 = 6;              -- immutable with type with initialize
// let mut x = 6;               -- mutable with initialize
// let mut x: i32 = 6;          -- mutable with type with initialize
// let w: [i32; 3] = [1,2,3];
//
//
// tuple varried types
// array fixed length and tyep
// vector fix type and varied length

fn foo(x: i32, y: i32) -> i32 {
    if x == 0 { return 3 }
    x + y
}

fn main() {
    let mut y: i32;
    let x: i32 = 5;
    let z = true;
    let (t1, _t2) = (1, 2);
    let w: [i32; 5] = [1,2,3,4,5];
    println!("Hello, world!, x = {}", x);
    println!("Hello, world!, z = {}", z);
    println!("Hello, world!, t = {}", t1);
    println!("Hello, world!, t = {}", w[1]);
    let zz = foo(0, 13);
    println!("zz = {}", zz);
}
