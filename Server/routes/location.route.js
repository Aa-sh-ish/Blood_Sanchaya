const Location = require("../Models/location");
const LocationRoute = require("express").Router();

LocationRoute.post("/Post", async (req, res) => {
  try {
    const newLocation = new Location({
      userId: req.body.userId,
      userName: req.body.userName,
      phone: req.body.phone,
      bloodGrouo: req.body.bloodGrouo,
      lattitude: req.body.lattitude,
      longitude: req.body.longitude,
      updatedate:req.body.updatedate
    });
    const savedLocation = await newLocation.save();

    res.status(200).json({
      message: "Location added successfully",
      location: savedLocation,
    });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

LocationRoute.post('/getUsers', async (req, res) => {
  try {
    // Get the bloodgroup, donatedate, latitude, and longitude parameters from the request body
    const { bloodGrouo, updatedate, lattitude, longitude } = req.body;

    // Calculate the minimum and maximum latitude and longitude values based on the given range of 0.2
    const minLat = parseFloat(lattitude) - 0.2;
    const maxLat = parseFloat(lattitude) + 0.2;
    const minLong = parseFloat(longitude) - 0.2;
    const maxLong = parseFloat(longitude) + 0.2;


    const threeMonthsAgo = new Date(updatedate);
    threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() - 3);
    console.log(threeMonthsAgo);

    const users = await Location.find({
      bloodGrouo: bloodGrouo,
      updatedate: { $lte: threeMonthsAgo.toString() },
      lattitude: { $gte: minLat, $lte: maxLat },
      longitude: { $gte: minLong, $lte: maxLong }
    });

    console.log(users.bloodGrouo);
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});


// function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
//   const R = 6371; // Radius of the earth in km
//   const dLat = deg2rad(lat2 - lat1); // deg2rad below
//   const dLon = deg2rad(lon2 - lon1);
//   const a =
//     Math.sin(dLat / 2) * Math.sin(dLat / 2) +
//     Math.cos(deg2rad(lat1)) *
//       Math.cos(deg2rad(lat2)) *
//       Math.sin(dLon / 2) *
//       Math.sin(dLon / 2);
//   const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//   const d = R * c; // Distance in km
//   return d;
// }

// function deg2rad(deg) {
//   return deg * (Math.PI / 180);
// }

// // Handler function for the API endpoint
// async function getUsers(req, res) {
//   const { userLat, userLong } = req.body; // Latitude and longitude of the user making the request
//   const currentDate = new Date(); // Current date

//   // Find all locations matching the criteria
//   const locations = await Location.find({
//     bloodGroup: req.body.bloodGroup,
//     updatedate: { $lte: new Date(currentDate.getTime() - 90 * 24 * 60 * 60 * 1000) }, // Date 3 months ago
//   });

//   // Filter locations within 50km of the user
//   const nearbyLocations = locations.filter((location) => {
//     const distance = getDistanceFromLatLonInKm(
//       userLat,
//       userLong,
//       location.latitude,
//       location.longitude
//     );
//     return distance <= 50;
//   });

//   // Return the filtered locations
//   res.json(nearbyLocations);
// }

//  // Assuming the handler function is in a separate file

// // POST /users route
// LocationRoute.post("/users", getUsers);


module.exports= LocationRoute;