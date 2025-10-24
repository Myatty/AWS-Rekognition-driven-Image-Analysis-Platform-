resource "aws_api_gateway_rest_api" "entry_rest_api_gw" {
    name = "Entry-RestAPI-GW"
    description = "API Gateway for the endpoints"
    
    endpoint_configuration {
      types = ["REGIONAL"]
    }
}

resource "aws_api_gateway_resource" "root_resource_path" {
    rest_api_id = aws_api_gateway_rest_api.entry_rest_api_gw.id
    parent_id = aws_api_gateway_rest_api.entry_rest_api_gw.root_resource_id
    path_part = "analyzePhoto"
}