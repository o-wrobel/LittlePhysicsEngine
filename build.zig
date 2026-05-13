const std = @import("std");

pub fn build(b: *std.Build) void {
	const target = b.standardTargetOptions(.{});
	const optimize = b.standardOptimizeOption(.{});

	const vec_dep = b.dependency("simple_vectors", .{
		.target = target,
		.optimize = optimize,
	});
	const vec2_mod = vec_dep.module("Vector2");
	const vec3_mod = vec_dep.module("Vector3");

	const mod = b.addModule(
		"Simulation",
		.{
			.root_source_file = b.path("src/Simulation.zig"),
			.target = target,
			.optimize = optimize,
		}
	);

	mod.addImport("Vector2", vec2_mod);
	mod.addImport("Vector3", vec3_mod);

}
