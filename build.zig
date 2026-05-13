const std = @import("std");

pub fn build(b: *std.Build) void {
	const target = b.standardTargetOptions(.{});
	const optimize = b.standardOptimizeOption(.{});

	const vec_dep = b.dependency("simple_vectors", .{
		.target = target,
		.optimize = optimize,
	});
	const vector2_mod = vec_dep.module("Vector2");

	const mod = b.addModule(
		"little_physics_engine",
		.{
			.root_source_file = b.path("src/root.zig"),
			.target = target,
			.optimize = optimize,
		}
	);

	mod.addImport("Vector2", vector2_mod);
}
