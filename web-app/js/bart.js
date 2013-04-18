function getDistance(latUser, lonUser, latStation, lonStation) {
  var R = 6371;
  var dLat = (latStation - latUser).toRad();
  var dLon = (lonStation - lonUser).toRad();
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(latStation.toRad()) * Math.cos(latUser.toRad()) *
          Math.sin(dLon / 2) * Math.sin(dLon / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  return d;
};


