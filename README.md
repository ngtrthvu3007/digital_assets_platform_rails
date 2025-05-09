# README

## Feature: Catalog Bulk Import for Creators

### Test Cases

1. **No file selected**:

   - Ensure the system shows an alert when no file is uploaded.

2. **Invalid JSON format**:

   - Verify the system rejects invalid JSON files and shows an appropriate error message.

3. **Successful import**:

   - Test importing a valid JSON file with correctly formatted data.

4. **Asset validation errors**:

   - Ensure the system rolls back the transaction and shows detailed error messages when some assets fail validation.

5. **Partial failure (rollback)**:
   - Verify that no assets are saved if any asset in the JSON file fails validation.

---

## Feature: Creator Earnings API for Admin

### Test Cases

1. **Earnings calculation with multiple creators**:

   - Verify the API returns correct earnings for multiple creators.

2. **Earnings calculation with no purchases**:

   - Ensure the API returns an empty array when there are no purchases.

3. **Earnings calculation with no creators**:

   - Verify the API returns an empty array when there are no creators.

4. **Database connection error**:

   - Simulate a database connection failure and ensure the API handles it gracefully.

5. **Invalid query structure**:
   - Test the API's behavior when the query structure is invalid (e.g., missing columns).

---

## Feature: Purchase & Download for Customers

### Test Cases

1. **No assets selected**:

   - Verify the system shows an alert when no assets are selected for purchase.

2. **Successful purchase**:

   - Test purchasing multiple valid assets and ensure they are added to the customer's downloads.

3. **Invalid asset ID**:

   - Ensure the system handles invalid asset IDs gracefully.

4. **Customer not found**:

   - Verify the system shows an error when trying to purchase assets for a non-existent customer.

5. **View purchased assets**:

   - Test that the customer can view a list of all purchased assets.

6. **No purchased assets**:
   - Verify the system shows an appropriate message when the customer has no purchased assets.
