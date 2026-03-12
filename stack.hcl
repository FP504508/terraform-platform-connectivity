stack {
  name = "platform-connectivity"
}

deployment "test" {

  component "hub" {
    source = "./components/hub"
  }

}