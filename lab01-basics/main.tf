terraform{
    required_providers{
        local = {
            source = "hashicorp/local"
        }
    }
}

resource "local_file" "demo"{
    filename = "hello.txt"
    content = "Hello terraform123"
}