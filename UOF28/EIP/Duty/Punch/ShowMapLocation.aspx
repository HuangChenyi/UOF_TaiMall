<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMapLocation.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Punch.ShowMapLocation" %>

<!DOCTYPE html>
<html>
<head>
	<base target="_top">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

	<style>
		html, body {
			height: 100%;
			margin: 0;
		}
		.leaflet-container {
			height: 1000px;
			width: 100%;
			max-width: 100%;
			max-height: 100%;
		}
	</style>

	
</head>
<body>

<div id="map"></div>
<script>
	
	var lat = '<%=Request.QueryString["LAT"]%>';
	var lng = '<%=Request.QueryString["LNG"]%>';
	const map = L.map('map', { attributionControl: false }).setView([lat, lng], 18);

	const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		maxZoom: 19,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
	}).addTo(map);

	var marker = L.marker([lat, lng]).addTo(map);
</script>
</body>
</html>
