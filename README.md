Database Project - Accommodation Booking System

### Project Overview
| Field | Details |
|------|---------|
| **Student** | Panainte Silviu-Octavian, Group 1311A |
| **Coordinator** | Lecturer Dr. Eng. Mironeanu Catalin |
| **Theme** | Accommodation Booking Website (Booking.com style) |

### Description
The application manages a booking database for a travel website. It stores tourist locations, stay durations, accommodation prices, and booking timestamps. The platform manages customer bookings, reviews, and personal user contact details.

**Key Simplifications:**
- No all-inclusive offers or meal options.
- Owners can rent multiple properties at fixed prices.
- Two clients can occupy the same accommodation on the same day.
- A tourist cannot have more than one active booking at a time.

### Database Architecture (Normalized to 5NF)
1. **PEOPLE**: Atomic attributes (CNP, Email, Phone) with no transitive dependencies.
2. **OWNERS/CLIENTS**: Specialized tables linked via CNP.
3. **ACCOMMODATIONS**: Detailed records of properties (Address, Price, Type, Owner).
4. **BOOKINGS**: Tracks reservations while ensuring no past-dated starts.
5. **REVIEWS**: Stores user feedback and ratings (1-5 stars).

### Constraints & Validation
- **Integrity**: Strict PK/FK relationships across all tables.
- **Formatting**: Email and phone number regex-like checks.
- **Logic**: Prices and IDs have minimum thresholds (e.g., price >= 50.00).
- **Business Rules**: `tip_cazare` restricted to predefined categories (apartment, hotel, etc.).
