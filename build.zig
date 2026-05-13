const std = @import("std");

pub fn build(b: *std.Build) void {
	const target = b.standardTargetOptions(.{});
	const optimize = b.standardOptimizeOption(.{});

	const vec_dep = b.dependency("simple_vectors", .{
		.target = target,
		.optimize = optimize,
	});
	const vector2 = vec_dep.module("Vector2");
	const vector3 = vec_dep.module("Vector3");
	const vector2_mod = b.addModule(
		"Vector2",
		.{
			.root_source_file = vector2.root_source_file,
		}
	);
	const vector3_mod = b.addModule(
		"Vector3",
		.{
			.root_source_file = vector3.root_source_file,
		}
	);

	const mod = b.addModule(
		"Simulation",
		.{
			.root_source_file = b.path("src/Simulation.zig"),
			.target = target,
			.optimize = optimize,
		}
	);

	mod.addImport("Vector2", vector2_mod);
	mod.addImport("Vector3", vector3_mod);

}
