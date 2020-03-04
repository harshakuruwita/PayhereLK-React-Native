package com.xcapp.payhere;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;



import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import lk.payhere.androidsdk.PHConfigs;
import lk.payhere.androidsdk.PHConstants;
import lk.payhere.androidsdk.PHMainActivity;
import lk.payhere.androidsdk.model.InitRequest;
import lk.payhere.androidsdk.model.Item;


public class Payhere extends ReactContextBaseJavaModule {


    private final ReactApplicationContext reactContext;
    private final static int PAYHERE_REQUEST = 11010;
    private final InitRequest req;
    public Payhere(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        reactContext.addActivityEventListener((ActivityEventListener) this);
         req = new InitRequest();
    }


    @Override
    public String getName() {

        return "Payhere";
    }

    @ReactMethod
    public void getStatus(


            Callback successCallback) {
        successCallback.invoke(null, true);

    }

    @ReactMethod
    public void payOnece(int amount) {


        req.setMerchantId("1213804");       // Your Merchant PayHere ID
        req.setMerchantSecret("4ZGRnKOnY1s8Qh7WG20eKT8X2Z6yS7FH18lzDbfLIvnM"); // Your Merchant secret (Add your app at Settings > Domains & Credentials, to get this))
        req.setCurrency("LKR");             // Currency code LKR/USD/GBP/EUR/AUD
        req.setAmount(1000.00);             // Final Amount to be charged
        req.setOrderId("230000123");        // Unique Reference ID
        req.setItemsDescription("Door bell wireless");  // Item description title
        req.setCustom1("This is the custom message 1");
        req.setCustom2("This is the custom message 2");
        req.getCustomer().setFirstName("Saman");
        req.getCustomer().setLastName("Perera");
        req.getCustomer().setEmail("samanp@gmail.com");
        req.getCustomer().setPhone("+94771234567");
        req.getCustomer().getAddress().setAddress("No.1, Galle Road");
        req.getCustomer().getAddress().setCity("Colombo");
        req.getCustomer().getAddress().setCountry("Sri Lanka");

//Optional Params
        req.getCustomer().getDeliveryAddress().setAddress("No.2, Kandy Road");
        req.getCustomer().getDeliveryAddress().setCity("Kadawatha");
        req.getCustomer().getDeliveryAddress().setCountry("Sri Lanka");



        Intent intent = new Intent(reactContext, PHMainActivity.class);
        intent.putExtra(PHConstants.INTENT_EXTRA_DATA, req);
        PHConfigs.setBaseUrl(PHConfigs.SANDBOX_URL);

        reactContext.startActivityForResult(intent, PAYHERE_REQUEST, Bundle.EMPTY);


    }




}
