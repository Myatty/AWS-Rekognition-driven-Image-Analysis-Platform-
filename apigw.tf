resource "aws_api_gateway_rest_api" "entry_rest_api_gw" {
    name = "Entry-RestAPI-GW"
    description = "API Gateway for the endpoints"
    
    endpoint_configuration {
      types = ["REGIONAL"]
    }
}