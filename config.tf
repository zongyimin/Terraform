provider "aws" {
  region     = "ap-northeast-1"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  region     = "ap-southeast-1"
  alias      = "Singpa"
  access_key = ""
  secret_key = ""
}