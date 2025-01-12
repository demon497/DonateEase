package com.example.khalti.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.web.client.HttpClientErrorException;

@Controller
public class PaymentController {

    @Value("${khalti.public.key}")
    private String KHALTI_PUBLIC_KEY;

    @Value("${khalti.secret.key}")
    private String KHALTI_SECRET_KEY;

    private final String KHALTI_VERIFY_PAYMENT_URL = "https://khalti.com/api/v2/payment/verify/";

    @GetMapping("/")
    public String showPaymentPage(Model model) {
        model.addAttribute("publicKey", KHALTI_PUBLIC_KEY);
        return "index";
    }

    @PostMapping("/verify_payment")
    public String verifyPayment(@RequestParam("token") String token, @RequestParam("amount") Long amount, Model model) {
        try {
            // Call Khalti API to verify the payment using RestTemplate
            String url = KHALTI_VERIFY_PAYMENT_URL + token;

            // Create the HTTP headers
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Key " + KHALTI_SECRET_KEY);

            // Create the HTTP entity
            HttpEntity<String> entity = new HttpEntity<>(headers);

            // Make the API call to verify the payment
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

            // Check if the payment is verified and update the model
            if (response.getStatusCode().is2xxSuccessful()) {
                model.addAttribute("paymentStatus", "Payment Successful!");
            } else {
                model.addAttribute("paymentStatus", "Payment Verification Failed!");
            }

        } catch (HttpClientErrorException e) {
            model.addAttribute("paymentStatus", "Payment Verification Error: " + e.getMessage());
        } catch (Exception e) {
            model.addAttribute("paymentStatus", "Error: " + e.getMessage());
        }
        return "payment_status";
    }
}
