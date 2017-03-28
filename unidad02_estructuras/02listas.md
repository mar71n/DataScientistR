``` R
> # Listas
> l <- list(1, "a", 1+4i)

> class(l)
[1] "list"

> str(l)
List of 3
 $ : num 1
 $ : chr "a"
 $ : cplx 1+4i

> l[[3]]
[1] 1+4i

> class(l[[3]])
[1] "complex"
```
