<?php
require_once "importance.php";

/* if(!Patient::isPatientIn()){
    Config::redir("login.php");
} */
?>

<html>
<head>
    <title>Payment success - <?php echo CONFIG::SYSTEM_NAME; ?></title>
    <?php require_once "inc/head.inc.php";  ?>
</head>
<body>
    <?php require_once "inc/header.inc.php"; ?>
    <div class='container-fluid'>
        <div class='row'>
            <div class='col-md-2'><?php require_once "inc/sidebar.inc.php"; ?></div> <!-- this should be a sidebar -->
            <div class='col-md-10'>
                <div class='content-area'>
                <div class='content-header'>
                    Payment Info <small>this is your payment info</small>
                </div>
                <div class='content-body'>
                    <?php
                    $val_id=urlencode($_POST['val_id']);
                    $store_id=urlencode("gub65be0e0623749");
                    $store_passwd=urlencode("gub65be0e0623749@ssl");
                    $requested_url = ("https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?val_id=".$val_id."&store_id=".$store_id."&store_passwd=".$store_passwd."&v=1&format=json");
                    
                    $handle = curl_init();
                    curl_setopt($handle, CURLOPT_URL, $requested_url);
                    curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false); # IF YOU RUN FROM LOCAL PC
                    curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # IF YOU RUN FROM LOCAL PC
                    
                    $result = curl_exec($handle);
                    
                    $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);
                    
                    if($code == 200 && !( curl_errno($handle)))
                    {
                    
                        # TO CONVERT AS ARRAY
                        # $result = json_decode($result, true);
                        # $status = $result['status'];
                    
                        # TO CONVERT AS OBJECT
                        $result = json_decode($result);
                    
                        # TRANSACTION INFO
                        $status = $result->status;
                        $tran_date = $result->tran_date;
                        $tran_id = $result->tran_id;
                        $val_id = $result->val_id;
                        $amount = $result->amount;
                        $store_amount = $result->store_amount;
                        $bank_tran_id = $result->bank_tran_id;
                        $card_type = $result->card_type;
                    
                        # EMI INFO
                        $emi_instalment = $result->emi_instalment;
                        $emi_amount = $result->emi_amount;
                        $emi_description = $result->emi_description;
                        $emi_issuer = $result->emi_issuer;
                    /*$transID = $tran_id; */
                        /* Appointment::paystatus1($transID, $paystatus); */
                        # ISSUER INFO
                        $card_no = $result->card_no;
                        $card_issuer = $result->card_issuer;
                        $card_brand = $result->card_brand;
                        $card_issuer_country = $result->card_issuer_country;
                        $card_issuer_country_code = $result->card_issuer_country_code;
                    
                        # API AUTHENTICATION
                        $APIConnect = $result->APIConnect;
                        $validated_on = $result->validated_on;
                        $gw_version = $result->gw_version;
                        
                        $paystatus = "Paid";
                        Appointment::pay($tran_id, $paystatus);

                        echo $status." ".$tran_date." ".$tran_id." ".$card_type;            
                    } else {
                    
                        echo "Failed to connect with SSLCOMMERZ";
                    }
                    ?>
                </div><!-- end of the content area -->
                </div>
                
            </div><!-- col-md-7 -->

        </div>
    </div>
</body>
</html>
