use godot::engine::Sprite2D;
use godot::engine::Sprite2DVirtual;
use godot::prelude::*;

struct MyExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MyExtension {}

#[derive(GodotClass)]
#[class(base=Sprite2D)]
struct Thing {
    speed: f64,
    angular_speed: f64,

    #[base]
    sprite: Base<Sprite2D>,
}

#[godot_api]
impl Sprite2DVirtual for Thing {
    fn init(sprite: Base<Sprite2D>) -> Self {
        godot_print!("Hello, world! From rust!"); // Prints to the Godot console

        Self {
            speed: 1000.0,
            angular_speed: std::f64::consts::PI,
            sprite,
        }
    }
    fn physics_process(&mut self, delta: f64) {
        // In GDScript, this would be:
        // rotation += angular_speed * delta

        self.sprite.rotate((self.angular_speed * delta) as f32);
        // The 'rotate' method requires a f32,
        // therefore we convert 'self.angular_speed * delta' which is a f64 to a f32
        let input = Input::singleton();
        let direction = Input::get_vector(
            &input,
            "left".into(),
            "right".into(),
            "up".into(),
            "down".into(),
        );

        // multiply self.speed by each component of the direction vector

        let velocity = Vector2::new(
            direction.x * self.speed as f32 * delta as f32,
            direction.y * self.speed as f32 * delta as f32,
        );

        self.sprite.translate(velocity)
    }
}
