terraform {
    backend "s3" {
        bucket = "tfstate-3345"
        key = "development/tstate"
        region = "us-east-1"

    }

}