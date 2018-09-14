/*
 *
 *  [y] hybris Platform
 *
 *  Copyright (c) 2018 SAP SE or an SAP affiliate company. All rights reserved.
 *
 *  This software is the confidential and proprietary information of SAP
 *  ("Confidential Information"). You shall not disclose such Confidential
 *  Information and shall use it only in accordance with the terms of the
 *  license agreement you entered into with SAP.
 * /
 */
package com.sap.hybris.sapbusinessagreement.service;

import de.hybris.platform.core.model.order.payment.CreditCardPaymentInfoModel;

import com.sap.hybris.sapbusinessagreement.model.BusinessAgreementModel;

/**
 *
 */
public interface BusinessAgreementCreateService {
    /**
 *
 */
    BusinessAgreementModel createBusinessAgreementModel(
            CreditCardPaymentInfoModel creditCardPaymentInfoModel);
}