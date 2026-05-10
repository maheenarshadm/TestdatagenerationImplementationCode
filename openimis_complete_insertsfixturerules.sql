

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 12, '2025-03-26', '2027-03-26', 1483.1000, 3, 852.1800, 749.6500, 8000, 64, 0, 18, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-11-02', '2024-11-06', '2027-10-01', 2, 7764.3500, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-04-02', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1246.9400, 'RCPT0001', '2025-12-29', 'M', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-07-11', '2025-07-14', 1, 11, 5714.4100, 2554.5100, 3589.7900, '2025-07-12', 8, 9, 1, 5, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 1, 1, 9.7600, 0.6800, 1108.5600, 1577.9700, 5, 500, 72.3300, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 4, 1, 1, 8.3600, 5.6900, 526.7400, 1897.8800, 1, 484.9700, 76.0300, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 2, 2.4600, 3.5500, 1343.6500, 1403.6400, 0, 341.7700, 14.2800, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 3, 2, 2.4700, 3.7900, 1854.1700, 1023.7900, 0, 278.4700, 145.4700, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 20, '2025-03-26', '2026-03-26', 856.0200, 8, 168.9700, 861.5800, 1809.1300, 0, 126, 17, 7, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1976-11-05', 'F', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-05-04', '2025-06-21', '2028-03-06', 2, 9437.4100, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-24', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 686.9500, 'RCPT0001', '2026-03-24', 'M', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-06-03', '2025-06-09', 1, 12, 10000, 4383.2800, 2694.8000, '2025-06-07', 6, 13, 16, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 2, 1, 1.1600, 5.7100, 1182.7000, 1507, 0, 266.1700, 85.5000, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 3, 2, 6.0800, 9.2000, 296.7200, 49.0900, 0, 407.8100, 82.9200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, 2.1400, 3.6000, 719.9100, 142.9000, 0, 97.9600, 0, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 9, '2025-03-26', '2027-03-26', 1792.7700, 5, 1881.5500, 350.2100, 8891.7400, 75, 28, 13, 4, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-09-15', '2024-09-15', '2027-08-16', 9, 1694.6600, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1430.2700, 'RCPT0001', '2025-11-05', 'B', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-05-07', '2025-05-07', 1, 4, 8500, 5500, 8740.4700, '2025-05-07', 5, 12, 5, 3, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 2, 1, 6.5200, 4.7000, 1227.5400, 1110.8700, 5, 216.1900, 105.1000, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 2, 4, 1, 5.3000, 3.6000, 514.8000, 611.7400, 2, 229.8500, 173.7800, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, 4.1000, 3.8800, 329.0600, 729.1600, 0, 459.9800, 41.9000, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 10, 1, 4.2400, 7.2000, 1896.7600, 344.6400, 0, 55.6800, 87.3000, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 18, '2025-03-26', '2027-03-26', 995.2600, 10, 1696.2400, 121.1200, 19366.6700, 78, 90, 9, 10, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-02-24', '2026-02-24', '2027-01-02', 2, 6096.2500, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1449.1900, 'RCPT0001', '2026-02-21', 'C', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-07-26', '2025-07-26', 1, 8, 500, 3291.3000, 254.4700, '2025-07-26', 4, 7, 6, 1, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 2, 1, 1.6000, 0.2300, 1054.6900, 1004.0500, 5, 222.3200, 35.5700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 4, 3, 1, 7.8600, 6.6100, 282.7000, 737.4500, 0, 471.1600, 8.4300, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 4, 9.1300, 5.5300, 1466.2400, 1938.4800, 0, 216.9300, 130.2300, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 10, 4, 9.6400, 3.1700, 644.0400, 1101.0200, 0, 394.0400, 84.3700, '2026-03-26', 1);





  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 10, '2025-11-20', '2025-04-24', 416.3600, 8, 685.9600, 700.9700, 8104.6600, 47, 134, 0, 1, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-04', 'M', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-09-15', '2024-10-04', '2027-09-12', 2, 8073.8600, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-08-14', '2025-08-15', 1, 1, 6638.5500, 2450.9300, 7818.8300, '2025-08-14', 8, 13, 9, 3, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 2, 1, 1.9200, 3.0700, 46.8700, 687.5300, 4, 235.8700, 181.6400, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 2, 3, 1, 2.9700, 5.9000, 1620.9300, 806.9800, 1, 1.0300, 64.2800, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 3, 1.8600, 7.3200, 613.6300, 257.9000, 1, 311.2600, 161.2800, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 2, 1, 4.4800, 1.4900, 1055.9900, 1709.5600, 0, 175.1300, 32.3800, '2026-03-26', 1);


-

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-03-26', '2027-03-26', 307.0900, 1, 202.3200, 802.7100, 15979.8300, 26, 129, 10, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 1, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-08-05', '2025-08-05', '2027-09-03', 14, 5077.8600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2024-08-02', '2024-08-02', '2026-05-29', 12, 2525.5700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-01-24', '2025-01-24', '2026-03-14', 8, 7122.6600, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 5, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 7, '2025-03-26', '2027-03-26', 1177.7500, 8, 170.4800, 297.3700, 13549.5900, 18, 11, 1, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1984-12-28', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 1, 'CHF000005', 'TestLast', 'TestFirst', '1987-09-22', 'M', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-06-16', '2024-06-16', '2027-01-05', 12, 3000.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2026-01-24', '2026-01-24', '2025-07-08', 15, 4745.5600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-07-18', '2025-11-15', '2027-09-03', 2, 6041.6600, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-29', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-21', '2027-04-04', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 5, 1, '2026-03-26', '2025-03-10', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1638.5100, 'RCPT0001', '2026-02-14', 'B', 1, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 22, '2025-03-26', '2027-03-26', 101.6300, 4, 1280.4800, 864.1700, 11318.1500, 36, 0, 1, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'D', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 1, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-04-11', '2024-04-11', '2028-02-18', 2, 4838.8900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2026-02-05', '2026-02-05', '2027-05-22', 5, 5725.2100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2024-09-19', '2024-09-19', '2026-07-29', 7, 4588.3500, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 5, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 150, 'RCPT0001', '2025-11-01', 'C', 1, '2026-03-26', 1);


-

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 13, '2025-03-26', '2027-03-26', 594.8200, 3, 354.3000, 894.1800, 10121.0700, 44, 27, 11, 2, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 1, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-12-09', '2025-12-09', '2027-12-14', 5, 5084.9700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-08-13', '2025-08-13', '2026-07-25', 2, 5299.8500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2024-12-10', '2024-12-10', '2027-07-07', 13, 2291.6100, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 5, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1902.4200, 'RCPT0001', '2026-03-24', 'M', 1, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 22, '2025-03-26', '2027-03-26', 217.3500, 5, 475.2400, 851.4300, 12349.1400, 4, 105, 14, 14, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'H', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 1, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (6, 1, 'CHF000006', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-05-06', '2025-05-06', '2025-05-28', 2, 5466.7300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2024-12-31', '2024-12-31', '2026-06-05', 14, 6253.0300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2024-06-13', '2024-06-13', '2026-03-07', 6, 3480.5500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (4, 1, 1, 1, '2025-12-02', '2025-12-02', '2025-12-16', 4, 6010.6800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (5, 1, 1, 1, '2024-11-10', '2024-11-10', '2025-12-16', 4, 3664.2400, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 5, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (8, 1, 4, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (9, 1, 5, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 6, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 20, '2025-03-26', '2027-03-26', 1073.6000, 1, 1891.5000, 838.5000, 1509.8600, 62, 67, 0, 5, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-02-08', '2026-02-08', '2026-05-07', 12, 7048.7400, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-24', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 253.1100, 'RCPT0001', '2026-01-26', 'M', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-05-22', '2025-05-22', 1, 16, 500, 500, 8171.0700, '2025-05-22', 8, 8, 8, 0, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 3, 4, 1, 6.8900, 8.3400, 1808.0600, 876.2400, 0, 484.4300, 140.7600, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 4, 1, 4.9100, 4.4700, 336.6800, 1667.6900, 0, 7.8000, 122.0600, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 4, 1, 9.7300, 9.8800, 436.2000, 1393.1000, 0, 296.5200, 197.5700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 5, 1, 6.1000, 0.7800, 1526.2400, 512.5000, 0, 356.2700, 20.4100, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 1, 8.1800, 5.8800, 395.8200, 460.9600, 0, 293.8400, 55.5200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 10, 1, 1.4400, 3.9800, 585.6700, 1164.7300, 0, 179.0600, 96.3300, '2026-03-26', 1);


-
  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 790.7000, 9, 412.7500, 709.1800, 7311.8000, 33, 171, 9, 4, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-12-13', '2025-12-13', '2025-04-14', 10, 4952.5000, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1042.5700, 'RCPT0001', '2025-11-13', 'M', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-01-20', '2026-01-20', 1, 4, 300, 150, 3737.0400, '2026-01-20', 2, 4, 4, 5, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 2, 1, 9.1800, 9.1600, 509.3300, 144.4300, 2, 76.4300, 89.9700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 3, 1, 9.0400, 2.1600, 343.8200, 1838.8900, 3, 267.3400, 134.5900, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 4, 1, 3.4200, 4.6900, 90.9300, 1321.9500, 0, 66.3500, 141.1600, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 10, 1, 5.5600, 5.3400, 1123.7700, 742.8100, 0, 239.6300, 93.8600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 4, 1, 6.9500, 4.1500, 864.9300, 1636.7700, 0, 154.6000, 23.4800, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 2, 2.9200, 7.3700, 1259.0800, 1620.9000, 0, 448.7800, 61.7100, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 8, '2025-03-26', '2027-03-26', 1163.6800, 4, 1532.0800, 201.6100, 8248.4600, 48, 130, 1, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-05-30', '2025-05-30', '2026-02-22', 4, 2117, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 465.9800, 'RCPT0001', '2026-03-14', 'C', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-03-08', '2026-03-08', 1, 2, 400, 0, 1793.3700, '2026-03-08', 1, 2, 1, 5, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 1, 1, 1.9800, 0.7700, 1929.2000, 653.0200, 5, 276.4100, 151.1400, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 2, 4, 1, 5.5000, 6.4600, 1262.5000, 1753, 0, 345.2500, 29.5700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 1, 1, 5.2300, 8.7700, 1382.4400, 507.2800, 4, 107.2600, 84.4400, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 7, 4, 7.7900, 6.1300, 531.9100, 1081.4800, 0, 419.1600, 36.3200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 4, 2, 4.0800, 4.7800, 965.5900, 627.7200, 0, 361.7100, 168.7300, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 8, 1, 9.3900, 9.9400, 1212.0300, 1975.7300, 0, 495.0500, 42.3900, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 12, '2025-03-26', '2027-03-26', 1318.6400, 4, 840.5000, 803.8400, 18997.3600, 3, 112, 8, 1, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-11-19', '2024-11-19', '2026-08-31', 9, 7634.1300, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 402.4100, 'RCPT0001', '2026-01-31', 'M', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-12-29', '2025-12-29', 1, 1, 700, 0, 2728.7900, '2025-12-29', 8, 16, 16, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 3, 1, 2.5400, 5.5700, 1518.2300, 197.0400, 1, 275.8800, 85.0600, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 4, 1, 8.5000, 8.9100, 646.0300, 1030.7600, 1, 334.7400, 189.4800, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 1, 1, 4.2400, 1.3800, 1265.8200, 745.3600, 4, 263.6200, 189.9700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 2, 4.9300, 5.9100, 695.4100, 1006.6800, 0, 56.1600, 75.4400, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 5, 2, 1.5600, 3.8800, 1751.1200, 1104, 0, 185.7400, 49.5400, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 5, 2, 8.8200, 4.7000, 1269.5900, 92.7000, 0, 233.2900, 87.9400, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 23, '2025-03-26', '2027-03-26', 168.1300, 7, 1459.2000, 874.9700, 12895.2900, 54, 175, 16, 11, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-06-10', '2024-06-10', '2027-10-24', 1, 5943.4500, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 759.0600, 'RCPT0001', '2026-03-15', 'C', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-05-11', '2025-05-11', 1, 4, 6000, 5500, 779.3900, '2025-05-11', 3, 0, 7, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 5, 2, 1, 3.0100, 5.5900, 1739.3700, 1469.4300, 5, 327.7400, 85.6900, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, 8.2600, 5.3100, 1000, 900, 0, 25, 189.1600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, 9.1100, 2.3300, 1000, 900, 0, 25, 165.6900, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 1, 6.4500, 4.2500, 1000, 900, 0, 25, 109.0500, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 1, 9, 1, 1.2800, 6.4700, 1000, 900, 0, 25, 160.1200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (5, 1, 3, 1, 5, 6.6100, 1000, 900, 0, 25, 192.0800, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (6, 1, 1, 1, 5.7800, 0.4100, 1000, 900, 0, 25, 41.1800, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 2, '2025-03-26', '2027-03-26', 1981.2100, 3, 223, 52.6900, 5104.8100, 55, 32, 16, 0, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-09-24', '2024-09-24', '2026-07-04', 2, 9534.7700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-12-22', '2025-12-22', '2026-03-02', 2, 7728.3100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-04-07', '2025-04-07', '2025-12-22', 2, 4125.4800, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 433.3300, 'RCPT0001', '2025-11-18', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 433.3300, 'RCPT0002', '2025-10-29', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 1, 433.3300, 'RCPT0003', '2025-11-25', 'M', 1, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 2, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-02-24', '2026-03-26', 1, 1, 1, 4, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (3, '2026-02-24', '2026-03-26', 1, 1, 1, 5, 2, 1, '2026-03-26');




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 7, '2025-03-26', '2027-03-26', 345.1300, 7, 657.2800, 835.4100, 3488.5200, 33, 138, 10, 15, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-11-04', '2025-11-04', '2026-03-16', 4, 8595.5400, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1060.6200, 'RCPT0001', '2025-10-02', 'B', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-27', 1, 1, 1, 5, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-04-19', '2026-03-27', 1, 1, 1, 1, 2, 1, '2026-03-26');



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 14, '2025-03-26', '2027-03-26', 58.2000, 4, 132.5700, 680, 6385.5700, 12, 23, 13, 6, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-08-16', '2024-08-16', '2027-07-08', 16, 2116.6500, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 80, 'RCPT0001', '2026-01-07', 'C', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 4, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-02-24', '2026-03-26', 1, 1, 1, 3, 1, 1, '2026-03-26');




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 18, '2025-03-26', '2027-03-26', 1264.1000, 8, 1568.7700, 954.9300, 18467.4300, 21, 36, 8, 10, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-10-01', '2024-10-01', '2026-06-24', 1, 3492.5800, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 3, '2025-03-26', '2027-03-26', 692.1800, 10, 105.7700, 674.3800, 3981.7800, 58, 30, 14, 15, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-03-20', '2026-03-20', '2025-12-16', 4, 4003.5300, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 18, '2025-03-26', '2027-03-26', 363.2200, 3, 1402.4800, 332.3100, 18308.9300, 48, 50, 0, 5, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-05-12', '2024-05-12', '2027-11-29', 8, 2585.9400, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 69.4600, 'RCPT0001', '2026-03-20', 'C', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-10-30', '2025-10-30', 1, 2, 300, 0, 0, '2025-10-30', 2, 0, 0, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 2, 1, 5.9700, 9.2000, 1454.9900, 335.3600, 3, 94.7500, 9.1000, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 10, 4, 1, 6.0900, 0.0900, 1180.0200, 1663.9900, 1, 12.7600, 20.8900, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 2, 4, 1, 8.9600, 2.2300, 980.4100, 1259.8800, 1, 139.2300, 88.8900, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 1, 6.2000, 6.8400, 1037.6900, 1506.2000, 0, 218.8200, 143.0600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 5, 2, 3.6100, 8.8000, 1139.0500, 371.1700, 0, 15.0300, 58.9900, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 5, 1, 9.2700, 1.7600, 1570.3700, 286.6900, 0, 404.2500, 189.4700, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 17, '2025-03-26', '2027-03-26', 1391.2700, 4, 1233.0500, 80.9100, 10195.2700, 73, 169, 9, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-08-12', '2025-08-12', '2027-05-15', 14, 4271.0700, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1901.9100, 'RCPT0001', '2026-03-08', 'B', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-09-17', '2025-09-17', 1, 4, 600, 600, 7089.8200, '2025-09-17', 5, 4, 4, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 1, 1, 5.2200, 8.4900, 1349.1000, 759.0400, 0, 434.3700, 4.1700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 6, 4, 1, 4.8600, 2.7000, 1735.4300, 1275.9300, 0, 498.6000, 4.1700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 4, 1, 9.9000, 3.9000, 808.6300, 1840.8000, 0, 202.8100, 4.1700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 4, 1, 7.4800, 2.6200, 1925.2200, 1576.2300, 0, 460.1000, 4.1700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, 4.3100, 7.8800, 894.2800, 264.5600, 0, 452.0800, 4.1700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, 5.5600, 9.8100, 1315.2500, 1443.5900, 0, 301.0800, 4.1700, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 1, '2025-03-26', '2027-03-26', 739.8000, 7, 933.6500, 305.4700, 12099.9600, 8, 42, 6, 8, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'D', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-12-03', '2024-12-03', '2025-04-10', 10, 660.0500, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2026-02-18', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1522.3700, 'RCPT0001', '2026-02-01', 'C', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-11-16', '2025-10-01', 1, 16, 1893.6200, 4361.5800, 1000, '2025-11-19', 1, 11, 8, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 7, 4, 1, 3.1200, 6.4700, 766.5500, 1211.6800, 0, 476.2700, 3.3300, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 5, 1, 1, 6.6600, 4.1400, 1168.1400, 221.4600, 0, 285.5200, 0, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 3, 1, 7.2900, 1.4300, 953.0600, 634.7000, 0, 300.0700, 3.3300, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 1, 8.2600, 4.1300, 703.0300, 778.8800, 5, 402.3400, 139.3700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 2, 6.9700, 5.6500, 1561.4100, 269.5600, 2, 9.8300, 3.3300, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 1, 7.0800, 7.6300, 841.3200, 1282.3500, 0, 157.8200, 3.3300, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 23, '2026-02-19', '2027-03-26', 674.7700, 9, 1786.3900, 298.0400, 16722.2800, 32, 141, 13, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1972-11-17', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-02-20', '2025-03-29', '2026-03-31', 10, 4073.3900, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-25', '2027-03-17', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 211.5000, 'RCPT0001', '2026-01-13', 'C', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-04-02', '2026-01-22', 1, 1, 6872.9600, 0, 3623.0800, '2026-01-15', 1, 9, 12, 2, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 4, 1, 1, 5.0200, 1391.9700, 638.3600, 0, 371.4500, 86.8500, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 4, 1, 5.9400, 9.4900, 291.2600, 772.5000, 2, 116.1200, 75.3300, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 2, 2, 1, 8.2200, 4.1800, 1992.0200, 2000, 5, 76.6500, 197.2200, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 3, 2, 2.3400, 0, 182.8700, 712.5400, 1, 215.6600, 156.4000, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 4, 1, 5.0500, 2.6300, 855.5700, 1024.9300, 0, 498.3500, 56.1700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 5, 4, 5.3600, 4.7100, 955.5300, 1545.2800, 4, 375.8200, 47.7400, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 899.8700, 9, 855.1700, 975.6800, 19321.3300, 5, 157, 0, 2, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-07-27', '2025-04-03', '2027-06-06', 16, 2750.4400, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-05-12', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1295.9800, 'RCPT0001', '2025-04-20', 'C', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-02-08', '2025-11-20', 1, 2, 6938.3600, 7915.9800, 5881.2400, '2025-11-24', 0, 4, 14, 0, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 10, 2, 1, 10, 6.3200, 301.2200, 1688.5600, 2, 242.0900, 3.4400, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 2, 1, 1, 8.7200, 8.3200, 308.5100, 1796.9400, 2, 253.7700, 39.6100, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 7, 2, 1, 5.4300, 2.0800, 1518.3600, 715.9900, 3, 335.2500, 106.2700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 10, 3, 6.7700, 4.8400, 1518.8200, 603.9600, 1, 101.1800, 7.8600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 3, 7.5200, 4.4600, 1928.4100, 1313.5600, 0, 29, 114.2400, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 3, 1, 4.0600, 1.5700, 770.7300, 62.7800, 1, 321.6200, 16.4400, '2026-03-26', 1);


-

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 118.1600, 4, 346.2800, 979.4700, 3878.4400, 41, 38, 2, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-10-27', '2025-10-27', '2027-04-01', 2, 5442.7500, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 965.1200, 'RCPT0001', '2026-03-12', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 1603.4900, 'RCPT0002', '2025-11-28', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 1, 1325.6800, 'RCPT0003', '2026-03-07', 'M', 0, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 1338.2700, 4, 1493.1700, 286.6500, 10941.8800, 64, 147, 2, 6, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-10-12', '2025-10-12', '2026-05-05', 2, 8089.7900, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1927.4200, 'RCPT0001', '2026-02-03', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 1139.8800, 'RCPT0002', '2026-02-19', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 1, 1933.7500, 'RCPT0003', '2025-12-29', 'M', 0, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 17, '2025-03-26', '2027-03-26', 1722.5700, 8, 633.7100, 368.1000, 1282.3500, 23, 132, 10, 7, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-03-08', '2025-03-08', '2025-09-29', 2, 7783.0600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-03-20', '2025-03-20', '2025-11-28', 2, 5138.5000, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 400, 'RCPT0001', '2025-10-21', 'B', 1, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 7, '2025-03-26', '2027-03-26', 759.8300, 2, 1744.5800, 377.8400, 15395.7500, 84, 161, 9, 15, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-09-02', '2024-09-02', '2027-07-05', 16, 5598.2900, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, ValidityTo, AuditUserID) VALUES (1, 1, 200, 'RCPT0001', '2025-12-01', 'B', 1, '2026-03-26', '2026-02-24', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 6, '2025-03-26', '2027-03-26', 1705.9000, 10, 1769.4900, 577.6500, 20000, 40, 82, 6, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-04', 'M', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-07-17', '2024-07-16', '2025-06-16', 4, 7112.3300, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2024-08-20', '2027-03-23', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 0, 'RCPT0001', '2026-01-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 1900.0100, 'RCPT0002', '2026-03-11', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 1, 1680.4700, 'RCPT0003', '2025-05-28', 'C', 1, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 24, '2025-03-26', '2027-03-26', 1036.8000, 3, 1602.4700, 225.3800, 9739.0100, 27, 85, 17, 10, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-05-14', '2024-05-14', '2026-01-23', 2, 4482.8700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-09-06', '2025-09-06', '2026-01-30', 3, 4209.9800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2024-06-10', '2024-06-10', '2025-06-19', 9, 1564.2600, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1402.7100, 'RCPT0001', '2026-01-30', 'M', 1, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 13, '2025-03-26', '2027-03-26', 206.8300, 4, 583.1100, 619.9500, 16887.8500, 0, 73, 20, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-09-24', '2025-09-24', '2027-08-23', 1, 556.7800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-12-28', '2025-12-28', '2027-10-06', 2, 9705.0300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2026-01-11', '2025-02-09', '2027-05-16', 2, 4270.3600, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-28', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 88.6000, 'RCPT0001', '2026-01-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 577.4100, 'RCPT0002', '2026-02-27', 'C', 0, '2026-03-26', 1);


-

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 14, '2025-03-26', '2027-03-26', 1085.8100, 6, 403.4000, 53.8600, 13181.3200, 79, 143, 9, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-06-16', '2025-06-16', '2027-05-10', 1, 6170.3700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-04-30', '2025-04-30', '2027-05-22', 12, 708.1500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-06-21', '2025-06-21', '2026-12-21', 4, 6199, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 17, '2025-03-26', '2027-03-26', 596.2800, 8, 1073.2100, 119.8900, 14467.5200, 10, 61, 0, 3, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-08-24', '2024-08-24', '2025-12-13', 4, 2760.9500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2026-01-07', '2026-01-07', '2027-08-11', 10, 1228.1200, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-04-07', '2025-04-07', '2025-08-16', 10, 6916.0500, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 312.8700, 'RCPT0001', '2026-03-06', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 955.8400, 'RCPT0002', '2025-11-02', 'M', 1, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 10, '2025-03-26', '2027-03-26', 1807.7800, 1, 1295.9500, 931.7300, 6482.7300, 78, 15, 1, 6, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 1, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 1, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 1, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-06-21', '2024-06-21', '2026-07-20', 7, 716.2500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-03-26', '2025-03-26', '2027-06-01', 12, 1239.2200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2025-11-09', '2025-11-09', '2025-07-21', 2, 4433.1600, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 2, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 3, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 4, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 287.7900, 'RCPT0001', '2026-01-19', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 84.2800, 'RCPT0002', '2026-03-17', 'M', 1, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 3, '2025-03-26', '2027-03-26', 1273.4800, 9, 495.6100, 716.1300, 4796.9000, 53, 164, 3, 5, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'C', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1984-12-27', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-09-18', '2025-10-10', '2026-06-29', 6, 944.7800, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1322.6800, 'RCPT0001', '2026-01-24', 'B', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-09-04', '2025-09-02', 1, 16, 5372.0900, 5000, 2854.4800, '2025-09-04', 8, 8, 0, 3, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 4, 1, 1, 7.7100, 4.2300, 521.4300, 1940.6400, 0, 45.2600, 198.7000, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 4, 6.0800, 6.2400, 979.3400, 1354.3400, 0, 415.4300, 38.3300, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 3, 1, 3.9700, 0.2900, 207.9700, 347.8000, 0, 368.7100, 64.3700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 8, 4, 5.4300, 8.1400, 1628.7600, 967.7200, 0, 337.5100, 43.8600, '2026-03-26', 1);


--

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 762.9400, 2, 1814.5700, 954.2100, 3651.8300, 44, 126, 1, 14, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-07-15', '2025-07-15', '2025-09-05', 15, 4546.3800, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 906.4200, 'RCPT0001', '2025-10-20', 'C', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-12-25', '2025-12-25', 1, 4, 1501.0900, 8145.3200, 7146.6700, '2025-12-25', 2, 12, 15, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 1, 1, 8.0100, 0.5100, 179.6900, 1836.5700, 5, 248.9300, 197.3600, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 5, 3, 1, 7.5000, 4.7900, 1075.9700, 1222.1400, 0, 210.8000, 11.6600, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 3, 2.7100, 2, 1391.5200, 260, 0, 299.1400, 102.9400, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 3, 2.6000, 5.4100, 305.8100, 861.7600, 0, 341.4200, 132.5500, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 8, 3, 6.9600, 3.7800, 836.1600, 220.8400, 0, 43.6300, 63.3700, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 12, '2025-03-26', '2027-03-26', 1703.2100, 5, 647.0400, 283.7300, 11378.0400, 5, 116, 8, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-05-08', '2024-05-08', '2027-01-16', 10, 7477.9200, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1875.7900, 'RCPT0001', '2026-01-16', 'B', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-11-07', '2025-11-07', 1, 2, 1500, 150, 8876.4300, '2025-11-07', 0, 0, 14, 5, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 3, 1, 3.3800, 0.4900, 132.9300, 0, 1, 365.1700, 180.1200, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 3, 1, 4.8600, 1.6000, 1347.0900, 0, 2, 398.3600, 99.6700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 1, 1, 4.8600, 5.9600, 894.0800, 0, 3, 211.5400, 196.8200, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 1, 3, 2, 1, 5.5100, 1.7300, 348.5700, 0, 4, 219.6900, 22.0700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 3, 6.8300, 9.8100, 1802.0700, 957.0600, 0, 291.5900, 29.0900, '2026-03-26', 1);



  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 12, '2025-03-26', '2027-03-26', 1703.2100, 5, 647.0400, 283.7300, 11378.0400, 5, 116, 8, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-05-08', '2024-05-08', '2027-01-16', 10, 7477.9200, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1875.7900, 'RCPT0001', '2026-01-16', 'B', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-11-07', '2025-11-07', 1, 2, 2500, 150, 8876.4300, '2025-11-07', 0, 0, 14, 5, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 3, 1, 3.3800, 0.4900, 132.9300, 0, 1, 365.1700, 180.1200, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 3, 1, 4.8600, 1.6000, 1347.0900, 0, 2, 398.3600, 99.6700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 9, 1, 1, 4.8600, 5.9600, 894.0800, 0, 3, 211.5400, 196.8200, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 1, 3, 2, 1, 5.5100, 1.7300, 348.5700, 0, 4, 219.6900, 22.0700, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 3, 6.8300, 9.8100, 1802.0700, 957.0600, 0, 291.5900, 29.0900, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 4, '2025-03-26', '2026-03-26', 1207.0500, 2, 1599.9200, 352.8400, 8616.6100, 46, 134, 19, 7, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-06-03', '2025-05-30', '2027-03-13', 7, 5094.9200, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2026-08-18', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 794.7400, 'RCPT0001', '2025-12-28', 'C', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-11-21', '2026-02-26', 1, 13, 6923.9000, 4648.3000, 1677.0300, '2026-02-26', 8, 9, 4, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 3, 1, 9.6900, 8.3700, 634.9800, 37.8500, 0, 0, 16.0300, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 5, 3, 1, 9.2100, 2.3100, 1088.7300, 1020.2400, 1, 337.2100, 183.8900, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 9, 1, 4.9800, 6.5800, 148.2200, 820.8200, 0, 182.8400, 111.0200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 4, 9.6400, 4.4900, 1429.9300, 1107.5100, 0, 301.1300, 200, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 2, 3, 6.4100, 7.8100, 1457.8200, 1378.3200, 0, 465.5400, 200, '2026-03-26', 1);




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 9, '2025-03-26', '2027-03-26', 1835.7400, 3, 764.5200, 888.9200, 15524.7900, 4, 8, 16, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'D', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-08-01', '2024-08-01', '2026-04-05', 2, 8511.5300, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-24', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1495.4600, 'RCPT0001', '2025-11-30', 'C', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-21', '2026-03-24', 1, 1, 1, 0, 3, 1, '2026-03-26');




  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 1382.1500, 1, 1135.5700, 119.4900, 4721.0100, 19, 41, 6, 8, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-07-01', '2024-07-01', '2026-03-31', 2, 8500.0500, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 1, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-02-24', '2026-03-26', 1, 1, 1, 3, 1, 1, '2026-03-26');


  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 17, '2025-03-26', '2027-03-26', 1539.3000, 3, 1533.5300, 835.0400, 13459.2700, 66, 132, 12, 11, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-09-03', '2025-09-03', '2026-02-24', 4, 734.8900, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 400, 'RCPT0001', '2026-03-22', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 400, 'RCPT0002', '2025-11-05', 'M', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 3, 3, 1, '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : renew_BLOCKED
-- DT          : DT6_RenewalDecision
-- OUTPUT      : BLOCKED
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{"=": ["policyStatus", 4]}, {">=": ["daysAfterExpiry", 90]}, {"=": ["renewalCount", 0]}]}
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : policyStatus=4 (need = 4) | daysAfterExpiry=196 (need >= 90) | renewalCount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 9 rows across 9 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-11-01', '2027-03-26', 1461.8500, 6, 1993.4300, 834.6100, 1935.1800, 66, 92, 18, 15, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-07-27', '2025-07-25', '2025-09-11', 4, 9009.9400, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2024-05-28', '2027-03-29', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1413.5400, 'RCPT0001', '2025-10-10', 'B', 0, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : renew_INELIGIBLE
-- DT          : DT6_RenewalDecision
-- OUTPUT      : INELIGIBLE
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{"=": ["policyStatus", 16]}, {">=": ["unpaidPremiumCount", 3]}, {">=": ["activePolicyCount"
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : policyStatus=16 (need = 16) | unpaidPremiumCount=3 (need >= 3) | activePolicyCount=2 (need >= 2)
-- ----------------------------------------------------------------------
-- Fixture: 10 rows across 8 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 3 rows
--   tblInsureePolicy: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-03-26', '2027-03-26', 1288.6800, 3, 926.1300, 108.8200, 1276.0500, 67, 130, 14, 7, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'C', 'B', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-01-08', '2026-01-08', '2027-11-28', 16, 1477.5900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2024-10-07', '2024-10-07', '2027-12-18', 2, 239.8600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2024-05-16', '2024-05-16', '2025-12-04', 2, 5811.3400, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');


-- ========================================================================
-- DECISION TABLE: DT7_FraudDetection
-- Rules: 5
-- ========================================================================

-- ----------------------------------------------------------------------
-- RULE ID     : fraud_DUPLICATE
-- DT          : DT7_FraudDetection
-- OUTPUT      : DUPLICATE
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{">=": ["claimCountSameDay", 3]}, {"=": ["visitType", 1]}, {">=": ["totalClaimedAmount", 10
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : claimCountSameDay=3 (need >= 3) | visitType=1 (need = 1) | totalClaimedAmount=4557.5 (need >= 1000.0) | cardIssued=1 (need = 1)
-- ----------------------------------------------------------------------
-- Fixture: 16 rows across 12 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblClaim: 3 rows
--   tblClaimItems: 1 row
--   tblClaimServices: 3 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 14, '2025-08-16', '2025-09-03', 1328.5800, 4, 709.5700, 269.7100, 16694.8000, 17, 144, 2, 11, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1989-05-19', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-11-27', '2024-10-21', '2028-01-19', 14, 9988.6300, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2025-11-20', '2028-02-10', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1263.0200, 'RCPT0001', '2026-01-14', 'C', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-09-29', '2026-01-19', 1, 1, 4557.5000, 3991.8000, 7206.7600, '2025-09-26', 2, 16, 1, 4, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 'CLM00002', '2025-09-29', '2025-12-15', 1, 12, 3267.9600, 7507.1800, 9484.0500, '2025-07-31', 7, 3, 12, 5, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 'CLM00003', '2025-09-29', '2025-11-23', 1, 13, 10000, 5650.2100, 8595.3100, '2025-09-03', 7, 13, 5, 0, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 4, 4, 1, 8.2700, 6.4400, 1009.4800, 1274.6500, 2, 26.1600, 167.4800, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 2, 5.3500, 8.8200, 10, 1175.4100, 0, 76, 34.4900, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 4, 8.0400, 8.0800, 784.5400, 1923.6800, 1, 309.1900, 27.1100, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 2, 3.8500, 3.7900, 2000, 1381.7500, 0, 411.1100, 117.8800, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : fraud_OVERCHARGE
-- DT          : DT7_FraudDetection
-- OUTPUT      : OVERCHARGE
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{">=": ["priceAskedVsApprovedRatio", 3.0]}, {">=": ["claimServiceCount", 3]}, {">=": ["tota
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : priceAskedVsApprovedRatio=6.1578 (need >= 3.0) | claimServiceCount=3 (need >= 3) | totalClaimedAmount=4495.14 (need >= 2000.0) | feedbackStatus=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 20 rows across 12 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblClaim: 3 rows
--   tblClaimItems: 3 rows
--   tblClaimServices: 5 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 9, '2025-03-26', '2026-03-26', 67.4100, 4, 1830.0900, 278.8400, 17720.5300, 51, 108, 18, 5, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1973-07-27', 'M', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-04-24', '2025-04-23', '2027-04-25', 16, 9432.7800, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1675.0500, 'RCPT0001', '2026-03-17', 'B', 1, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-02-03', '2025-06-15', 1, 3, 4495.1400, 8843.8100, 1682.3400, '2025-08-12', 0, 1, 16, 2, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 'CLM00002', '2025-05-30', '2025-05-30', 1, 15, 7152.4100, 4624.6500, 2376.8700, '2025-06-04', 2, 9, 0, 2, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 'CLM00003', '2025-09-22', '2025-09-26', 1, 13, 6500.8900, 7873.9100, 5789.8100, '2025-09-29', 4, 11, 7, 1, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 5, 3, 1, 9.8700, 5.1300, 1531, 848.8400, 1, 204.2600, 159.3800, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 2, 9, 3, 1, 8.9700, 6.4700, 1557.1100, 81.7300, 2, 131.6900, 127.0400, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 3, 3, 1, 1, 3.0600, 10, 1561.6300, 891.3200, 2, 161.3800, 88.9000, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 2, 1, 5.2800, 0.6000, 1149.4300, 105.6600, 0, 226.7900, 75.5600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 10, 3, 9.7800, 0.1800, 842.0900, 222.7800, 0, 349.8000, 73.6600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 3, 4, 8.8800, 9.1400, 2000, 319.7700, 0, 432.7500, 164.2400, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 2, 2, 4, 5.3200, 3.0100, 1818.9700, 1289.2900, 0, 296.8900, 199.2700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (5, 3, 9, 4, 1.9200, 7.8300, 864.9300, 1896.7800, 1, 308.8600, 163.7900, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : fraud_GHOST
-- DT          : DT7_FraudDetection
-- OUTPUT      : GHOST
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{"=": ["cardIssued", 0]}, {">=": ["totalClaimedAmount", 500.0]}, {"=": ["activePolicyCount"
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : cardIssued=0 (need = 0) | totalClaimedAmount=1588.27 (need >= 500.0) | activePolicyCount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 21 rows across 12 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblClaim: 3 rows
--   tblClaimItems: 4 rows
--   tblClaimServices: 5 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 7, '2025-03-26', '2027-03-26', 473.7000, 6, 1800.8200, 586.8300, 10966.1200, 83, 99, 3, 4, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-09-06', '2024-09-06', '2025-09-13', 16, 3878.6400, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1192.8100, 'RCPT0001', '2025-11-15', 'M', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-03-25', '2026-03-25', 1, 10, 1588.2700, 1363.8200, 8485.4900, '2026-03-25', 3, 12, 10, 0, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 'CLM00002', '2025-09-10', '2025-09-10', 1, 5, 6943.1700, 2758.8800, 2938.7800, '2025-09-10', 5, 11, 1, 4, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 'CLM00003', '2025-04-12', '2025-04-12', 1, 13, 1267.6300, 9734.6900, 9340.9400, '2025-04-12', 6, 2, 10, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 8, 3, 1, 7.1600, 8.1300, 431.6700, 857.9000, 3, 128.1600, 12.9700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 6, 3, 1, 1.6600, 6.3000, 1028.2800, 1471.9800, 3, 337.8500, 167.5700, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 2, 7, 1, 1, 4.8000, 2.5000, 415.6000, 394.8200, 2, 421.7500, 53.9900, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 3, 10, 4, 1, 6.1900, 1.5200, 1052.7600, 393.1700, 0, 26.9800, 27.5200, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 6, 1, 7.6600, 2.4400, 1262.8000, 525.8800, 0, 64.5900, 98.3900, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 1, 1.7800, 0.6100, 1131.9200, 318.7400, 0, 23.8400, 100.8700, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 4, 4, 4.1500, 8.1500, 1034.7600, 263.8200, 0, 452.2300, 128.5600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 2, 1, 3, 7.6100, 5.0300, 747.6700, 874.6000, 0, 386.8700, 144.1500, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (5, 3, 7, 1, 3.8400, 2.6400, 1692.4900, 1461.4900, 0, 407.2800, 29.3100, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : fraud_PHANTOM
-- DT          : DT7_FraudDetection
-- OUTPUT      : PHANTOM
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{">=": ["rejectedItemCount", 4]}, {">=": ["totalClaimedAmount", 3000.0]}, {"=": ["approvedA
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : rejectedItemCount=6 (need >= 4) | totalClaimedAmount=4500.0 (need >= 3000.0) | approvedAmount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 19 rows across 12 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblClaim: 1 row
--   tblClaimItems: 6 rows
--   tblClaimServices: 3 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'W');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 6, '2025-03-26', '2027-03-26', 1940.4800, 2, 206.7400, 930.7200, 14334.6900, 0, 36, 16, 2, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-09-06', '2025-09-06', '2026-07-14', 7, 2992.5100, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 954.9300, 'RCPT0001', '2025-09-29', 'M', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2025-06-19', '2025-06-19', 1, 1, 4500, 0, 3478.5900, '2025-06-19', 0, 4, 11, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 4, 1, 8.3700, 5.5600, 1733.6200, 0, 2, 265.6500, 163.1000, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 7, 3, 1, 5.8400, 5.4900, 213.9800, 0, 2, 473.4900, 28.9100, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 10, 1, 1, 5.1500, 1.5200, 1413.7300, 0, 2, 334.8800, 140.3000, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (4, 1, 8, 4, 1, 3.1900, 2.3500, 1714.1200, 0, 2, 34.3900, 91.5600, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (5, 1, 6, 1, 1, 6.4700, 3.8500, 1197.1800, 0, 2, 135.0200, 192.8200, '2026-03-26', 1);
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (6, 1, 10, 4, 1, 8.4400, 8.4200, 1311.2000, 0, 2, 384.5100, 158.5000, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 7, 1, 1.9400, 9.5000, 600, 0, 0, 470.6100, 143.8600, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (2, 1, 8, 1, 7.1000, 2.6300, 600, 0, 0, 471.6500, 56.8300, '2026-03-26', 1);
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (3, 1, 8, 4, 5.9000, 8.9800, 600, 0, 0, 79.6500, 35.7100, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : fraud_HIGH_FREQ
-- DT          : DT7_FraudDetection
-- OUTPUT      : HIGH_FREQ
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{">=": ["claimCountThisMonth", 8]}, {"=": ["visitType", 1]}, {">=": ["totalClaimedAmount", 
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : claimCountThisMonth=9 (need >= 8) | visitType=1 (need = 1) | totalClaimedAmount=2000.0 (need >= 1500.0) | hfLevel=1 (need = 1)
-- ----------------------------------------------------------------------
-- Fixture: 20 rows across 12 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblClaim: 9 rows
--   tblClaimItems: 1 row
--   tblClaimServices: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 13, '2025-03-26', '2027-03-26', 1249.5200, 1, 1613.0300, 753.8900, 11857.0900, 25, 44, 0, 9, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 0, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-09-03', '2025-09-03', '2026-06-22', 2, 1674.8200, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1342.1300, 'RCPT0001', '2025-10-02', 'B', 0, '2026-03-26', 1);
  -- tblClaim
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 'CLM00001', '2026-03-01', '2026-03-01', 1, 2, 2000, 2688.3000, 250.8300, '2026-03-01', 8, 7, 10, 0, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 'CLM00002', '2026-03-01', '2026-03-01', 1, 2, 2000, 3419.5000, 1421.8600, '2026-03-01', 2, 7, 2, 1, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 'CLM00003', '2026-03-01', '2026-03-01', 1, 2, 2000, 8985.2900, 3334.8300, '2026-03-01', 2, 12, 15, 3, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (4, 1, 1, 'CLM00004', '2026-03-01', '2026-03-01', 1, 2, 2000, 4305.8600, 9573.2900, '2026-03-01', 8, 4, 2, 1, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (5, 1, 1, 'CLM00005', '2026-03-01', '2026-03-01', 1, 2, 2000, 2512.0400, 9758.0100, '2026-03-01', 1, 6, 6, 2, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (6, 1, 1, 'CLM00006', '2026-03-01', '2026-03-01', 1, 2, 2000, 1167.3100, 3462.2000, '2026-03-01', 7, 7, 7, 4, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (7, 1, 1, 'CLM00007', '2026-03-01', '2026-03-01', 1, 2, 2000, 5222.9600, 8737.9700, '2026-03-01', 7, 5, 16, 3, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (8, 1, 1, 'CLM00008', '2026-03-01', '2026-03-01', 1, 2, 2000, 6749.4100, 5266.3200, '2026-03-01', 0, 2, 6, 2, '2026-03-26', 1);
  INSERT INTO tblClaim (ClaimID, InsureeID, HfID, ClaimCode, DateFrom, DateTo, ICDID, ClaimStatus, Claimed, Approved, Valuated, DateClaimed, FeedbackStatus, ReviewStatus, ApprovalStatus, RejectionReason, ValidityFrom, AuditUserID) VALUES (9, 1, 1, 'CLM00009', '2026-03-01', '2026-03-01', 1, 2, 2000, 5554.6700, 5290.4400, '2026-03-01', 5, 15, 2, 4, '2026-03-26', 1);
  -- tblClaimItems
  INSERT INTO tblClaimItems (ClaimItemID, ClaimID, ItemID, ClaimItemStatus, Availability, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 4, 1, 5.6700, 1.4500, 953.7200, 1455.3100, 1, 214.3900, 12.1800, '2026-03-26', 1);
  -- tblClaimServices
  INSERT INTO tblClaimServices (ClaimServiceID, ClaimID, ServiceID, ClaimServiceStatus, QtyProvided, QtyApproved, PriceAsked, PriceApproved, RejectionReason, ExceedCeilingAmount, DeductableAmount, ValidityFrom, AuditUserID) VALUES (1, 1, 9, 2, 2.5600, 0.1500, 595.6800, 834.7700, 0, 162.7700, 174.4600, '2026-03-26', 1);


-- ========================================================================
-- DECISION TABLE: DT8_ContribCollection
-- Rules: 5
-- ========================================================================

-- ----------------------------------------------------------------------
-- RULE ID     : contrib_MATCHED
-- DT          : DT8_ContribCollection
-- OUTPUT      : MATCHED
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{">=": ["receivedAmount", 100.0]}, {"=": ["paymentStatus", 4]}, {">=": ["matchedPremiumCoun
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : receivedAmount=2574.5 (need >= 100.0) | paymentStatus=4 (need = 4) | matchedPremiumCount=1 (need >= 1)
-- ----------------------------------------------------------------------
-- Fixture: 11 rows across 11 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblPayment: 1 row
--   tblPaymentDetails: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 17, '2025-03-26', '2027-03-26', 1278.2300, 2, 827.9200, 390.0700, 10922.9400, 80, 17, 18, 7, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'C', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-02-09', '2026-02-09', '2025-09-07', 7, 1484.3200, 'N', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1876.3100, 'RCPT0001', '2025-10-10', 'B', 1, '2026-03-26', 1);
  -- tblPayment
  INSERT INTO tblPayment (PaymentID, ExpectedAmount, ReceivedAmount, PaymentStatus, OfficerCode, ValidityFrom) VALUES (1, 437.9600, 2574.5000, 4, 'OFF001', '2026-03-26');
  -- tblPaymentDetails
  INSERT INTO tblPaymentDetails (PaymentDetailID, PaymentID, PremiumID, PolicyID, EnrolmentType, ValidityFrom) VALUES (1, 1, 1, 1, 'N', '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : contrib_OVERPAID
-- DT          : DT8_ContribCollection
-- OUTPUT      : OVERPAID
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{">=": ["receivedAmount", 100.0]}, {"=": ["paymentStatus", 4]}, {">=": ["overpaidAmount", 5
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : receivedAmount=1534.07 (need >= 100.0) | paymentStatus=4 (need = 4) | overpaidAmount=229.76 (need >= 50.0)
-- ----------------------------------------------------------------------
-- Fixture: 11 rows across 11 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblPayment: 1 row
--   tblPaymentDetails: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 21, '2025-03-26', '2027-03-26', 1977.1500, 8, 928.7100, 465.1300, 1523.6500, 50, 139, 17, 5, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'C', 'H', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-12-27', '2025-12-27', '2025-11-20', 4, 7007.8200, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 564.5300, 'RCPT0001', '2025-10-29', 'M', 0, '2026-03-26', 1);
  -- tblPayment
  INSERT INTO tblPayment (PaymentID, ExpectedAmount, ReceivedAmount, PaymentStatus, OfficerCode, ValidityFrom) VALUES (1, 1304.3100, 1534.0700, 4, 'OFF001', '2026-03-26');
  -- tblPaymentDetails
  INSERT INTO tblPaymentDetails (PaymentDetailID, PaymentID, PremiumID, PolicyID, EnrolmentType, ValidityFrom) VALUES (1, 1, 1, 1, 'N', '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : contrib_REJECTED
-- DT          : DT8_ContribCollection
-- OUTPUT      : REJECTED
-- CONDITIONS  : 2 condition(s)
-- WHEN        : {"and": [{"=": ["paymentStatus", 16]}, {">=": ["rejectedPaymentCount", 1]}]}
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : paymentStatus=16 (need = 16) | rejectedPaymentCount=1 (need >= 1)
-- ----------------------------------------------------------------------
-- Fixture: 11 rows across 11 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblPayment: 1 row
--   tblPaymentDetails: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'V');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 11, '2025-03-26', '2027-03-26', 1235.9400, 7, 1177.5900, 119.1400, 2493.1100, 78, 153, 8, 3, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'H', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-02-09', '2026-02-09', '2027-01-04', 1, 9519.7900, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1268.7100, 'RCPT0001', '2026-01-16', 'B', 0, '2026-03-26', 1);
  -- tblPayment
  INSERT INTO tblPayment (PaymentID, ExpectedAmount, ReceivedAmount, PaymentStatus, OfficerCode, ValidityFrom) VALUES (1, 4214.2500, 3249.1900, 16, 'OFF001', '2026-03-26');
  -- tblPaymentDetails
  INSERT INTO tblPaymentDetails (PaymentDetailID, PaymentID, PremiumID, PolicyID, EnrolmentType, ValidityFrom) VALUES (1, 1, 1, 1, 'N', '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : contrib_PARTIAL
-- DT          : DT8_ContribCollection
-- OUTPUT      : PARTIAL
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{">=": ["receivedAmount", 50.0]}, {"=": ["paymentStatus", 2]}, {"=": ["matchedPremiumCount"
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : receivedAmount=200.0 (need >= 50.0) | paymentStatus=2 (need = 2) | matchedPremiumCount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 11 rows across 11 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblPayment: 1 row
--   tblPaymentDetails: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 1, '2025-03-26', '2027-03-26', 86.6800, 6, 1092.3800, 718.9200, 18175.7800, 50, 172, 18, 12, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-12-16', '2024-12-16', '2027-11-15', 11, 8502.3000, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1773.9100, 'RCPT0001', '2025-11-13', 'B', 0, '2026-03-26', 1);
  -- tblPayment
  INSERT INTO tblPayment (PaymentID, ExpectedAmount, ReceivedAmount, PaymentStatus, OfficerCode, ValidityFrom) VALUES (1, 3134.2400, 200, 2, 'OFF001', '2026-03-26');
  -- tblPaymentDetails
  INSERT INTO tblPaymentDetails (PaymentDetailID, PaymentID, PolicyID, EnrolmentType, ValidityFrom) VALUES (1, 1, 1, 'N', '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : contrib_PENDING
-- DT          : DT8_ContribCollection
-- OUTPUT      : PENDING
-- CONDITIONS  : 2 condition(s)
-- WHEN        : {"and": [{"=": ["paymentStatus", 1]}, {"=": ["matchedPremiumCount", 0]}]}
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : paymentStatus=1 (need = 1) | matchedPremiumCount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 11 rows across 11 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row
--   tblPayment: 1 row
--   tblPaymentDetails: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 1, '2025-03-26', '2027-03-26', 86.6800, 6, 1092.3800, 718.9200, 18175.7800, 50, 172, 18, 12, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'O', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2024-12-16', '2024-12-16', '2027-11-15', 11, 8502.3000, 'R', 0, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 1773.9100, 'RCPT0001', '2025-11-13', 'B', 0, '2026-03-26', 1);
  -- tblPayment
  INSERT INTO tblPayment (PaymentID, ExpectedAmount, ReceivedAmount, PaymentStatus, OfficerCode, ValidityFrom) VALUES (1, 3134.2400, 0, 1, 'OFF001', '2026-03-26');
  -- tblPaymentDetails
  INSERT INTO tblPaymentDetails (PaymentDetailID, PaymentID, PolicyID, EnrolmentType, ValidityFrom) VALUES (1, 1, 1, 'N', '2026-03-26');


-- ========================================================================
-- DECISION TABLE: DT9_OfficerPerformance
-- Rules: 5
-- ========================================================================

-- ----------------------------------------------------------------------
-- RULE ID     : officer_INACTIVE
-- DT          : DT9_OfficerPerformance
-- OUTPUT      : INACTIVE
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{"=": ["enrolledFamilyCount", 0]}, {"=": ["activePolicyCount_officer", 0]}, {"=": ["collect
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : enrolledFamilyCount=0 (need = 0) | activePolicyCount_officer=0 (need = 0) | collectedPremiumAmount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 10 rows across 9 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 2 rows
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 1 row
--   tblInsureePolicy: 1 row
--   tblPremium: 1 row

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 16, '2025-03-26', '2027-03-26', 900.6200, 7, 110.7900, 984.8900, 19758.3600, 87, 99, 12, 11, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'G', 'C', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (2, 'OFF002', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 0, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 2, '2024-05-03', '2024-05-03', '2026-01-27', 2, 3381.8300, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 3.9200, 'RCPT0001', '2026-01-15', 'M', 1, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : officer_LOW
-- DT          : DT9_OfficerPerformance
-- OUTPUT      : LOW
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{"<=": ["enrolledFamilyCount", 10]}, {"<=": ["activePolicyCount_officer", 5]}, {">=": ["exp
-- SOURCE      : GA-generated | fitness=1.0000
-- DERIVED     : enrolledFamilyCount=1 (need <= 10) | activePolicyCount_officer=0 (need <= 5) | expiredPolicyCount=9 (need >= 5) | renewedPolicyCount=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 33 rows across 9 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 1 row
--   tblInsuree: 1 row
--   tblPolicy: 12 rows
--   tblInsureePolicy: 12 rows
--   tblPremium: 3 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'D');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 3, '2025-03-26', '2027-03-26', 1910.3800, 1, 1972.9900, 466.0700, 10995.2900, 89, 82, 9, 12, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'F', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 1, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2025-08-10', '2025-08-10', '2026-08-29', 13, 8823.9300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 1, 1, 1, '2025-10-22', '2025-10-22', '2025-10-13', 13, 7840.9100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 1, 1, 1, '2026-03-26', '2026-03-26', '2025-09-09', 4, 8145.6400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (4, 1, 1, 1, '2025-12-31', '2025-12-31', '2028-02-23', 14, 5115, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (5, 1, 1, 1, '2025-09-23', '2025-09-23', '2025-12-16', 4, 4776.9000, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (6, 1, 1, 1, '2025-02-10', '2025-02-10', '2025-12-16', 4, 2094.4800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (7, 1, 1, 1, '2025-07-28', '2025-07-28', '2025-12-16', 4, 6557.0500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (8, 1, 1, 1, '2025-05-21', '2025-05-21', '2025-12-16', 4, 6783.5700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (9, 1, 1, 1, '2025-01-23', '2025-01-23', '2025-12-16', 4, 8501.2800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (10, 1, 1, 1, '2025-12-25', '2025-12-25', '2025-12-16', 4, 6200.2100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (11, 1, 1, 1, '2024-03-27', '2024-03-27', '2025-12-16', 4, 7426.3200, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (12, 1, 1, 1, '2024-04-29', '2024-04-29', '2025-12-16', 4, 4016.2300, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 1, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 1, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (4, 1, 4, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (5, 1, 5, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (6, 1, 6, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (7, 1, 7, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (8, 1, 8, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (9, 1, 9, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 1, 10, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 1, 11, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 1, 12, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 450.2000, 'RCPT0001', '2025-12-02', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 1, 1077.0700, 'RCPT0002', '2026-02-16', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 1, 1610.1000, 'RCPT0003', '2026-01-22', 'C', 1, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : officer_AVERAGE
-- DT          : DT9_OfficerPerformance
-- OUTPUT      : AVERAGE
-- CONDITIONS  : 3 condition(s)
-- WHEN        : {"and": [{">=": ["enrolledFamilyCount", 20]}, {">=": ["activePolicyCount_officer", 10]}, {">=": ["co
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : enrolledFamilyCount=21 (need >= 20) | activePolicyCount_officer=21 (need >= 10) | collectedPremiumAmount=6300.0 (need >= 5000.0)
-- ----------------------------------------------------------------------
-- Fixture: 109 rows across 9 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 21 rows
--   tblInsuree: 21 rows
--   tblPolicy: 21 rows
--   tblInsureePolicy: 21 rows
--   tblPremium: 21 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-03-26', '2027-03-26', 1971.3100, 10, 676.7600, 993.7900, 5684.9000, 35, 101, 9, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (2, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (3, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (4, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (5, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (6, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (7, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (8, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (9, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (10, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (11, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (12, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (13, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (14, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (15, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (16, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (17, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (18, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (19, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (20, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (21, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 2, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 3, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 4, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 5, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (6, 6, 'CHF000006', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (7, 7, 'CHF000007', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (8, 8, 'CHF000008', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (9, 9, 'CHF000009', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (10, 10, 'CHF000010', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (11, 11, 'CHF000011', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (12, 12, 'CHF000012', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (13, 13, 'CHF000013', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (14, 14, 'CHF000014', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (15, 15, 'CHF000015', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (16, 16, 'CHF000016', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (17, 17, 'CHF000017', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (18, 18, 'CHF000018', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (19, 19, 'CHF000019', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (20, 20, 'CHF000020', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (21, 21, 'CHF000021', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-03-21', '2026-03-21', '2026-09-04', 2, 5980.5100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 2, 1, 1, '2026-01-31', '2026-01-31', '2025-12-07', 2, 8039.6400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 3, 1, 1, '2025-04-08', '2025-04-08', '2026-11-22', 2, 1852.3400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (4, 4, 1, 1, '2024-10-05', '2024-10-05', '2026-09-20', 2, 7392.3600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (5, 5, 1, 1, '2025-08-10', '2025-08-10', '2026-09-25', 2, 6578.0700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (6, 6, 1, 1, '2025-06-18', '2025-06-18', '2027-08-09', 2, 8108.8200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (7, 7, 1, 1, '2025-02-20', '2025-02-20', '2028-02-20', 2, 5095.1100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (8, 8, 1, 1, '2025-03-06', '2025-03-06', '2027-09-24', 2, 8004.7700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (9, 9, 1, 1, '2025-03-22', '2025-03-22', '2026-08-10', 2, 6697.0500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (10, 10, 1, 1, '2025-12-18', '2025-12-18', '2027-01-03', 2, 1497.7900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (11, 11, 1, 1, '2025-12-01', '2025-12-01', '2025-05-09', 2, 6407.7600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (12, 12, 1, 1, '2024-07-09', '2024-07-09', '2026-10-15', 2, 9992.9400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (13, 13, 1, 1, '2025-12-31', '2025-12-31', '2027-10-13', 2, 9773.6200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (14, 14, 1, 1, '2024-04-14', '2024-04-14', '2027-08-15', 2, 6648.8500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (15, 15, 1, 1, '2025-06-21', '2025-06-21', '2026-07-06', 2, 5474.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (16, 16, 1, 1, '2024-09-17', '2024-09-17', '2026-05-06', 2, 8216.2500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (17, 17, 1, 1, '2026-01-07', '2026-01-07', '2025-11-11', 2, 1458.4400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (18, 18, 1, 1, '2024-10-13', '2024-10-13', '2026-04-05', 2, 8829.5000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (19, 19, 1, 1, '2025-09-05', '2025-09-05', '2025-11-05', 2, 3557.8800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (20, 20, 1, 1, '2025-03-03', '2025-03-03', '2028-01-16', 2, 1936.9500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (21, 21, 1, 1, '2024-08-02', '2024-08-02', '2025-04-06', 2, 8505.7200, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 2, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 3, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (4, 4, 4, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (5, 5, 5, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (6, 6, 6, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (7, 7, 7, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (8, 8, 8, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (9, 9, 9, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 10, 10, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 11, 11, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 12, 12, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 13, 13, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (14, 14, 14, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (15, 15, 15, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (16, 16, 16, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (17, 17, 17, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (18, 18, 18, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (19, 19, 19, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (20, 20, 20, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (21, 21, 21, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 300, 'RCPT0001', '2026-01-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 2, 300, 'RCPT0002', '2025-10-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 3, 300, 'RCPT0003', '2026-03-05', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (4, 4, 300, 'RCPT0004', '2026-01-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (5, 5, 300, 'RCPT0005', '2025-12-15', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (6, 6, 300, 'RCPT0006', '2025-12-17', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (7, 7, 300, 'RCPT0007', '2026-02-28', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (8, 8, 300, 'RCPT0008', '2026-03-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (9, 9, 300, 'RCPT0009', '2026-02-13', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (10, 10, 300, 'RCPT0010', '2026-03-19', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (11, 11, 300, 'RCPT0011', '2025-12-12', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (12, 12, 300, 'RCPT0012', '2025-10-05', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (13, 13, 300, 'RCPT0013', '2026-01-05', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (14, 14, 300, 'RCPT0014', '2025-11-15', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (15, 15, 300, 'RCPT0015', '2026-01-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (16, 16, 300, 'RCPT0016', '2025-11-11', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (17, 17, 300, 'RCPT0017', '2026-01-20', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (18, 18, 300, 'RCPT0018', '2025-10-29', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (19, 19, 300, 'RCPT0019', '2026-03-10', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (20, 20, 300, 'RCPT0020', '2025-11-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (21, 21, 300, 'RCPT0021', '2026-02-27', 'C', 1, '2026-03-26', 1);


-- ----------------------------------------------------------------------
-- RULE ID     : officer_HIGH
-- DT          : DT9_OfficerPerformance
-- OUTPUT      : HIGH
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{">=": ["enrolledFamilyCount", 80]}, {">=": ["activePolicyCount_officer", 60]}, {">=": ["re
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : enrolledFamilyCount=85 (need >= 80) | activePolicyCount_officer=85 (need >= 60) | renewedPolicyCount=12 (need >= 10) | renewalWarnings=0 (need = 0)
-- ----------------------------------------------------------------------
-- Fixture: 441 rows across 10 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 85 rows
--   tblInsuree: 85 rows
--   tblPolicy: 85 rows
--   tblInsureePolicy: 85 rows
--   tblPremium: 85 rows
--   tblPolicyRenewals: 12 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-03-26', '2027-03-26', 1971.3100, 10, 676.7600, 993.7900, 5684.9000, 35, 101, 9, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (2, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (3, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (4, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (5, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (6, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (7, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (8, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (9, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (10, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (11, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (12, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (13, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (14, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (15, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (16, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (17, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (18, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (19, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (20, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (21, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (22, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (23, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (24, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (25, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (26, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (27, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (28, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (29, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (30, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (31, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (32, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (33, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (34, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (35, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (36, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (37, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (38, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (39, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (40, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (41, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (42, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (43, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (44, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (45, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (46, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (47, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (48, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (49, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (50, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (51, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (52, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (53, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (54, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (55, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (56, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (57, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (58, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (59, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (60, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (61, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (62, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (63, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (64, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (65, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (66, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (67, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (68, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (69, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (70, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (71, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (72, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (73, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (74, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (75, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (76, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (77, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (78, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (79, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (80, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (81, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (82, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (83, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (84, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (85, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 2, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 3, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 4, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 5, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (6, 6, 'CHF000006', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (7, 7, 'CHF000007', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (8, 8, 'CHF000008', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (9, 9, 'CHF000009', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (10, 10, 'CHF000010', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (11, 11, 'CHF000011', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (12, 12, 'CHF000012', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (13, 13, 'CHF000013', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (14, 14, 'CHF000014', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (15, 15, 'CHF000015', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (16, 16, 'CHF000016', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (17, 17, 'CHF000017', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (18, 18, 'CHF000018', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (19, 19, 'CHF000019', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (20, 20, 'CHF000020', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (21, 21, 'CHF000021', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (22, 22, 'CHF000022', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (23, 23, 'CHF000023', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (24, 24, 'CHF000024', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (25, 25, 'CHF000025', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (26, 26, 'CHF000026', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (27, 27, 'CHF000027', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (28, 28, 'CHF000028', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (29, 29, 'CHF000029', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (30, 30, 'CHF000030', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (31, 31, 'CHF000031', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (32, 32, 'CHF000032', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (33, 33, 'CHF000033', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (34, 34, 'CHF000034', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (35, 35, 'CHF000035', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (36, 36, 'CHF000036', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (37, 37, 'CHF000037', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (38, 38, 'CHF000038', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (39, 39, 'CHF000039', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (40, 40, 'CHF000040', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (41, 41, 'CHF000041', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (42, 42, 'CHF000042', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (43, 43, 'CHF000043', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (44, 44, 'CHF000044', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (45, 45, 'CHF000045', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (46, 46, 'CHF000046', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (47, 47, 'CHF000047', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (48, 48, 'CHF000048', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (49, 49, 'CHF000049', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (50, 50, 'CHF000050', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (51, 51, 'CHF000051', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (52, 52, 'CHF000052', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (53, 53, 'CHF000053', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (54, 54, 'CHF000054', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (55, 55, 'CHF000055', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (56, 56, 'CHF000056', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (57, 57, 'CHF000057', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (58, 58, 'CHF000058', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (59, 59, 'CHF000059', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (60, 60, 'CHF000060', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (61, 61, 'CHF000061', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (62, 62, 'CHF000062', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (63, 63, 'CHF000063', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (64, 64, 'CHF000064', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (65, 65, 'CHF000065', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (66, 66, 'CHF000066', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (67, 67, 'CHF000067', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (68, 68, 'CHF000068', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (69, 69, 'CHF000069', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (70, 70, 'CHF000070', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (71, 71, 'CHF000071', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (72, 72, 'CHF000072', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (73, 73, 'CHF000073', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (74, 74, 'CHF000074', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (75, 75, 'CHF000075', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (76, 76, 'CHF000076', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (77, 77, 'CHF000077', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (78, 78, 'CHF000078', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (79, 79, 'CHF000079', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (80, 80, 'CHF000080', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (81, 81, 'CHF000081', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (82, 82, 'CHF000082', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (83, 83, 'CHF000083', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (84, 84, 'CHF000084', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (85, 85, 'CHF000085', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-03-21', '2026-03-21', '2026-09-04', 2, 5980.5100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 2, 1, 1, '2026-01-31', '2026-01-31', '2025-12-07', 2, 8039.6400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 3, 1, 1, '2025-04-08', '2025-04-08', '2026-11-22', 2, 1852.3400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (4, 4, 1, 1, '2024-10-05', '2024-10-05', '2026-09-20', 2, 7392.3600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (5, 5, 1, 1, '2025-08-10', '2025-08-10', '2026-09-25', 2, 6578.0700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (6, 6, 1, 1, '2025-06-18', '2025-06-18', '2027-08-09', 2, 8108.8200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (7, 7, 1, 1, '2025-02-20', '2025-02-20', '2028-02-20', 2, 5095.1100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (8, 8, 1, 1, '2025-03-06', '2025-03-06', '2027-09-24', 2, 8004.7700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (9, 9, 1, 1, '2025-03-22', '2025-03-22', '2026-08-10', 2, 6697.0500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (10, 10, 1, 1, '2025-12-18', '2025-12-18', '2027-01-03', 2, 1497.7900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (11, 11, 1, 1, '2025-12-01', '2025-12-01', '2025-05-09', 2, 6407.7600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (12, 12, 1, 1, '2024-07-09', '2024-07-09', '2026-10-15', 2, 9992.9400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (13, 13, 1, 1, '2025-12-31', '2025-12-31', '2027-10-13', 2, 9773.6200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (14, 14, 1, 1, '2024-04-14', '2024-04-14', '2027-08-15', 2, 6648.8500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (15, 15, 1, 1, '2025-06-21', '2025-06-21', '2026-07-06', 2, 5474.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (16, 16, 1, 1, '2024-09-17', '2024-09-17', '2026-05-06', 2, 8216.2500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (17, 17, 1, 1, '2026-01-07', '2026-01-07', '2025-11-11', 2, 1458.4400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (18, 18, 1, 1, '2024-10-13', '2024-10-13', '2026-04-05', 2, 8829.5000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (19, 19, 1, 1, '2025-09-05', '2025-09-05', '2025-11-05', 2, 3557.8800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (20, 20, 1, 1, '2025-03-03', '2025-03-03', '2028-01-16', 2, 1936.9500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (21, 21, 1, 1, '2024-08-02', '2024-08-02', '2025-04-06', 2, 8505.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (22, 22, 1, 1, '2025-12-02', '2025-12-02', '2026-02-23', 2, 8233.9300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (23, 23, 1, 1, '2026-01-22', '2026-01-22', '2027-02-12', 2, 549.8700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (24, 24, 1, 1, '2025-11-02', '2025-11-02', '2025-05-04', 2, 8935.0300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (25, 25, 1, 1, '2025-12-06', '2025-12-06', '2028-02-17', 2, 9028.4500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (26, 26, 1, 1, '2025-01-05', '2025-01-05', '2027-09-28', 2, 3620.1300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (27, 27, 1, 1, '2025-01-15', '2025-01-15', '2027-01-18', 2, 193.8500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (28, 28, 1, 1, '2024-08-16', '2024-08-16', '2027-12-17', 2, 5887.6800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (29, 29, 1, 1, '2024-09-24', '2024-09-24', '2027-03-01', 2, 9815.8900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (30, 30, 1, 1, '2026-02-26', '2026-02-26', '2026-04-14', 2, 330.4500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (31, 31, 1, 1, '2026-01-20', '2026-01-20', '2027-07-01', 2, 4707.5400, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (32, 32, 1, 1, '2025-07-01', '2025-07-01', '2026-11-15', 2, 2994.0300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (33, 33, 1, 1, '2025-05-17', '2025-05-17', '2026-02-17', 2, 9835.8600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (34, 34, 1, 1, '2026-02-25', '2026-02-25', '2027-11-05', 2, 6987.2600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (35, 35, 1, 1, '2024-09-07', '2024-09-07', '2027-11-23', 2, 1770.6900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (36, 36, 1, 1, '2025-05-17', '2025-05-17', '2028-03-24', 2, 9600.8400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (37, 37, 1, 1, '2025-06-23', '2025-06-23', '2027-06-28', 2, 1076.4300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (38, 38, 1, 1, '2025-07-28', '2025-07-28', '2025-10-22', 2, 4499.5300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (39, 39, 1, 1, '2024-07-06', '2024-07-06', '2026-12-13', 2, 3240.4200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (40, 40, 1, 1, '2026-03-06', '2026-03-06', '2026-08-09', 2, 7788.2400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (41, 41, 1, 1, '2025-02-21', '2025-02-21', '2027-12-17', 2, 7585.9400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (42, 42, 1, 1, '2026-01-20', '2026-01-20', '2027-05-24', 2, 7192.5800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (43, 43, 1, 1, '2025-07-25', '2025-07-25', '2025-12-09', 2, 4825.6200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (44, 44, 1, 1, '2024-08-14', '2024-08-14', '2027-09-25', 2, 6723.5100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (45, 45, 1, 1, '2024-09-27', '2024-09-27', '2027-07-05', 2, 7023.7600, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (46, 46, 1, 1, '2025-07-24', '2025-07-24', '2025-09-23', 2, 1593.7200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (47, 47, 1, 1, '2026-02-06', '2026-02-06', '2025-07-16', 2, 7893.7100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (48, 48, 1, 1, '2026-01-25', '2026-01-25', '2028-02-02', 2, 9121.5900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (49, 49, 1, 1, '2024-11-23', '2024-11-23', '2028-03-10', 2, 7752.1500, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (50, 50, 1, 1, '2024-10-28', '2024-10-28', '2027-05-04', 2, 4604.6000, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (51, 51, 1, 1, '2026-01-05', '2026-01-05', '2025-08-08', 2, 8746.5700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (52, 52, 1, 1, '2025-06-13', '2025-06-13', '2026-03-31', 2, 9541.4200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (53, 53, 1, 1, '2024-07-01', '2024-07-01', '2027-06-24', 2, 1992.7700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (54, 54, 1, 1, '2025-02-17', '2025-02-17', '2027-05-01', 2, 8517.0300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (55, 55, 1, 1, '2024-08-21', '2024-08-21', '2027-03-20', 2, 1064.2200, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (56, 56, 1, 1, '2024-06-10', '2024-06-10', '2025-12-08', 2, 2929.6700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (57, 57, 1, 1, '2025-01-24', '2025-01-24', '2026-10-25', 2, 8682.7800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (58, 58, 1, 1, '2025-04-02', '2025-04-02', '2025-12-27', 2, 6249.2300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (59, 59, 1, 1, '2024-09-19', '2024-09-19', '2027-04-05', 2, 6643.8200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (60, 60, 1, 1, '2025-04-05', '2025-04-05', '2027-12-29', 2, 2349.1100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (61, 61, 1, 1, '2025-10-22', '2025-10-22', '2028-03-17', 2, 6125.9100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (62, 62, 1, 1, '2024-10-19', '2024-10-19', '2026-05-23', 2, 6683.2600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (63, 63, 1, 1, '2025-06-26', '2025-06-26', '2025-07-10', 2, 5580.5500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (64, 64, 1, 1, '2024-12-18', '2024-12-18', '2027-10-05', 2, 4628.0800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (65, 65, 1, 1, '2025-12-04', '2025-12-04', '2025-08-08', 2, 5583.3600, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (66, 66, 1, 1, '2026-02-12', '2026-02-12', '2026-10-04', 2, 7383.3600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (67, 67, 1, 1, '2024-12-12', '2024-12-12', '2027-11-26', 2, 4857.9900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (68, 68, 1, 1, '2025-06-20', '2025-06-20', '2027-08-11', 2, 1565.5400, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (69, 69, 1, 1, '2024-06-22', '2024-06-22', '2026-10-06', 2, 2777.8800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (70, 70, 1, 1, '2026-03-11', '2026-03-11', '2026-11-28', 2, 5179.8700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (71, 71, 1, 1, '2024-09-21', '2024-09-21', '2027-03-25', 2, 866.3100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (72, 72, 1, 1, '2024-11-08', '2024-11-08', '2025-07-30', 2, 2851.9200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (73, 73, 1, 1, '2025-04-19', '2025-04-19', '2025-09-08', 2, 7120.7300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (74, 74, 1, 1, '2024-09-04', '2024-09-04', '2025-06-01', 2, 3993.8200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (75, 75, 1, 1, '2024-12-10', '2024-12-10', '2028-01-26', 2, 1719.8800, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (76, 76, 1, 1, '2024-03-31', '2024-03-31', '2026-01-03', 2, 4882.4800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (77, 77, 1, 1, '2025-05-27', '2025-05-27', '2027-11-27', 2, 4240, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (78, 78, 1, 1, '2024-09-19', '2024-09-19', '2028-02-05', 2, 8304.5500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (79, 79, 1, 1, '2025-05-12', '2025-05-12', '2025-08-31', 2, 5423.6700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (80, 80, 1, 1, '2025-12-13', '2025-12-13', '2027-11-14', 2, 8466.5300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (81, 81, 1, 1, '2025-06-27', '2025-06-27', '2027-10-15', 2, 198.2200, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (82, 82, 1, 1, '2024-07-10', '2024-07-10', '2027-07-13', 2, 1662.3100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (83, 83, 1, 1, '2025-03-27', '2025-03-27', '2026-11-16', 2, 9697, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (84, 84, 1, 1, '2025-04-25', '2025-04-25', '2026-05-05', 2, 3319.9300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (85, 85, 1, 1, '2024-10-25', '2024-10-25', '2028-01-30', 2, 6823.7500, 'R', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 2, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 3, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (4, 4, 4, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (5, 5, 5, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (6, 6, 6, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (7, 7, 7, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (8, 8, 8, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (9, 9, 9, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 10, 10, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 11, 11, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 12, 12, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 13, 13, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (14, 14, 14, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (15, 15, 15, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (16, 16, 16, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (17, 17, 17, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (18, 18, 18, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (19, 19, 19, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (20, 20, 20, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (21, 21, 21, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (22, 22, 22, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (23, 23, 23, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (24, 24, 24, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (25, 25, 25, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (26, 26, 26, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (27, 27, 27, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (28, 28, 28, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (29, 29, 29, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (30, 30, 30, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (31, 31, 31, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (32, 32, 32, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (33, 33, 33, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (34, 34, 34, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (35, 35, 35, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (36, 36, 36, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (37, 37, 37, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (38, 38, 38, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (39, 39, 39, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (40, 40, 40, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (41, 41, 41, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (42, 42, 42, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (43, 43, 43, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (44, 44, 44, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (45, 45, 45, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (46, 46, 46, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (47, 47, 47, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (48, 48, 48, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (49, 49, 49, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (50, 50, 50, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (51, 51, 51, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (52, 52, 52, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (53, 53, 53, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (54, 54, 54, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (55, 55, 55, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (56, 56, 56, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (57, 57, 57, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (58, 58, 58, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (59, 59, 59, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (60, 60, 60, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (61, 61, 61, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (62, 62, 62, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (63, 63, 63, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (64, 64, 64, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (65, 65, 65, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (66, 66, 66, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (67, 67, 67, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (68, 68, 68, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (69, 69, 69, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (70, 70, 70, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (71, 71, 71, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (72, 72, 72, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (73, 73, 73, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (74, 74, 74, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (75, 75, 75, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (76, 76, 76, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (77, 77, 77, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (78, 78, 78, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (79, 79, 79, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (80, 80, 80, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (81, 81, 81, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (82, 82, 82, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (83, 83, 83, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (84, 84, 84, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (85, 85, 85, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 300, 'RCPT0001', '2026-01-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 2, 300, 'RCPT0002', '2025-10-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 3, 300, 'RCPT0003', '2026-03-05', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (4, 4, 300, 'RCPT0004', '2026-01-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (5, 5, 300, 'RCPT0005', '2025-12-15', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (6, 6, 300, 'RCPT0006', '2025-12-17', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (7, 7, 300, 'RCPT0007', '2026-02-28', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (8, 8, 300, 'RCPT0008', '2026-03-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (9, 9, 300, 'RCPT0009', '2026-02-13', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (10, 10, 300, 'RCPT0010', '2026-03-19', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (11, 11, 300, 'RCPT0011', '2025-12-12', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (12, 12, 300, 'RCPT0012', '2025-10-05', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (13, 13, 300, 'RCPT0013', '2026-01-05', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (14, 14, 300, 'RCPT0014', '2025-11-15', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (15, 15, 300, 'RCPT0015', '2026-01-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (16, 16, 300, 'RCPT0016', '2025-11-11', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (17, 17, 300, 'RCPT0017', '2026-01-20', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (18, 18, 300, 'RCPT0018', '2025-10-29', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (19, 19, 300, 'RCPT0019', '2026-03-10', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (20, 20, 300, 'RCPT0020', '2025-11-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (21, 21, 300, 'RCPT0021', '2026-02-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (22, 22, 300, 'RCPT0022', '2025-10-02', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (23, 23, 300, 'RCPT0023', '2025-11-25', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (24, 24, 300, 'RCPT0024', '2025-11-02', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (25, 25, 300, 'RCPT0025', '2026-02-16', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (26, 26, 300, 'RCPT0026', '2025-10-15', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (27, 27, 300, 'RCPT0027', '2026-03-26', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (28, 28, 300, 'RCPT0028', '2025-12-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (29, 29, 300, 'RCPT0029', '2026-01-01', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (30, 30, 300, 'RCPT0030', '2025-10-19', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (31, 31, 300, 'RCPT0031', '2025-10-11', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (32, 32, 300, 'RCPT0032', '2025-11-10', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (33, 33, 300, 'RCPT0033', '2026-02-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (34, 34, 300, 'RCPT0034', '2025-11-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (35, 35, 300, 'RCPT0035', '2025-11-28', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (36, 36, 300, 'RCPT0036', '2025-10-20', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (37, 37, 300, 'RCPT0037', '2025-11-17', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (38, 38, 300, 'RCPT0038', '2026-01-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (39, 39, 300, 'RCPT0039', '2025-12-26', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (40, 40, 300, 'RCPT0040', '2026-02-16', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (41, 41, 300, 'RCPT0041', '2026-01-09', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (42, 42, 300, 'RCPT0042', '2026-03-23', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (43, 43, 300, 'RCPT0043', '2025-10-14', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (44, 44, 300, 'RCPT0044', '2025-10-01', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (45, 45, 300, 'RCPT0045', '2026-01-20', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (46, 46, 300, 'RCPT0046', '2026-01-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (47, 47, 300, 'RCPT0047', '2026-02-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (48, 48, 300, 'RCPT0048', '2025-10-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (49, 49, 300, 'RCPT0049', '2026-02-09', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (50, 50, 300, 'RCPT0050', '2025-10-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (51, 51, 300, 'RCPT0051', '2026-03-01', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (52, 52, 300, 'RCPT0052', '2026-01-16', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (53, 53, 300, 'RCPT0053', '2026-01-01', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (54, 54, 300, 'RCPT0054', '2026-02-25', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (55, 55, 300, 'RCPT0055', '2026-02-18', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (56, 56, 300, 'RCPT0056', '2026-01-27', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (57, 57, 300, 'RCPT0057', '2026-01-31', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (58, 58, 300, 'RCPT0058', '2026-01-04', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (59, 59, 300, 'RCPT0059', '2025-10-18', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (60, 60, 300, 'RCPT0060', '2025-11-12', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (61, 61, 300, 'RCPT0061', '2025-11-14', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (62, 62, 300, 'RCPT0062', '2025-12-13', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (63, 63, 300, 'RCPT0063', '2026-02-16', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (64, 64, 300, 'RCPT0064', '2025-11-24', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (65, 65, 300, 'RCPT0065', '2025-12-10', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (66, 66, 300, 'RCPT0066', '2025-12-29', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (67, 67, 300, 'RCPT0067', '2026-01-21', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (68, 68, 300, 'RCPT0068', '2026-03-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (69, 69, 300, 'RCPT0069', '2026-02-09', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (70, 70, 300, 'RCPT0070', '2025-11-09', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (71, 71, 300, 'RCPT0071', '2025-10-17', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (72, 72, 300, 'RCPT0072', '2026-03-13', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (73, 73, 300, 'RCPT0073', '2026-03-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (74, 74, 300, 'RCPT0074', '2025-10-22', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (75, 75, 300, 'RCPT0075', '2025-12-30', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (76, 76, 300, 'RCPT0076', '2025-11-12', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (77, 77, 300, 'RCPT0077', '2025-10-25', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (78, 78, 300, 'RCPT0078', '2025-12-23', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (79, 79, 300, 'RCPT0079', '2025-12-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (80, 80, 300, 'RCPT0080', '2026-03-14', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (81, 81, 300, 'RCPT0081', '2025-11-25', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (82, 82, 300, 'RCPT0082', '2025-10-31', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (83, 83, 300, 'RCPT0083', '2026-02-13', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (84, 84, 300, 'RCPT0084', '2025-12-22', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (85, 85, 300, 'RCPT0085', '2025-10-21', 'B', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-02-24', '2026-03-26', 2, 2, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (3, '2026-02-24', '2026-03-26', 3, 3, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (4, '2026-02-24', '2026-03-26', 4, 4, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (5, '2026-02-24', '2026-03-26', 5, 5, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (6, '2026-02-24', '2026-03-26', 6, 6, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (7, '2026-02-24', '2026-03-26', 7, 7, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (8, '2026-02-24', '2026-03-26', 8, 8, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (9, '2026-02-24', '2026-03-26', 9, 9, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (10, '2026-02-24', '2026-03-26', 10, 10, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (11, '2026-02-24', '2026-03-26', 11, 11, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (12, '2026-02-24', '2026-03-26', 12, 12, 1, 0, 0, 1, '2026-03-26');


-- ----------------------------------------------------------------------
-- RULE ID     : officer_OUTSTANDING
-- DT          : DT9_OfficerPerformance
-- OUTPUT      : OUTSTANDING
-- CONDITIONS  : 4 condition(s)
-- WHEN        : {"and": [{">=": ["enrolledFamilyCount", 150]}, {">=": ["activePolicyCount_officer", 100]}, {">=": ["
-- SOURCE      : GA generated| fitness=1.0000
-- DERIVED     : enrolledFamilyCount=155 (need >= 150) | activePolicyCount_officer=155 (need >= 100) | renewedPolicyCount=22 (need >= 20) | collectedPremiumAmount=46500.0 (need >= 30000.0)
-- ----------------------------------------------------------------------
-- Fixture: 801 rows across 10 tables
--   tblLocations: 1 row
--   tblProduct: 1 row
--   tblHF: 1 row
--   tblOfficer: 1 row
--   tblFamilies: 155 rows
--   tblInsuree: 155 rows
--   tblPolicy: 155 rows
--   tblInsureePolicy: 155 rows
--   tblPremium: 155 rows
--   tblPolicyRenewals: 22 rows

  -- tblLocations
  INSERT INTO tblLocations (LocationId, LocationName, LocationType) VALUES (1, 'TestLoc', 'R');
  -- tblProduct
  INSERT INTO tblProduct (ProdID, ProductCode, ProductName, LocationId, InsurancePeriod, DateFrom, DateTo, LumpSum, MemberCount, PremiumAdult, PremiumChild, MaxPolicyValue, GracePeriod, WaitingPeriod, CoveredServiceCount, CoveredItemCount, ValidityFrom, AuditUserID) VALUES (1, 'PROD001', 'Test Product 1', 1, 19, '2025-03-26', '2027-03-26', 1971.3100, 10, 676.7600, 993.7900, 5684.9000, 35, 101, 9, 13, '2026-03-26', 1);
  -- tblHF
  INSERT INTO tblHF (HfID, HFCode, HFName, LegalForm, HFLevel, HFCareType, LocationId, OffLine, ValidityFrom, AuditUserID) VALUES (1, 'HF001', 'Test HF 1', 'P', 'D', 'I', 1, 0, '2026-03-26', 1);
  -- tblOfficer
  INSERT INTO tblOfficer (OfficerID, Code, LastName, OtherNames, LocationId, ValidityFrom, AuditUserID) VALUES (1, 'OFF001', 'TestOfficer', 'Test', 1, '2026-03-26', 1);
  -- tblFamilies
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (2, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (3, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (4, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (5, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (6, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (7, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (8, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (9, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (10, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (11, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (12, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (13, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (14, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (15, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (16, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (17, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (18, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (19, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (20, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (21, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (22, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (23, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (24, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (25, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (26, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (27, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (28, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (29, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (30, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (31, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (32, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (33, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (34, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (35, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (36, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (37, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (38, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (39, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (40, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (41, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (42, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (43, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (44, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (45, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (46, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (47, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (48, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (49, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (50, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (51, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (52, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (53, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (54, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (55, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (56, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (57, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (58, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (59, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (60, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (61, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (62, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (63, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (64, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (65, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (66, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (67, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (68, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (69, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (70, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (71, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (72, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (73, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (74, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (75, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (76, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (77, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (78, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (79, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (80, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (81, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (82, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (83, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (84, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (85, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (86, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (87, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (88, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (89, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (90, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (91, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (92, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (93, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (94, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (95, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (96, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (97, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (98, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (99, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (100, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (101, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (102, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (103, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (104, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (105, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (106, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (107, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (108, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (109, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (110, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (111, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (112, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (113, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (114, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (115, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (116, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (117, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (118, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (119, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (120, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (121, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (122, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (123, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (124, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (125, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (126, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (127, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (128, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (129, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (130, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (131, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (132, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (133, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (134, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (135, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (136, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (137, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (138, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (139, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (140, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (141, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (142, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (143, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (144, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (145, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (146, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (147, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (148, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (149, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (150, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (151, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (152, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (153, 1, 1, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (154, 1, 0, '2026-03-26', 1);
  INSERT INTO tblFamilies (FamilyID, LocationId, Poverty, ValidityFrom, AuditUserID) VALUES (155, 1, 0, '2026-03-26', 1);
  -- tblInsuree
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (1, 1, 'CHF000001', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (2, 2, 'CHF000002', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (3, 3, 'CHF000003', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (4, 4, 'CHF000004', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (5, 5, 'CHF000005', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (6, 6, 'CHF000006', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (7, 7, 'CHF000007', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (8, 8, 'CHF000008', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (9, 9, 'CHF000009', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (10, 10, 'CHF000010', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (11, 11, 'CHF000011', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (12, 12, 'CHF000012', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (13, 13, 'CHF000013', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (14, 14, 'CHF000014', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (15, 15, 'CHF000015', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (16, 16, 'CHF000016', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (17, 17, 'CHF000017', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (18, 18, 'CHF000018', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (19, 19, 'CHF000019', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (20, 20, 'CHF000020', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (21, 21, 'CHF000021', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (22, 22, 'CHF000022', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (23, 23, 'CHF000023', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (24, 24, 'CHF000024', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (25, 25, 'CHF000025', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (26, 26, 'CHF000026', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (27, 27, 'CHF000027', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (28, 28, 'CHF000028', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (29, 29, 'CHF000029', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (30, 30, 'CHF000030', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (31, 31, 'CHF000031', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (32, 32, 'CHF000032', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (33, 33, 'CHF000033', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (34, 34, 'CHF000034', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (35, 35, 'CHF000035', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (36, 36, 'CHF000036', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (37, 37, 'CHF000037', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (38, 38, 'CHF000038', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (39, 39, 'CHF000039', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (40, 40, 'CHF000040', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (41, 41, 'CHF000041', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (42, 42, 'CHF000042', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (43, 43, 'CHF000043', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (44, 44, 'CHF000044', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (45, 45, 'CHF000045', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (46, 46, 'CHF000046', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (47, 47, 'CHF000047', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (48, 48, 'CHF000048', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (49, 49, 'CHF000049', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (50, 50, 'CHF000050', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (51, 51, 'CHF000051', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (52, 52, 'CHF000052', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (53, 53, 'CHF000053', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (54, 54, 'CHF000054', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (55, 55, 'CHF000055', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (56, 56, 'CHF000056', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (57, 57, 'CHF000057', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (58, 58, 'CHF000058', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (59, 59, 'CHF000059', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (60, 60, 'CHF000060', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (61, 61, 'CHF000061', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (62, 62, 'CHF000062', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (63, 63, 'CHF000063', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (64, 64, 'CHF000064', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (65, 65, 'CHF000065', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (66, 66, 'CHF000066', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (67, 67, 'CHF000067', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (68, 68, 'CHF000068', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (69, 69, 'CHF000069', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (70, 70, 'CHF000070', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (71, 71, 'CHF000071', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (72, 72, 'CHF000072', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (73, 73, 'CHF000073', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (74, 74, 'CHF000074', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (75, 75, 'CHF000075', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (76, 76, 'CHF000076', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (77, 77, 'CHF000077', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (78, 78, 'CHF000078', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (79, 79, 'CHF000079', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (80, 80, 'CHF000080', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (81, 81, 'CHF000081', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (82, 82, 'CHF000082', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (83, 83, 'CHF000083', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (84, 84, 'CHF000084', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (85, 85, 'CHF000085', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (86, 86, 'CHF000086', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (87, 87, 'CHF000087', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (88, 88, 'CHF000088', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (89, 89, 'CHF000089', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (90, 90, 'CHF000090', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (91, 91, 'CHF000091', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (92, 92, 'CHF000092', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (93, 93, 'CHF000093', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (94, 94, 'CHF000094', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (95, 95, 'CHF000095', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (96, 96, 'CHF000096', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (97, 97, 'CHF000097', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (98, 98, 'CHF000098', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (99, 99, 'CHF000099', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (100, 100, 'CHF000100', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (101, 101, 'CHF000101', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (102, 102, 'CHF000102', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (103, 103, 'CHF000103', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (104, 104, 'CHF000104', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (105, 105, 'CHF000105', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (106, 106, 'CHF000106', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (107, 107, 'CHF000107', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (108, 108, 'CHF000108', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (109, 109, 'CHF000109', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (110, 110, 'CHF000110', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (111, 111, 'CHF000111', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (112, 112, 'CHF000112', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (113, 113, 'CHF000113', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (114, 114, 'CHF000114', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (115, 115, 'CHF000115', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (116, 116, 'CHF000116', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (117, 117, 'CHF000117', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (118, 118, 'CHF000118', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (119, 119, 'CHF000119', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (120, 120, 'CHF000120', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (121, 121, 'CHF000121', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (122, 122, 'CHF000122', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (123, 123, 'CHF000123', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (124, 124, 'CHF000124', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (125, 125, 'CHF000125', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (126, 126, 'CHF000126', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (127, 127, 'CHF000127', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (128, 128, 'CHF000128', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (129, 129, 'CHF000129', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (130, 130, 'CHF000130', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (131, 131, 'CHF000131', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (132, 132, 'CHF000132', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (133, 133, 'CHF000133', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (134, 134, 'CHF000134', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (135, 135, 'CHF000135', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (136, 136, 'CHF000136', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (137, 137, 'CHF000137', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (138, 138, 'CHF000138', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (139, 139, 'CHF000139', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (140, 140, 'CHF000140', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (141, 141, 'CHF000141', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (142, 142, 'CHF000142', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (143, 143, 'CHF000143', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (144, 144, 'CHF000144', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (145, 145, 'CHF000145', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (146, 146, 'CHF000146', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (147, 147, 'CHF000147', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (148, 148, 'CHF000148', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (149, 149, 'CHF000149', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (150, 150, 'CHF000150', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (151, 151, 'CHF000151', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (152, 152, 'CHF000152', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (153, 153, 'CHF000153', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 1, 0, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (154, 154, 'CHF000154', 'TestLast', 'TestFirst', '1985-01-01', 'M', 1, 1, 1, '2026-03-26', 1);
  INSERT INTO tblInsuree (InsureeID, FamilyID, CHFID, LastName, OtherNames, DOB, Gender, IsHead, CardIssued, Vulnerability, ValidityFrom, AuditUserID) VALUES (155, 155, 'CHF000155', 'TestLast', 'TestFirst', '1985-01-01', 'F', 1, 0, 1, '2026-03-26', 1);
  -- tblPolicy
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (1, 1, 1, 1, '2026-03-21', '2026-03-21', '2026-09-04', 2, 5980.5100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (2, 2, 1, 1, '2026-01-31', '2026-01-31', '2025-12-07', 2, 8039.6400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (3, 3, 1, 1, '2025-04-08', '2025-04-08', '2026-11-22', 2, 1852.3400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (4, 4, 1, 1, '2024-10-05', '2024-10-05', '2026-09-20', 2, 7392.3600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (5, 5, 1, 1, '2025-08-10', '2025-08-10', '2026-09-25', 2, 6578.0700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (6, 6, 1, 1, '2025-06-18', '2025-06-18', '2027-08-09', 2, 8108.8200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (7, 7, 1, 1, '2025-02-20', '2025-02-20', '2028-02-20', 2, 5095.1100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (8, 8, 1, 1, '2025-03-06', '2025-03-06', '2027-09-24', 2, 8004.7700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (9, 9, 1, 1, '2025-03-22', '2025-03-22', '2026-08-10', 2, 6697.0500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (10, 10, 1, 1, '2025-12-18', '2025-12-18', '2027-01-03', 2, 1497.7900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (11, 11, 1, 1, '2025-12-01', '2025-12-01', '2025-05-09', 2, 6407.7600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (12, 12, 1, 1, '2024-07-09', '2024-07-09', '2026-10-15', 2, 9992.9400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (13, 13, 1, 1, '2025-12-31', '2025-12-31', '2027-10-13', 2, 9773.6200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (14, 14, 1, 1, '2024-04-14', '2024-04-14', '2027-08-15', 2, 6648.8500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (15, 15, 1, 1, '2025-06-21', '2025-06-21', '2026-07-06', 2, 5474.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (16, 16, 1, 1, '2024-09-17', '2024-09-17', '2026-05-06', 2, 8216.2500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (17, 17, 1, 1, '2026-01-07', '2026-01-07', '2025-11-11', 2, 1458.4400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (18, 18, 1, 1, '2024-10-13', '2024-10-13', '2026-04-05', 2, 8829.5000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (19, 19, 1, 1, '2025-09-05', '2025-09-05', '2025-11-05', 2, 3557.8800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (20, 20, 1, 1, '2025-03-03', '2025-03-03', '2028-01-16', 2, 1936.9500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (21, 21, 1, 1, '2024-08-02', '2024-08-02', '2025-04-06', 2, 8505.7200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (22, 22, 1, 1, '2025-12-02', '2025-12-02', '2026-02-23', 2, 8233.9300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (23, 23, 1, 1, '2026-01-22', '2026-01-22', '2027-02-12', 2, 549.8700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (24, 24, 1, 1, '2025-11-02', '2025-11-02', '2025-05-04', 2, 8935.0300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (25, 25, 1, 1, '2025-12-06', '2025-12-06', '2028-02-17', 2, 9028.4500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (26, 26, 1, 1, '2025-01-05', '2025-01-05', '2027-09-28', 2, 3620.1300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (27, 27, 1, 1, '2025-01-15', '2025-01-15', '2027-01-18', 2, 193.8500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (28, 28, 1, 1, '2024-08-16', '2024-08-16', '2027-12-17', 2, 5887.6800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (29, 29, 1, 1, '2024-09-24', '2024-09-24', '2027-03-01', 2, 9815.8900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (30, 30, 1, 1, '2026-02-26', '2026-02-26', '2026-04-14', 2, 330.4500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (31, 31, 1, 1, '2026-01-20', '2026-01-20', '2027-07-01', 2, 4707.5400, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (32, 32, 1, 1, '2025-07-01', '2025-07-01', '2026-11-15', 2, 2994.0300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (33, 33, 1, 1, '2025-05-17', '2025-05-17', '2026-02-17', 2, 9835.8600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (34, 34, 1, 1, '2026-02-25', '2026-02-25', '2027-11-05', 2, 6987.2600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (35, 35, 1, 1, '2024-09-07', '2024-09-07', '2027-11-23', 2, 1770.6900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (36, 36, 1, 1, '2025-05-17', '2025-05-17', '2028-03-24', 2, 9600.8400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (37, 37, 1, 1, '2025-06-23', '2025-06-23', '2027-06-28', 2, 1076.4300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (38, 38, 1, 1, '2025-07-28', '2025-07-28', '2025-10-22', 2, 4499.5300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (39, 39, 1, 1, '2024-07-06', '2024-07-06', '2026-12-13', 2, 3240.4200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (40, 40, 1, 1, '2026-03-06', '2026-03-06', '2026-08-09', 2, 7788.2400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (41, 41, 1, 1, '2025-02-21', '2025-02-21', '2027-12-17', 2, 7585.9400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (42, 42, 1, 1, '2026-01-20', '2026-01-20', '2027-05-24', 2, 7192.5800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (43, 43, 1, 1, '2025-07-25', '2025-07-25', '2025-12-09', 2, 4825.6200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (44, 44, 1, 1, '2024-08-14', '2024-08-14', '2027-09-25', 2, 6723.5100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (45, 45, 1, 1, '2024-09-27', '2024-09-27', '2027-07-05', 2, 7023.7600, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (46, 46, 1, 1, '2025-07-24', '2025-07-24', '2025-09-23', 2, 1593.7200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (47, 47, 1, 1, '2026-02-06', '2026-02-06', '2025-07-16', 2, 7893.7100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (48, 48, 1, 1, '2026-01-25', '2026-01-25', '2028-02-02', 2, 9121.5900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (49, 49, 1, 1, '2024-11-23', '2024-11-23', '2028-03-10', 2, 7752.1500, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (50, 50, 1, 1, '2024-10-28', '2024-10-28', '2027-05-04', 2, 4604.6000, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (51, 51, 1, 1, '2026-01-05', '2026-01-05', '2025-08-08', 2, 8746.5700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (52, 52, 1, 1, '2025-06-13', '2025-06-13', '2026-03-31', 2, 9541.4200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (53, 53, 1, 1, '2024-07-01', '2024-07-01', '2027-06-24', 2, 1992.7700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (54, 54, 1, 1, '2025-02-17', '2025-02-17', '2027-05-01', 2, 8517.0300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (55, 55, 1, 1, '2024-08-21', '2024-08-21', '2027-03-20', 2, 1064.2200, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (56, 56, 1, 1, '2024-06-10', '2024-06-10', '2025-12-08', 2, 2929.6700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (57, 57, 1, 1, '2025-01-24', '2025-01-24', '2026-10-25', 2, 8682.7800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (58, 58, 1, 1, '2025-04-02', '2025-04-02', '2025-12-27', 2, 6249.2300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (59, 59, 1, 1, '2024-09-19', '2024-09-19', '2027-04-05', 2, 6643.8200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (60, 60, 1, 1, '2025-04-05', '2025-04-05', '2027-12-29', 2, 2349.1100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (61, 61, 1, 1, '2025-10-22', '2025-10-22', '2028-03-17', 2, 6125.9100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (62, 62, 1, 1, '2024-10-19', '2024-10-19', '2026-05-23', 2, 6683.2600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (63, 63, 1, 1, '2025-06-26', '2025-06-26', '2025-07-10', 2, 5580.5500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (64, 64, 1, 1, '2024-12-18', '2024-12-18', '2027-10-05', 2, 4628.0800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (65, 65, 1, 1, '2025-12-04', '2025-12-04', '2025-08-08', 2, 5583.3600, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (66, 66, 1, 1, '2026-02-12', '2026-02-12', '2026-10-04', 2, 7383.3600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (67, 67, 1, 1, '2024-12-12', '2024-12-12', '2027-11-26', 2, 4857.9900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (68, 68, 1, 1, '2025-06-20', '2025-06-20', '2027-08-11', 2, 1565.5400, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (69, 69, 1, 1, '2024-06-22', '2024-06-22', '2026-10-06', 2, 2777.8800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (70, 70, 1, 1, '2026-03-11', '2026-03-11', '2026-11-28', 2, 5179.8700, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (71, 71, 1, 1, '2024-09-21', '2024-09-21', '2027-03-25', 2, 866.3100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (72, 72, 1, 1, '2024-11-08', '2024-11-08', '2025-07-30', 2, 2851.9200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (73, 73, 1, 1, '2025-04-19', '2025-04-19', '2025-09-08', 2, 7120.7300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (74, 74, 1, 1, '2024-09-04', '2024-09-04', '2025-06-01', 2, 3993.8200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (75, 75, 1, 1, '2024-12-10', '2024-12-10', '2028-01-26', 2, 1719.8800, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (76, 76, 1, 1, '2024-03-31', '2024-03-31', '2026-01-03', 2, 4882.4800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (77, 77, 1, 1, '2025-05-27', '2025-05-27', '2027-11-27', 2, 4240, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (78, 78, 1, 1, '2024-09-19', '2024-09-19', '2028-02-05', 2, 8304.5500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (79, 79, 1, 1, '2025-05-12', '2025-05-12', '2025-08-31', 2, 5423.6700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (80, 80, 1, 1, '2025-12-13', '2025-12-13', '2027-11-14', 2, 8466.5300, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (81, 81, 1, 1, '2025-06-27', '2025-06-27', '2027-10-15', 2, 198.2200, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (82, 82, 1, 1, '2024-07-10', '2024-07-10', '2027-07-13', 2, 1662.3100, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (83, 83, 1, 1, '2025-03-27', '2025-03-27', '2026-11-16', 2, 9697, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (84, 84, 1, 1, '2025-04-25', '2025-04-25', '2026-05-05', 2, 3319.9300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (85, 85, 1, 1, '2024-10-25', '2024-10-25', '2028-01-30', 2, 6823.7500, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (86, 86, 1, 1, '2026-03-25', '2026-03-25', '2026-06-18', 2, 303.4900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (87, 87, 1, 1, '2025-06-03', '2025-06-03', '2028-01-30', 2, 2444.8500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (88, 88, 1, 1, '2025-11-27', '2025-11-27', '2027-05-21', 2, 6870.6900, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (89, 89, 1, 1, '2026-01-18', '2026-01-18', '2025-12-24', 2, 3668.5800, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (90, 90, 1, 1, '2024-11-10', '2024-11-10', '2025-06-18', 2, 1157.3000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (91, 91, 1, 1, '2025-04-13', '2025-04-13', '2027-12-05', 2, 9739.4700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (92, 92, 1, 1, '2025-02-20', '2025-02-20', '2028-02-18', 2, 4915.6900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (93, 93, 1, 1, '2025-11-15', '2025-11-15', '2027-01-06', 2, 9816.4900, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (94, 94, 1, 1, '2026-02-08', '2026-02-08', '2027-01-08', 2, 6533.7400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (95, 95, 1, 1, '2024-07-03', '2024-07-03', '2027-10-17', 2, 573.6200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (96, 96, 1, 1, '2026-02-12', '2026-02-12', '2026-04-25', 2, 7752.5200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (97, 97, 1, 1, '2025-07-23', '2025-07-23', '2026-06-05', 2, 6069.1200, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (98, 98, 1, 1, '2025-10-05', '2025-10-05', '2026-03-14', 2, 6319.9900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (99, 99, 1, 1, '2026-03-25', '2026-03-25', '2028-03-06', 2, 4596.4100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (100, 100, 1, 1, '2025-10-23', '2025-10-23', '2027-09-29', 2, 4928.5500, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (101, 101, 1, 1, '2025-10-06', '2025-10-06', '2028-01-10', 2, 7547.4600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (102, 102, 1, 1, '2025-09-04', '2025-09-04', '2026-12-29', 2, 4846.3900, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (103, 103, 1, 1, '2025-09-04', '2025-09-04', '2026-04-14', 2, 1399.7800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (104, 104, 1, 1, '2024-07-30', '2024-07-30', '2026-10-31', 2, 1860.8200, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (105, 105, 1, 1, '2025-07-04', '2025-07-04', '2027-06-14', 2, 2116.0200, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (106, 106, 1, 1, '2025-01-04', '2025-01-04', '2026-03-22', 2, 7607.2700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (107, 107, 1, 1, '2024-11-28', '2024-11-28', '2027-08-26', 2, 9838.7000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (108, 108, 1, 1, '2026-03-04', '2026-03-04', '2026-10-12', 2, 3822.4300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (109, 109, 1, 1, '2025-11-05', '2025-11-05', '2025-05-04', 2, 7363.3900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (110, 110, 1, 1, '2025-05-08', '2025-05-08', '2026-08-14', 2, 6783.1900, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (111, 111, 1, 1, '2026-01-31', '2026-01-31', '2026-08-27', 2, 7674.4800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (112, 112, 1, 1, '2024-04-24', '2024-04-24', '2025-10-09', 2, 9982.3000, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (113, 113, 1, 1, '2025-02-14', '2025-02-14', '2026-03-08', 2, 3102.4100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (114, 114, 1, 1, '2025-11-25', '2025-11-25', '2026-03-01', 2, 3852.7600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (115, 115, 1, 1, '2024-04-24', '2024-04-24', '2027-11-09', 2, 7802.4200, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (116, 116, 1, 1, '2025-08-12', '2025-08-12', '2028-02-18', 2, 4615.4900, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (117, 117, 1, 1, '2024-05-22', '2024-05-22', '2028-03-13', 2, 3028.7500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (118, 118, 1, 1, '2025-09-30', '2025-09-30', '2027-09-23', 2, 3361.8500, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (119, 119, 1, 1, '2026-03-10', '2026-03-10', '2025-12-10', 2, 6241.2600, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (120, 120, 1, 1, '2025-08-10', '2025-08-10', '2028-01-14', 2, 5868.3800, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (121, 121, 1, 1, '2026-01-05', '2026-01-05', '2027-10-07', 2, 2294.3900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (122, 122, 1, 1, '2026-01-29', '2026-01-29', '2025-04-17', 2, 5389.8900, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (123, 123, 1, 1, '2024-04-05', '2024-04-05', '2027-03-19', 2, 5027.1400, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (124, 124, 1, 1, '2024-05-29', '2024-05-29', '2026-05-18', 2, 1304.3400, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (125, 125, 1, 1, '2026-01-06', '2026-01-06', '2027-02-04', 2, 8722.5600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (126, 126, 1, 1, '2025-07-22', '2025-07-22', '2025-08-14', 2, 9613.8700, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (127, 127, 1, 1, '2024-12-13', '2024-12-13', '2027-02-26', 2, 5200.8700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (128, 128, 1, 1, '2026-01-15', '2026-01-15', '2027-09-07', 2, 9582.3100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (129, 129, 1, 1, '2024-10-16', '2024-10-16', '2025-05-07', 2, 2175, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (130, 130, 1, 1, '2025-03-09', '2025-03-09', '2027-03-25', 2, 2030.6900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (131, 131, 1, 1, '2025-10-24', '2025-10-24', '2026-04-14', 2, 2987.0900, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (132, 132, 1, 1, '2026-01-25', '2026-01-25', '2027-12-28', 2, 6465, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (133, 133, 1, 1, '2024-07-28', '2024-07-28', '2025-10-30', 2, 7279.1100, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (134, 134, 1, 1, '2025-12-04', '2025-12-04', '2027-12-22', 2, 8019.4800, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (135, 135, 1, 1, '2024-12-19', '2024-12-19', '2027-09-01', 2, 3822.8400, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (136, 136, 1, 1, '2025-01-12', '2025-01-12', '2026-12-08', 2, 4810.4300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (137, 137, 1, 1, '2024-11-09', '2024-11-09', '2027-01-10', 2, 147.3300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (138, 138, 1, 1, '2025-07-24', '2025-07-24', '2027-09-07', 2, 1157.4300, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (139, 139, 1, 1, '2024-11-01', '2024-11-01', '2026-05-10', 2, 104.3700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (140, 140, 1, 1, '2025-04-03', '2025-04-03', '2026-01-03', 2, 9292.7700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (141, 141, 1, 1, '2025-11-03', '2025-11-03', '2026-02-20', 2, 3494.4900, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (142, 142, 1, 1, '2025-09-29', '2025-09-29', '2026-09-14', 2, 5617.4900, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (143, 143, 1, 1, '2026-02-03', '2026-02-03', '2025-08-15', 2, 9732.2700, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (144, 144, 1, 1, '2025-05-13', '2025-05-13', '2025-05-17', 2, 5728.8300, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (145, 145, 1, 1, '2025-12-14', '2025-12-14', '2026-08-05', 2, 6006.2500, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (146, 146, 1, 1, '2024-06-08', '2024-06-08', '2027-02-23', 2, 2006.3700, 'N', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (147, 147, 1, 1, '2024-05-08', '2024-05-08', '2025-08-13', 2, 353.4000, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (148, 148, 1, 1, '2026-02-07', '2026-02-07', '2026-06-21', 2, 8923.4300, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (149, 149, 1, 1, '2025-04-25', '2025-04-25', '2027-04-05', 2, 8669.3100, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (150, 150, 1, 1, '2026-01-15', '2026-01-15', '2027-06-30', 2, 4328.9600, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (151, 151, 1, 1, '2026-03-17', '2026-03-17', '2026-08-22', 2, 3221.0900, 'R', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (152, 152, 1, 1, '2026-02-19', '2026-02-19', '2026-11-15', 2, 3749.3600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (153, 153, 1, 1, '2024-07-18', '2024-07-18', '2026-09-08', 2, 1364.4600, 'R', 0, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (154, 154, 1, 1, '2025-10-26', '2025-10-26', '2027-08-20', 2, 1434.2100, 'N', 1, '2026-03-26', 1);
  INSERT INTO tblPolicy (PolicyID, FamilyID, ProdID, OfficerID, EnrollDate, StartDate, ExpiryDate, PolicyStatus, PolicyValue, PolicyStage, SelfRenewed, ValidityFrom, AuditUserID) VALUES (155, 155, 1, 1, '2025-10-29', '2025-10-29', '2025-04-02', 2, 3169.2900, 'N', 1, '2026-03-26', 1);
  -- tblInsureePolicy
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (1, 1, 1, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (2, 2, 2, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (3, 3, 3, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (4, 4, 4, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (5, 5, 5, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (6, 6, 6, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (7, 7, 7, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (8, 8, 8, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (9, 9, 9, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (10, 10, 10, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (11, 11, 11, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (12, 12, 12, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (13, 13, 13, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (14, 14, 14, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (15, 15, 15, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (16, 16, 16, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (17, 17, 17, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (18, 18, 18, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (19, 19, 19, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (20, 20, 20, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (21, 21, 21, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (22, 22, 22, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (23, 23, 23, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (24, 24, 24, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (25, 25, 25, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (26, 26, 26, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (27, 27, 27, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (28, 28, 28, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (29, 29, 29, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (30, 30, 30, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (31, 31, 31, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (32, 32, 32, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (33, 33, 33, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (34, 34, 34, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (35, 35, 35, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (36, 36, 36, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (37, 37, 37, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (38, 38, 38, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (39, 39, 39, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (40, 40, 40, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (41, 41, 41, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (42, 42, 42, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (43, 43, 43, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (44, 44, 44, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (45, 45, 45, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (46, 46, 46, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (47, 47, 47, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (48, 48, 48, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (49, 49, 49, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (50, 50, 50, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (51, 51, 51, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (52, 52, 52, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (53, 53, 53, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (54, 54, 54, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (55, 55, 55, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (56, 56, 56, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (57, 57, 57, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (58, 58, 58, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (59, 59, 59, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (60, 60, 60, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (61, 61, 61, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (62, 62, 62, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (63, 63, 63, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (64, 64, 64, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (65, 65, 65, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (66, 66, 66, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (67, 67, 67, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (68, 68, 68, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (69, 69, 69, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (70, 70, 70, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (71, 71, 71, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (72, 72, 72, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (73, 73, 73, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (74, 74, 74, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (75, 75, 75, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (76, 76, 76, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (77, 77, 77, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (78, 78, 78, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (79, 79, 79, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (80, 80, 80, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (81, 81, 81, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (82, 82, 82, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (83, 83, 83, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (84, 84, 84, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (85, 85, 85, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (86, 86, 86, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (87, 87, 87, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (88, 88, 88, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (89, 89, 89, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (90, 90, 90, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (91, 91, 91, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (92, 92, 92, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (93, 93, 93, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (94, 94, 94, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (95, 95, 95, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (96, 96, 96, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (97, 97, 97, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (98, 98, 98, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (99, 99, 99, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (100, 100, 100, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (101, 101, 101, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (102, 102, 102, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (103, 103, 103, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (104, 104, 104, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (105, 105, 105, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (106, 106, 106, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (107, 107, 107, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (108, 108, 108, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (109, 109, 109, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (110, 110, 110, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (111, 111, 111, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (112, 112, 112, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (113, 113, 113, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (114, 114, 114, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (115, 115, 115, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (116, 116, 116, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (117, 117, 117, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (118, 118, 118, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (119, 119, 119, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (120, 120, 120, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (121, 121, 121, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (122, 122, 122, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (123, 123, 123, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (124, 124, 124, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (125, 125, 125, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (126, 126, 126, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (127, 127, 127, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (128, 128, 128, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (129, 129, 129, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (130, 130, 130, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (131, 131, 131, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (132, 132, 132, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (133, 133, 133, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (134, 134, 134, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (135, 135, 135, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (136, 136, 136, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (137, 137, 137, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (138, 138, 138, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (139, 139, 139, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (140, 140, 140, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (141, 141, 141, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (142, 142, 142, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (143, 143, 143, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (144, 144, 144, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (145, 145, 145, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (146, 146, 146, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (147, 147, 147, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (148, 148, 148, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (149, 149, 149, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (150, 150, 150, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (151, 151, 151, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (152, 152, 152, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (153, 153, 153, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (154, 154, 154, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  INSERT INTO tblInsureePolicy (InsureePolicyId, InsureeId, PolicyId, EnrollmentDate, StartDate, ExpiryDate, ValidityFrom) VALUES (155, 155, 155, '2026-03-26', '2026-03-26', '2027-03-26', '2026-03-26');
  -- tblPremium
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (1, 1, 300, 'RCPT0001', '2026-01-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (2, 2, 300, 'RCPT0002', '2025-10-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (3, 3, 300, 'RCPT0003', '2026-03-05', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (4, 4, 300, 'RCPT0004', '2026-01-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (5, 5, 300, 'RCPT0005', '2025-12-15', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (6, 6, 300, 'RCPT0006', '2025-12-17', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (7, 7, 300, 'RCPT0007', '2026-02-28', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (8, 8, 300, 'RCPT0008', '2026-03-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (9, 9, 300, 'RCPT0009', '2026-02-13', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (10, 10, 300, 'RCPT0010', '2026-03-19', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (11, 11, 300, 'RCPT0011', '2025-12-12', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (12, 12, 300, 'RCPT0012', '2025-10-05', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (13, 13, 300, 'RCPT0013', '2026-01-05', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (14, 14, 300, 'RCPT0014', '2025-11-15', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (15, 15, 300, 'RCPT0015', '2026-01-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (16, 16, 300, 'RCPT0016', '2025-11-11', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (17, 17, 300, 'RCPT0017', '2026-01-20', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (18, 18, 300, 'RCPT0018', '2025-10-29', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (19, 19, 300, 'RCPT0019', '2026-03-10', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (20, 20, 300, 'RCPT0020', '2025-11-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (21, 21, 300, 'RCPT0021', '2026-02-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (22, 22, 300, 'RCPT0022', '2025-10-02', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (23, 23, 300, 'RCPT0023', '2025-11-25', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (24, 24, 300, 'RCPT0024', '2025-11-02', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (25, 25, 300, 'RCPT0025', '2026-02-16', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (26, 26, 300, 'RCPT0026', '2025-10-15', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (27, 27, 300, 'RCPT0027', '2026-03-26', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (28, 28, 300, 'RCPT0028', '2025-12-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (29, 29, 300, 'RCPT0029', '2026-01-01', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (30, 30, 300, 'RCPT0030', '2025-10-19', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (31, 31, 300, 'RCPT0031', '2025-10-11', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (32, 32, 300, 'RCPT0032', '2025-11-10', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (33, 33, 300, 'RCPT0033', '2026-02-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (34, 34, 300, 'RCPT0034', '2025-11-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (35, 35, 300, 'RCPT0035', '2025-11-28', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (36, 36, 300, 'RCPT0036', '2025-10-20', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (37, 37, 300, 'RCPT0037', '2025-11-17', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (38, 38, 300, 'RCPT0038', '2026-01-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (39, 39, 300, 'RCPT0039', '2025-12-26', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (40, 40, 300, 'RCPT0040', '2026-02-16', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (41, 41, 300, 'RCPT0041', '2026-01-09', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (42, 42, 300, 'RCPT0042', '2026-03-23', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (43, 43, 300, 'RCPT0043', '2025-10-14', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (44, 44, 300, 'RCPT0044', '2025-10-01', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (45, 45, 300, 'RCPT0045', '2026-01-20', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (46, 46, 300, 'RCPT0046', '2026-01-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (47, 47, 300, 'RCPT0047', '2026-02-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (48, 48, 300, 'RCPT0048', '2025-10-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (49, 49, 300, 'RCPT0049', '2026-02-09', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (50, 50, 300, 'RCPT0050', '2025-10-13', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (51, 51, 300, 'RCPT0051', '2026-03-01', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (52, 52, 300, 'RCPT0052', '2026-01-16', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (53, 53, 300, 'RCPT0053', '2026-01-01', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (54, 54, 300, 'RCPT0054', '2026-02-25', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (55, 55, 300, 'RCPT0055', '2026-02-18', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (56, 56, 300, 'RCPT0056', '2026-01-27', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (57, 57, 300, 'RCPT0057', '2026-01-31', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (58, 58, 300, 'RCPT0058', '2026-01-04', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (59, 59, 300, 'RCPT0059', '2025-10-18', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (60, 60, 300, 'RCPT0060', '2025-11-12', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (61, 61, 300, 'RCPT0061', '2025-11-14', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (62, 62, 300, 'RCPT0062', '2025-12-13', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (63, 63, 300, 'RCPT0063', '2026-02-16', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (64, 64, 300, 'RCPT0064', '2025-11-24', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (65, 65, 300, 'RCPT0065', '2025-12-10', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (66, 66, 300, 'RCPT0066', '2025-12-29', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (67, 67, 300, 'RCPT0067', '2026-01-21', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (68, 68, 300, 'RCPT0068', '2026-03-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (69, 69, 300, 'RCPT0069', '2026-02-09', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (70, 70, 300, 'RCPT0070', '2025-11-09', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (71, 71, 300, 'RCPT0071', '2025-10-17', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (72, 72, 300, 'RCPT0072', '2026-03-13', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (73, 73, 300, 'RCPT0073', '2026-03-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (74, 74, 300, 'RCPT0074', '2025-10-22', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (75, 75, 300, 'RCPT0075', '2025-12-30', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (76, 76, 300, 'RCPT0076', '2025-11-12', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (77, 77, 300, 'RCPT0077', '2025-10-25', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (78, 78, 300, 'RCPT0078', '2025-12-23', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (79, 79, 300, 'RCPT0079', '2025-12-27', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (80, 80, 300, 'RCPT0080', '2026-03-14', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (81, 81, 300, 'RCPT0081', '2025-11-25', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (82, 82, 300, 'RCPT0082', '2025-10-31', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (83, 83, 300, 'RCPT0083', '2026-02-13', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (84, 84, 300, 'RCPT0084', '2025-12-22', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (85, 85, 300, 'RCPT0085', '2025-10-21', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (86, 86, 300, 'RCPT0086', '2025-10-21', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (87, 87, 300, 'RCPT0087', '2026-03-11', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (88, 88, 300, 'RCPT0088', '2026-01-02', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (89, 89, 300, 'RCPT0089', '2026-02-27', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (90, 90, 300, 'RCPT0090', '2025-10-06', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (91, 91, 300, 'RCPT0091', '2026-02-28', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (92, 92, 300, 'RCPT0092', '2026-02-28', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (93, 93, 300, 'RCPT0093', '2025-10-21', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (94, 94, 300, 'RCPT0094', '2025-12-28', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (95, 95, 300, 'RCPT0095', '2026-01-25', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (96, 96, 300, 'RCPT0096', '2025-12-25', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (97, 97, 300, 'RCPT0097', '2026-01-24', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (98, 98, 300, 'RCPT0098', '2025-10-31', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (99, 99, 300, 'RCPT0099', '2026-03-15', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (100, 100, 300, 'RCPT0100', '2025-12-21', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (101, 101, 300, 'RCPT0101', '2025-11-11', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (102, 102, 300, 'RCPT0102', '2026-01-01', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (103, 103, 300, 'RCPT0103', '2026-03-16', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (104, 104, 300, 'RCPT0104', '2026-03-16', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (105, 105, 300, 'RCPT0105', '2026-01-04', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (106, 106, 300, 'RCPT0106', '2026-01-14', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (107, 107, 300, 'RCPT0107', '2026-01-13', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (108, 108, 300, 'RCPT0108', '2025-10-01', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (109, 109, 300, 'RCPT0109', '2026-02-15', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (110, 110, 300, 'RCPT0110', '2026-03-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (111, 111, 300, 'RCPT0111', '2025-12-07', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (112, 112, 300, 'RCPT0112', '2025-11-21', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (113, 113, 300, 'RCPT0113', '2026-02-18', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (114, 114, 300, 'RCPT0114', '2025-12-01', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (115, 115, 300, 'RCPT0115', '2026-01-14', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (116, 116, 300, 'RCPT0116', '2025-10-21', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (117, 117, 300, 'RCPT0117', '2025-10-02', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (118, 118, 300, 'RCPT0118', '2025-11-11', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (119, 119, 300, 'RCPT0119', '2025-12-19', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (120, 120, 300, 'RCPT0120', '2025-11-19', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (121, 121, 300, 'RCPT0121', '2025-10-15', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (122, 122, 300, 'RCPT0122', '2025-10-22', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (123, 123, 300, 'RCPT0123', '2026-03-17', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (124, 124, 300, 'RCPT0124', '2025-12-06', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (125, 125, 300, 'RCPT0125', '2025-11-13', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (126, 126, 300, 'RCPT0126', '2026-01-17', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (127, 127, 300, 'RCPT0127', '2025-10-08', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (128, 128, 300, 'RCPT0128', '2026-03-10', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (129, 129, 300, 'RCPT0129', '2026-01-21', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (130, 130, 300, 'RCPT0130', '2025-10-12', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (131, 131, 300, 'RCPT0131', '2025-10-05', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (132, 132, 300, 'RCPT0132', '2025-12-31', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (133, 133, 300, 'RCPT0133', '2025-12-09', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (134, 134, 300, 'RCPT0134', '2025-12-25', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (135, 135, 300, 'RCPT0135', '2026-02-01', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (136, 136, 300, 'RCPT0136', '2025-10-04', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (137, 137, 300, 'RCPT0137', '2026-01-15', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (138, 138, 300, 'RCPT0138', '2026-02-26', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (139, 139, 300, 'RCPT0139', '2025-10-15', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (140, 140, 300, 'RCPT0140', '2025-10-22', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (141, 141, 300, 'RCPT0141', '2025-11-19', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (142, 142, 300, 'RCPT0142', '2025-10-23', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (143, 143, 300, 'RCPT0143', '2025-10-12', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (144, 144, 300, 'RCPT0144', '2026-01-16', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (145, 145, 300, 'RCPT0145', '2026-01-04', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (146, 146, 300, 'RCPT0146', '2025-10-28', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (147, 147, 300, 'RCPT0147', '2026-03-22', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (148, 148, 300, 'RCPT0148', '2026-03-02', 'B', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (149, 149, 300, 'RCPT0149', '2026-02-09', 'M', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (150, 150, 300, 'RCPT0150', '2025-10-30', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (151, 151, 300, 'RCPT0151', '2025-10-21', 'C', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (152, 152, 300, 'RCPT0152', '2026-03-09', 'M', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (153, 153, 300, 'RCPT0153', '2025-11-21', 'B', 1, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (154, 154, 300, 'RCPT0154', '2026-01-10', 'C', 0, '2026-03-26', 1);
  INSERT INTO tblPremium (PremiumId, PolicyID, Amount, Receipt, PayDate, PayType, isPhotoFee, ValidityFrom, AuditUserID) VALUES (155, 155, 300, 'RCPT0155', '2026-01-16', 'M', 0, '2026-03-26', 1);
  -- tblPolicyRenewals
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (1, '2026-02-24', '2026-03-26', 1, 1, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (2, '2026-02-24', '2026-03-26', 2, 2, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (3, '2026-02-24', '2026-03-26', 3, 3, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (4, '2026-02-24', '2026-03-26', 4, 4, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (5, '2026-02-24', '2026-03-26', 5, 5, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (6, '2026-02-24', '2026-03-26', 6, 6, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (7, '2026-02-24', '2026-03-26', 7, 7, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (8, '2026-02-24', '2026-03-26', 8, 8, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (9, '2026-02-24', '2026-03-26', 9, 9, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (10, '2026-02-24', '2026-03-26', 10, 10, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (11, '2026-02-24', '2026-03-26', 11, 11, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (12, '2026-02-24', '2026-03-26', 12, 12, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (13, '2026-02-24', '2026-03-26', 13, 13, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (14, '2026-02-24', '2026-03-26', 14, 14, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (15, '2026-02-24', '2026-03-26', 15, 15, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (16, '2026-02-24', '2026-03-26', 16, 16, 1, 0, 2, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (17, '2026-02-24', '2026-03-26', 17, 17, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (18, '2026-02-24', '2026-03-26', 18, 18, 1, 0, 3, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (19, '2026-02-24', '2026-03-26', 19, 19, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (20, '2026-02-24', '2026-03-26', 20, 20, 1, 0, 0, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (21, '2026-02-24', '2026-03-26', 21, 21, 1, 0, 1, 1, '2026-03-26');
  INSERT INTO tblPolicyRenewals (RenewalID, RenewalPromptDate, RenewalDate, InsureeID, PolicyID, NewProdID, RenewalWarnings, SMSStatus, NewOfficerID, ValidityFrom) VALUES (22, '2026-02-24', '2026-03-26', 22, 22, 1, 0, 1, 1, '2026-03-26');
