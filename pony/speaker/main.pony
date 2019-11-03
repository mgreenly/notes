use "inspect"

actor Speaker
  be say(out: OutStream, message: String) =>
    out.print(Inspect(message))

actor Main
  new create(env: Env) =>
    let speaker = Speaker
    speaker.say(env.out, "Hello")
