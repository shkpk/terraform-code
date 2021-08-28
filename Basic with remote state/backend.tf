terraform {
    backend "s3" {
        bucket = "tfstate-3344"
        key = "development/tstate"
        region = "us-east-1"

    }

}