security_center_assessment_policy_variables = {
  "security_center_assessment_policy1" = {
    description             = "Ploceus security center assessment policy"
    display_name            = "ploceussecuritycenterpolicy000001"
    severity                = "High"
    categories              = ["Unknown", "Compute", "Data", "IdentityAndAccess", "IoT", "Networking"]
    implementation_effort   = "High"
    remediation_description = "A security issue has happend in the ploceus"
    threats                 = ["AccountBreach", "DataExfiltration", "DataSpillage", "DenialOfService", "ElevationOfPrivilege", "MaliciousInsider", "MissingCoverage", "ThreatResistance"]
    user_impact             = "High"
  }
}
