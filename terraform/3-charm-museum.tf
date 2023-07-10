resource "helm_release" "chartmuseum" {
  name             = "chartmuseum"
  repository       = "https://chartmuseum.github.io/charts"
  chart            = "chartmuseum"
  namespace        = "chartmuseum"
  create_namespace = "true"
  version          = "3.10.1"
  values = [
    "${file("chartmuseum-values.yaml")}"
  ]
}