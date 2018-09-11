#!/bin/sh
cargo rustc --release -- --emit=llvm-ir
cp target/release/deps/hello-*.ll hello.ll
cargo rustc --release -- --emit=llvm-bc
cp target/release/deps/hello-*.bc hello.bc
llc-4.0 hello.bc -march=bpf -filetype=obj -o hello.o
