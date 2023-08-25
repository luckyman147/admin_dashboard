
const express = require('express');
const router = express.Router();
const db = require('../models'); // Assuming you've configured Sequelize models

// Create a new appointment
router.post('/addAppoitement', async (req, res) => {
  try {
    const { startTime, endTime, subject, color,
    isAllDay } = req.body;
    const appointment = await db.Appointment.create({
      startTime,
      endTime,
      subject,
      color,
        isAllDay

    });
    res.status(200).json(appointment);
  } catch (error) {
    console.error('Error creating appointment:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get all appointments
router.get('/Appoitments', async (req, res) => {
  try {
    const appointments = await db.Appointment.findAll();
    res.json(appointments);
  } catch (error) {
    console.error('Error fetching appointments:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get a single appointment by ID
router.get('/Appoitment/:id', async (req, res) => {
  try {
    const appointment = await db.Appointment.findByPk(req.params.id);
    if (!appointment) {
      res.status(404).json({ error: 'Appointment not found' });
    } else {
      res.json(appointment);
    }
  } catch (error) {
    console.error('Error fetching appointment:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Update an appointment by ID
router.patch('/Appoitment/:id', async (req, res) => {
  try {
    const appointment = await db.Appointment.findByPk(req.params.id);
    if (!appointment) {
      res.status(404).json({ error: 'Appointment not found' });
    } else {
      const { startTime, endTime, subject, color,isAllDay } = req.body;
      await appointment.update({ startTime, endTime, subject, color,isAllDay });
      res.json(appointment);
    }
  } catch (error) {
    console.error('Error updating appointment:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Delete an appointment by ID
router.delete('/Appoitment/:id', async (req, res) => {
  try {
    const appointment = await db.Appointment.findByPk(req.params.id);
    if (!appointment) {
      res.status(404).json({ error: 'Appointment not found' });
    } else {
      await appointment.destroy();
      res.status(204).send();
    }
  } catch (error) {
    console.error('Error deleting appointment:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
