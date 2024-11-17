# OWASP Juice Shop Hacking: Expired Coupon Exploit

## Table of Contents

1. [Challenge Overview](#challenge-overview)
2. [Solution Steps](#solution-steps)
   - [Step 1: Add Juice to Basket](#step-1-add-juice-to-basket)
   - [Step 2: Redeem Expired Coupon](#step-2-redeem-expired-coupon)
   - [Step 3: Modify System Date](#step-3-modify-system-date)
   - [Step 4: Complete the Challenge](#step-4-complete-the-challenge)
3. [Video Tutorial](#video-tutorial)

## Challenge Overview

This challenge involves exploiting an expired coupon code in OWASP Juice Shop by manipulating the system time. The goal is to apply a coupon that has expired by adjusting the system clock to an earlier date.

## Solution Steps

### Step 1: Add Juice to Basket

- Navigate to the Juice Shop and add an item (e.g., juice) to your shopping basket.
- Proceed to the basket to view the items.

### Step 2: Redeem Expired Coupon

- Enter your address and any other required information.
- Attempt to redeem an expired coupon.
- Open the developer tools and search for the term `campaigns` (i.e., `this.campaigns`).
- Also, search for the `applyCoupon` method in the developer tools.

### Step 3: Modify System Date

- Add a debugger in the developer tools to pause execution.
- Manually change your system time (if on Linux) to a date when the coupon was still valid.
- Continue the process and finish the order.

![Juice Shop Screenshot](assets/change-time-after.png)
![Juice Shop Screenshot](assets/change-time-before.png)
![Juice Shop Screenshot](assets/main-script-campaign.png)
![Juice Shop Screenshot](assets/main-script-important-code-path.png)
![Juice Shop Screenshot](assets/timestamp-of-coupon.png)

### Step 4: Complete the Challenge

- Once the order is placed successfully with the expired coupon, the challenge is solved.

## Video Tutorial

For a detailed video tutorial on how to complete this challenge, watch the following videos:

[![Watch all videos on Google-Drive](https://img.shields.io/badge/Watch-Video-blue)](https://drive.google.com/drive/folders/1ACwk1_sDCVEhfqRcqq-_Al0VCFSSfhQV?usp=sharing)

---

By following these steps, you will successfully exploit the expired coupon functionality and complete the Juice Shop challenge.
