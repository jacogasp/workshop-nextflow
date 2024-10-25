process ComputePi {
  input:
    path fileName
  output:
    path "pi.txt"
  container "python:3"
  shell:
    """
    #!/usr/local/bin/python

    import random
    with open("${fileName}") as f:
        N = int(f.read())

    inside_circle = 0

    for i in range(N):
        x = random.random()
        y = random.random()

        if x * x + y * y < 1:
            inside_circle += 1

    pi = 4.0 * inside_circle / N
    with open("pi.txt", "w") as f:
        f.write(str(pi))
    """
  stub:
    """
    pi=3.14
    """
}

process Avg {
  input:
    path fileName
  output:
    stdout
  container "python:3"
  shell:
    """
    #!/usr/local/bin/python
    with open("${fileName}") as f:
        arr = [float(x) for x in f.readlines()]
    pi = sum(arr) / len(arr)
    print(pi)
    """
}

process SaveResult {
  input:
    val pi
  publishDir params.output, mode: 'copy', overwrite: true
  container "python:3"
  output:
    path "pi.txt"
  shell:
    """
    echo "${pi}" >> pi.txt
    """
}
