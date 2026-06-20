package engine

import "core:math/linalg"

when ODIN_OS == .Windows {
	foreign import darkwings "./lib/engine-lib.dll"
} else when ODIN_OS == .Linux {
	foreign import darkwings "./lib/engine-lib.so"
}

foreign darkwings {
	create_engine :: proc()
}

// Darkwings Engine definitions

Vec3L :: linalg.Vector3f64
Vec4L :: linalg.Vector4f64
Mat4L :: linalg.Matrix4x4f64
Mat3L :: linalg.Matrix3x3f64
QuatL :: linalg.Quaternionf64

Vec3 :: linalg.Vector3f32
Vec4 :: linalg.Vector4f32
Mat4 :: linalg.Matrix4x4f32
Mat3 :: linalg.Matrix3x3f32
Quat :: linalg.Quaternionf32

Configuration :: struct {
	application_name: string,
}

WindowDisplayParameters :: struct {
	width:  u32,
	height: u32,
	title:  string,
}

WindowEvent :: union {
	WindowClosed,
	WindowResized,
	WindowKeyPressed,
	WindowKeyReleased,
	WindowMouseMoved,
	WindowMouseButtonPressed,
	WindowMouseButtonReleased,
}

WindowClosed :: struct {}

WindowResized :: struct {
	width:  u32,
	height: u32,
}

WindowKeyPressed :: struct {
	key: u32,
}

WindowKeyReleased :: struct {
	key: u32,
}

WindowMouseMoved :: struct {
	x: i32,
	y: i32,
}

WindowMouseButtonPressed :: struct {
	button: u32,
}

WindowMouseButtonReleased :: struct {
	button: u32,
}
