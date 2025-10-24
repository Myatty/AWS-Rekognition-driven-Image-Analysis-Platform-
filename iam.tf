resource "aws_role" "lambda_role" {
    name = "Lambda_Function_Role"
    assume_role_policy = <<EOF
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
    }
    EOF
}

resource "aws_iam_policy" "cloud_watch_logs_access_policy_for_lambda" {
    name = "cloud_watch_logs_access_policy_for_lambda"
    path = "/"
    description = "IAM Policy for Lambda role to access and manage Cloud watch logs"
    policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
    }
    ]
    }

    EOF
}

resource "aws_iam_role_policy_attachment" "attach_cloud_watch_policy_to_lambda_role" {
    role = aws_iam_role.lambda_role.name
    policy_arn = aws_iam_policy.cloud_watch_logs_access_policy_for_lambda.arn
}

data "aws_iam_policy" "rekognition_policy" {
    arn = "arn:aws:iam::aws:policy/AmazonRekognitionReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "attach_rekognition_policy_to_lambda_role" {
    role = aws_iam_role.lambda_role.name
    policy_arn = "${data.aws_iam_policy.rekognition_policy.arn}"
}