<img src="casmos-logo.png" alt="casmOS Logo"></img>

# casmOS
Operating System coded in C and Assembly.

https://os.phil-opp.com/multiboot-kernel/

### Building the ISO

To build the ISO, simply run

```
$ make iso
```

and all assembly files will be compiled to executables along with grub files being copied to the fs and made into an image.

### Compiling on non x86_64 machines

If you would like to compile casmOS on a non x86_64 machine (such as ARM) we recommend installing binutils, which the tutorial can be found [here](https://os.phil-opp.com/cross-compile-binutils/).
