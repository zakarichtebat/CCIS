<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vue.js Example - CCIS</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="bg-gray-100">
    <div id="app" class="container mx-auto py-8">
        <h1 class="text-2xl font-bold mb-4">Vue.js in Laravel Example</h1>
        <example-component></example-component>
    </div>
</body>

</html>