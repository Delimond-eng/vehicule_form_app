<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Impression QRCODE</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap"
        rel="stylesheet">
    <script src="{{ asset('assets/js/qrcode_styling.js') }}"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #qrcode {
            margin-bottom: 0px;
        }
        h1 {
            color: #000000;
            text-align: center;
            font-family: 'Poppins';
            font-size: 2em;
            fond-weight: bold;
        }
    </style>
</head>
<body>
    <div id="qrcode"></div>
    <h1>{{ $code }}</h1>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const code = "{{ $qrcode_data }}";
            const qrCode = new QRCodeStyling({
                width: 600,
                height: 600,
                data: code,
                image: "{{ asset('assets2/images/flag.png') }}",
                dotsOptions: {
                    color: "#01070E",
                    type: "rounded"
                },
                backgroundOptions: {
                    color: "#FFFFFF"
                },
                imageOptions: {
                    crossOrigin: "anonymous",
                    margin: 0
                }
            });
            qrCode.append(document.getElementById("qrcode"));
            // Lancer l'impression lorsque la page est prête
            window.onload = function() {
                window.print();
                window.onafterprint = function() {
                    window.href="/";
                };
            };
        });
    </script>
</body>
</html>

