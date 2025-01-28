# TransitBookingSystem---MBTA

# Overview

The MBTA Automated Ticketing System is designed to streamline ticket purchases, subscriptions, group bookings, and refunds while ensuring dynamic pricing, security through role-based access, and insightful reporting for administrators.

This repository includes the Entity Relationship Diagram (ERD), outlining key components and relationships of the system.

# Entity Relationship Diagram (ERD)

![image](https://github.com/user-attachments/assets/56f230fb-d2ef-4ad6-8cae-a299ff3934be)


The ERD visualizes how the system manages:

**Users & Roles**: Tracks customers, administrators, and cashiers.

**Ticketing System**: Handles ticket purchases, pricing, and booking.

**Transaction Processing**: Records payments, refunds, and booking statuses.

**Group Bookings & Subscriptions**: Supports multi-passenger bookings and periodic passes.

# Business Rules & Features

# Pricing & Discounts

**Regular Fare**: Standard ticket price.  

**Senior Discount**: 10% off the base fare.

**Student Discount**: 5% off the base fare.

**Fare Capping**: No user spends more than $100 per month.

# Group Booking

Allows up to **15 passengers** per booking.

5% discount **for groups of **5+ passengers.**

# Subscription Plans

Available **monthly** or **yearly **with auto-renewal.

Status options: **Active, Expired, or Canceled**.

# Refund & Cancellation Policy

Full refund within 1 hour of ticket purchase.

No refund allowed after the trip has started.

# System Functionalities

# User Roles & Permissions

**MBTA Admin**: Full system control.

**Customer User**: Manage personal bookings, refunds, and subscriptions.

**Cashier User**: Process transactions and refunds.

**Group Booking Manager**: Manage group ticket purchases.

**Subscription Manager**: Oversee and manage user subscriptions.

# System Insights & Reports

# Customer Dashboard

Track spending, subscriptions, and ticket usage.
# Group Booking Overview

Monitor group bookings and passenger count.
# Transaction Summary

View ticket purchases, refunds, and revenue generation.
# Refunds & Cancellation Report

Analyze refund requests and cancellation patterns.
# Subscription Utilization

Monitor subscription renewals, cancellations, and usage trends.
# Ticket Sales Reports

Track revenue by transit line and user category.

# Conclusion

The MBTA Automated Ticketing System offers seamless ticket booking, secure role-based access, and real-time insights to optimize transit services. The integrated dashboard and analytics enable data-driven decision-making, enhancing both user experience and MBTA revenue management.

